`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 09:40:04
// Design Name: 
// Module Name: Gate_logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ��Ϸ���������߼�
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*module Gate_logic1(
    input ena,                  // ʹ���ͺţ�ÿ�ο�ʼע���ȳ�ʼ����
    input clk,                  // ϵͳʱ��
    input rst_n,                // ���㣬�͵�ƽ��Ч
    input next_s,               // ��ʼ����Ǻţ��ߵ�ƽ������Ƶ��Ϊ60Hz��
    input [2:0] operation,      // �����źţ���ת����ת����ť���ߵ�ƽ��Ч
    
    output [1:0] character,     // ��ɫ��Ϣ����ɫ״̬����ɫѡ��
    output [26:0] offset,       // ������ƫ����0-999999
    output [3:0] speed,         // �ٶȣ�16�ݶ�
    output [9:0] obstacle,     // �ϰ���λ�ã�0λ���Ƿ����ϰ���
    output [7:0] obstimes,     // �ϰ���λ��
    
    output game_over,           // ��Ϸ�������ߵ�ƽ��Ч
    output game_win,             // ��Ϸ�ɹ���1���ɹ���0��ʧ�ܣ�
    
    output [14:0] phi,//���ڲ���
    output [23:0] off //���ڲ���
    );
parameter _MAX_OFFSET = 1000_0000; // ���������ƫ�ƽ�
//��Ϸ������Ƶ��Ϊ60Hz��
parameter _START_P = 600;    // ��ʼʱ���
parameter _BETA = 4096;      // beta�����߽ǣ���׼ֵ4096��
parameter _DEL_PHI = 100;      // phi�Ƕ���������׼ֵ4096��
parameter _BAS_PHI = 4096;   // �ǶȻ�׼ֵ
parameter _MAX_PHI = 16000;  // ���phi
parameter _MIN_PHI = -16000; // ��Сphi

parameter _BAS_SPEED = 64;   // �ٶȵ�λ��
parameter _BAS_TIME = 64;    // ʱ�����Ż�׼ֵ
parameter _SPEED_LEVEL = 16; // �ٶ���16���ȼ�
parameter _CHARA_XPOS = 512; // ��ɫˮƽλ��
parameter _CHARA_WIDTH = 200; // ��ɫˮƽ���
//״̬�����
reg over_flag;      // ��Ϸ�������
reg win_flag;       // ��Ϸʤ�����
//��Ϸ����
reg [1:0] Charac;     // ��ɫ
reg [22:0] Time;      // ʱ��t�����ֵ131072 * 64��
reg signed [15:0] Phi;       // ��ɫƫ�ƽ�phi����׼ֵ4096��ȡֵ-16382~16381��,��
reg signed [23:0] Offset;    // ��ɫƫ����s�����ֵ��131072 * 64��,��
reg [22:0] Distance;  // ����ƫ����d�����ֵ131072 * 64��
reg [9:0] Speed;      // ��ɫ�н��ٶ�v����׼����64��
reg [9:0] Obstacle;  // �ϰ���λ��
reg [7:0] Obstimes;  // �ϰ����С

// ��������
always @(posedge clk or posedge next_s or negedge rst_n) begin
if (ena) begin
    if (!rst_n) begin // ��ʼ��
        Charac <= 2'b00;
        Time <= _START_P * _BAS_TIME;
        Phi <= 0;
        Offset <= 0;//_START_P * _BAS_TIME;
        Distance <= _BETA * _START_P * _BAS_TIME / _BAS_PHI;
        Speed <= _BAS_SPEED;
        Obstacle <= 0;
        win_flag <= 0;
        over_flag <= 0;
    end // end of rst_n
    else
    if (next_s) begin // �������
        // �������
        casex(operation)
            3'bxx1: Charac[1] <= 1;// ~Charac[1]; // �ı��ɫ״̬
            3'b1x0: if (Charac[1] && Phi < _MAX_PHI) begin      // ��ת���
                        Phi <= Phi + _DEL_PHI * (speed + 1); // ��תΪ��
                    end
            3'b010: if (Charac[1] && $signed(Phi) > $signed(_MIN_PHI)) begin     // ��ת���
                        Phi <= Phi - _DEL_PHI * (speed + 1); // ��תΪ��
                    end
            default: Charac[1] <= 0;
        endcase
        
        // ����ɫΪ����̬ʱ�������߻ع�
        if (!Charac[1]) begin
            if (Phi > Offset / Time * _BAS_PHI)
                Phi <= Phi - 2 * _DEL_PHI * (speed + 1);
            else
                Phi <= Phi + 2 * _DEL_PHI * (speed + 1);
        end
        
        // ��������
        Time <= Time + Speed * _BAS_TIME / _BAS_SPEED; // ����ʱ��
        Distance <= _BETA * Time / _BAS_TIME; // ���������߾���
        if (Phi[15]) begin // ����������
            Offset <= Offset - ($signed(~Phi) * Speed * _BAS_TIME) / (_BAS_PHI * _BAS_SPEED);// ���½�ɫƫ��ֵ
        end else begin
            Offset <= Offset + (Phi * Speed * _BAS_TIME) / (_BAS_PHI * _BAS_SPEED);// ���½�ɫƫ��ֵ
        end
        Speed <= _BAS_SPEED * (_SPEED_LEVEL / 4) * (Phi[15] ? $signed(~Phi) : Phi) / _BAS_PHI + _BAS_SPEED;// ���µ�ǰ����
        Obstacle <= 0;
        
        // �ж���Ϸflag
        if ((Offset[23] ? $signed(~Offset) : Offset) >= Distance) begin win_flag = 1'b1; over_flag = 1'b1; end
        if (Obstacle[0] && Obstacle[12:1] <= _CHARA_XPOS) begin over_flag = 1'b1; end
        
    end // end of next_s
end // end of ena
end // end of always

//�����ֵ
assign character = Charac;                      // ��ɫ��Ϣ
assign offset = (Offset[23] ? $signed(~Offset >> 10) : (Offset >> 10)) * _MAX_OFFSET / (Distance >> 10);     // ������ƫ����0-99999999
assign speed = Speed / _BAS_SPEED;          // �ٶȣ�16�ݶ�0-15
assign obstacle = Obstacle;                     // �ϰ���λ��
assign game_over = over_flag;           // ��Ϸ�������ߵ�ƽ��Ч
assign game_win = win_flag;             // ��Ϸ�ɹ����ߵ�ƽ��Ч

//����
assign phi = Phi;
assign off = Offset;

endmodule*/


module Gate_logic2(
    input clk,                  // ϵͳʱ��
    input rst_n,                // ���㣬�͵�ƽ��Ч
    input next_s,               // ��ʼ����Ǻţ��ߵ�ƽ������Ƶ��Ϊ60Hz��
    input [2:0] operation,      // �����źţ���ת����ת����ť���ߵ�ƽ��Ч
    
    output character,           // ��ɫ��Ϣ����ɫ״̬����ɫѡ��
    output [26:0] offset,       // ������ƫ����0-999999
    output [3:0] speed,         // �ٶȣ�15�ݶ�
    output [9:0] obstacle,     // �ϰ���λ�ã�0���ʾ���ϰ���
    output [7:0] obstimes,     // �ϰ���λ��
    output [9:0] progress,      // ��ǰʱ�����0-1024
    output [8:0] offgress,      // ��ǰƫ�ƽ���
    
    output game_over,           // ��Ϸ�������ߵ�ƽ��Ч
    output game_win,             // ��Ϸ�ɹ���1���ɹ���0��ʧ�ܣ�
    
    output [14:0] phi,//���ڲ���
    output [23:0] off //���ڲ���
    );
parameter _MAX_OFFSET = 1000_0000; // ���������ƫ�ƽ�
parameter _DIAMETER = 21600;       // ����ֱ��6min��15bit
parameter _DISTINATION = 18000;    // �����յ�5min
//��Ϸ������Ƶ��Ϊ60Hz��
parameter _START_P = 1000;    // ��ʼʱ���10s
parameter _DEL_PHI = 1;      // phi�Ƕ���������׼ֵ256��
parameter _BAS_PHI = 1024;    // �ǶȻ�׼ֵ256��10bit
parameter _MAX_PHI = 16000;   // ���phi��15bit
parameter _MIN_PHI = -16000;  // ��Сphi��15bit

parameter _BAS_SPEED = 64;   // �ٶȵ�λ��
parameter _BAS_TIME = 64;    // ʱ�����Ż�׼ֵ
parameter _SPEED_LEVEL = 16; // �ٶ���16���ȼ�
parameter _BACK_TIMES = 3;   // ��������������

parameter _SCREEN_WIDTH = 1024; // ��Ļ���
parameter _CHARA_XPOS = 512; // ��ɫˮƽλ��
parameter _CHARA_WIDTH = 200; // ��ɫˮƽ���
parameter _OBST_WID = 2048;   // �ϰ���֮���ˮƽ����
parameter _OBST_HEI = 2048;   // �ϰ���֮�����ֱ����
parameter _OBST_BAS = 200;    // �ϰ����׼���
//״̬�����
reg over_flag;      // ��Ϸ�������
reg win_flag;       // ��Ϸʤ�����
//��Ϸ����
reg Charac;           // ��ɫ״̬
reg [21:0] Time;      // ʱ��t�����ֵ32768 * 64��
reg signed [14:0] Phi;       // ��ɫƫ�ƽ�phi����׼ֵ1024��ȡֵ-16384~16383��,��
reg signed [21:0] Offset;    // ��ɫƫ����s�����ֵ��32768 * 64��,��
reg [20:0] Distance;  // ����ƫ����d�����ֵ32768 * 64��
reg [9:0] Speed;      // ��ɫ�н��ٶ�v����׼����64��
reg [9:0] Obstacle;   // �ϰ���λ��1-1023
reg [7:0] Obstimes;   // �ϰ����С50-255

// ʵʱ��������ƫ����
wire [20:0] Dist;  // ����ƫ����d�����ֵ32768 * 64��
calDistance #(_DIAMETER, _BAS_TIME) dis_uut(Time, Dist);
//assign Distance = Time;
//�����ϰ���λ��
wire [9:0] Obsta;   // �ϰ���λ��1-1023
wire [7:0] Obstm;   // �ϰ����С50-255
setObstacle #(_BAS_PHI, _BAS_TIME, _SCREEN_WIDTH, _CHARA_XPOS, _OBST_WID, _OBST_HEI, _OBST_BAS)
            obst_uut(Time, Offset, Phi, Obsta, Obstm);

// ��ʼ��
initial begin
    Charac = 0;
    Time = _START_P * _BAS_TIME;
    Phi = 0;
    Offset = 0;
    Distance = 0;
    Speed = _BAS_SPEED;
    Obstacle <= 0;
    Obstimes <= 0;
    win_flag <= 0;
    over_flag <= 0;
end

// ��������
always @(posedge next_s or negedge rst_n) begin
    if (!rst_n) begin // ��ʼ��
        Charac <= 0;
        Time <= _START_P * _BAS_TIME;
        Phi <= 0;
        Offset <= 0;//_START_P * _BAS_TIME;
        Speed <= _BAS_SPEED;
        win_flag <= 0;
        over_flag <= 0;
    end // end of rst_n
    else begin
        if (next_s && !over_flag) begin // �������
            // �������
            if (operation[0])
                Charac <= 1'b1;
            else
                Charac <= 1'b0;
            casex(operation[2:1])
                2'b1x: if (Charac && Phi < _MAX_PHI) begin      // ��ת���
                            Phi <= Phi + _DEL_PHI * speed; // ��תΪ��
                       end
                2'b01: if (Charac && $signed(Phi) > $signed(_MIN_PHI)) begin  // ��ת���
                            Phi <= Phi - _DEL_PHI * speed; // ��תΪ��
                        end
            endcase
        
            // ����ɫΪ����̬ʱ�������߻ع�
            if (!Charac) begin
                if ($signed(Phi) > 0)
                //if ($signed(Phi) + $signed(_DIAMETER * _BAS_TIME - Time) / $signed(Offset) > 0)
                //if ($signed(Phi) * (Offset[21] ? $signed(~Offset) : Offset) > $signed(_DIAMETER * _BAS_TIME / 2 - Time))
                    Phi <= Phi - _BACK_TIMES * _DEL_PHI * speed;
                else
                    Phi <= Phi + _BACK_TIMES * _DEL_PHI * speed;
            end
        
            // ��������
            if (!Charac)
                Time <= Time + Speed * _BAS_TIME / _BAS_SPEED; // ����ʱ��
            else begin
                if (Time <= Speed * _BAS_TIME / _BAS_SPEED)
                    Time <= _DIAMETER * _BAS_TIME;
                else
                    Time <= Time - Speed * _BAS_TIME / _BAS_SPEED; // ����ʱ��
            end
            // ����ƫ����
            if (Phi[14]) begin // ����������
                Offset <= Offset - ($signed(~Phi) * Speed * _BAS_TIME) / (_BAS_PHI * _BAS_SPEED);// ���½�ɫƫ��ֵ
            end else begin
                Offset <= Offset + (Phi * Speed * _BAS_TIME) / (_BAS_PHI * _BAS_SPEED);// ���½�ɫƫ��ֵ
            end
            // �����ٶ�
            if ((Phi[14] ? $signed(~Phi) : Phi) <= _BAS_PHI)
                Speed <= _BAS_SPEED * 5 * (Phi[12] ? $signed(~Phi) : Phi) / _BAS_PHI + _BAS_SPEED;// ���µ�ǰ����
            else begin
                if ((Phi[14] ? $signed(~Phi) : Phi) / _BAS_PHI <= 8)
                    Speed <= ((Phi[14] ? $signed(~Phi) : Phi) / _BAS_PHI + 4) * _BAS_SPEED;// ���µ�ǰ����
                else begin
                    if ((Phi[14] ? $signed(~Phi) : Phi) / _BAS_PHI <= 16)
                         Speed <= ((Phi[14] ? $signed(~Phi) : Phi) / _BAS_PHI / 2 + 8) * _BAS_SPEED;// ���µ�ǰ����
                end
            end
            // ����������뼰�ϰ���
            Distance <= Dist;
            Obstacle <= Obsta;
            Obstimes <= Obstm;
        
            // �ж���Ϸflag
            if (offset >= _MAX_OFFSET && Time >= _DISTINATION * _BAS_TIME && Time <= (_DISTINATION + 1024) * _BAS_TIME) begin win_flag = 1'b1; over_flag = 1'b1; end
            //if (offset < _MAX_OFFSET && Time >= _DISTINATION * _BAS_TIME && Time <= (_DISTINATION + 1024) * _BAS_TIME
            //   || Obstacle && Obstimes > 100 && Obstacle + Obstimes / 2 >= _CHARA_XPOS - _CHARA_WIDTH / 2 && Obstacle - Obstimes / 2 <= _CHARA_XPOS + _CHARA_WIDTH / 2)
            //   begin win_flag = 1'b0; over_flag = 1'b1; end
        
        end // end of next_s
    end // end of ena
end // end of always

//�����ֵ
assign character = Charac;                      // ��ɫ��Ϣ
assign offset = (Offset[21] ? $signed(~Offset >> 10) : (Offset >> 10)) * _MAX_OFFSET / (Distance >> 10);     // ������ƫ����0-99999999
assign speed = Speed / _BAS_SPEED;          // �ٶȣ�16�ݶ�0-15
assign obstacle = Obstacle;                     // �ϰ���λ��
assign obstimes = Obstimes;                     // �ϰ����С
assign progress = Time / _BAS_TIME * _SCREEN_WIDTH / _DIAMETER;   //��Ϸ����
assign offgress = (Offset[21] ? $signed(~Offset >> 10) : (Offset >> 10)) * 60 / (Distance >> 10); //ƫ�ƽ���
assign game_over = over_flag;           // ��Ϸ�������ߵ�ƽ��Ч
assign game_win = win_flag;             // ��Ϸ�ɹ����ߵ�ƽ��Ч

//����
assign phi = Phi;
assign off = Offset;

endmodule

//ģ�Ͷ���Բ��ģ�ͣ����������߾���
module calDistance(
    input [20:0] Time,      // �н�����
    output [20:0] Distance  // �����߾���
    );
    parameter _DIAMETER = 21600,    // ����ֱ��6min��15bit
                _BAS_TIME = 64;      // ʱ�����Ż�׼ֵ
    //assign Distance = Time;
    // ����б��ƽ����ֱ�Ǳ�ƽ��
    wire [20:0] radius = _DIAMETER * _BAS_TIME / 2;
    wire [20:0] side = (Time > radius) ? (Time - radius) : (radius - Time);
    wire [41:0] side_sq = side * side;
    wire [41:0] radius_sq = radius * radius;
           
    // ȷ��б�ߵĳ��ȴ���ֱ�Ǳߵĳ���
    assign Distance = (radius > side) ? sqrt(radius_sq - side_sq) : 20'd0;
      
    // ʵ�ּ򵥵�ƽ����������ʾ����������Ҫ����ʵ�����������
        /*function [20:0] sqrt;
            input [41:0] x;
            begin
                sqrt = x[20:0]; // ��ʾ����ʵ���п�����Ҫ�����ӵļ���
            end
        endfunction*/
    // ʵ��ţ��-����ɭƽ��������
        function [20:0] sqrt;
            input [41:0] x;
            reg [20:0] result;
            reg [20:0] next_result;
            reg [3:0] times;
            begin
                result = x[20:0]; // ��ʼ����
                next_result = 0;
                times = 0;
    
                // ���ж�ε�������߾���
                while (times < 10) begin
                    if (result != 0) begin
                        next_result = result;
                        // ţ��-����ɭ������
                        result = (result + x / result) >> 1;
                    end
                    else begin
                        result = 1; // ���������
                    end
                    times = times + 1;
                end
                sqrt = result;
            end
        endfunction
endmodule

//�����ϰ���
module setObstacle(
    input [20:0] Time,      // �н�����
    input [21:0] Offset,    // ƫ�ƾ���
    input [14:0] Phi,       // ƫ�ƽ�
    output [9:0] Obstacle,   // �ϰ���λ��
    output [7:0] Obstimes    // �ϰ����С
    );
    parameter _BAS_PHI = 256,      // �ǶȻ�׼ֵ256��8bit
                _BAS_TIME = 64,     // ʱ�����Ż�׼ֵ
                _SCREEN_WIDTH = 1024, // ��Ļ���
                _CHARA_XPOS = 512,  // ��ɫˮƽλ��
                _OBST_WID = 2048,   // �ϰ���֮���ˮƽ����
                _OBST_HEI = 2048,   // �ϰ���֮�����ֱ����
                _OBST_BAS = 250;    // �ϰ����׼���
    //assign Obstacle = 0;
    //assign Obstimes = 0;
    // ������С������
    wire dir_x = ((Time / _BAS_TIME) % _OBST_WID) < _OBST_WID >> 1;
    wire [20:0] relTime = dir_x ? ((_OBST_WID >> 1) - (Time / _BAS_TIME) % (_OBST_WID >> 1)) : ((Time / _BAS_TIME) % (_OBST_WID >> 1));
    wire [20:0] absOff = Offset[21] ? ~Offset / _BAS_TIME : Offset / _BAS_TIME;
    wire dir_y = (absOff % _OBST_HEI) < (_OBST_HEI >> 1);
    wire [20:0] relOff = dir_x ? ((_OBST_HEI >> 1) - absOff % (_OBST_HEI >> 1)) : (absOff % (_OBST_HEI >> 1));
    //�Ƿ���
    wire dir = Phi[12] && Offset[21] || ~Phi[12] && ~Offset[21];
    wire [13:0] absPhi = Phi[14] ? ~Phi : Phi;
    // �����ϰ���λ�ü���С
    wire insight = dir_x && dir_y && dir || ~dir_x && ~dir_y && dir ||
                     dir_x && ~dir_y && ~dir || ~dir_x && dir_y && ~dir;
    assign Obstacle = (insight && relTime< _SCREEN_WIDTH) ?
                      (dir_x ? (_CHARA_XPOS + relTime / 2) : (_CHARA_XPOS - relTime / 2))
                      : 10'd0; 
    wire [9:0] abs = (relTime * absPhi / _BAS_PHI > relOff) ? (relTime * absPhi / _BAS_PHI - relOff) : (relOff - relTime * absPhi / _BAS_PHI);
    assign Obstimes = (insight && (abs < _OBST_BAS - 50)) ? (_OBST_BAS - abs) : 8'd0; 
endmodule