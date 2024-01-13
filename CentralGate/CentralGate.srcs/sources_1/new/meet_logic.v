`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/10 14:12:58
// Design Name: 
// Module Name: jump_logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module meet_logic(
    input clk,                  // ϵͳʱ��
    input rst_n,                // ���㣬�͵�ƽ��Ч
    input next_s,               // ��ʼ����Ǻţ��ߵ�ƽ������Ƶ��Ϊ60Hz��
    input [2:0] operation,      // �����źţ���ת����ת����ť���ߵ�ƽ��Ч
    
    output [2:0] character,     // ��ǰ��ɫ��Ϣ����ɫ״̬����һ����ɫ״̬����ǰ��ɫ״̬����ǰ��ɫ
    output [26:0] offset,       // ������ƫ����0-999999
    output [3:0] speed,         // �ٶȣ�15�ݶȣ�0Ϊ��ֹ
    output [9:0] obstacle,      // ��һ����ɫλ�ã�0���ʾ��
    output [3:0] obstimes,      // ��һ����ɫ�����ȣ�0��������
    output [9:0] progress,      // ��ǰʱ�����0-1024
    output [8:0] offgress,      // ��ǰƫ�ƽ���
    
    output game_over,           // ��Ϸ�������ߵ�ƽ��Ч
    output game_win             // ��Ϸ�ɹ���1���ɹ���0��ʧ�ܣ�
    );
parameter _MAX_OFFSET = 3355_4432; // ���������ƫ����
parameter _BAS_OFFSET = 1000_0000; // ����������ƫ����
parameter _PER_OFFSET = 0000_0512; // ƫ�ƻ���
parameter _DIAMETER = 21600;       // ����ֱ��6min��15bit
//��Ϸ������Ƶ��Ϊ60Hz��
parameter _START_P = 1000;    // ��ʼʱ���16s
parameter _MEET_DIST = 300;   // ����ʱ��
parameter _MEET_OFF = 0020_0000;    // ����������

parameter _BAS_SPEED = 64;   // �ٶȵ�λ��
parameter _BAS_TIME = 64;    // ʱ�����Ż�׼ֵ
parameter _SPEED_LEVEL = 16; // �ٶ���16���ȼ�
parameter _BACK_TIMES = 3;   // �������������ʣ�δʹ�ã�

parameter _SCREEN_WIDTH = 1024; // ��Ļ���
parameter _SCREEN_TIME = 2048;  // һ�������ʱ��
parameter _SCREEN_OFFSET = 0050_0000;    // ����ʱ���߲��ֵ
parameter _CHARA_XPOS = 512; // ��ɫˮƽλ��
parameter _CHARA_WIDTH = 200; // ��ɫˮƽ���
//״̬�����
reg over_flag;      // ��Ϸ�������
reg win_flag;       // ��Ϸʤ�����
//��Ϸ����
reg CurChara;              // ��ǰ��ɫ
reg Chstate[1:0];          // ��ɫ״̬
reg [21:0] Time[1:0];      // ʱ��t�����ֵ32768 * 64��
reg [26:0] Offset[1:0];    // ��ɫƫ����s
reg [9:0] Speed[1:0];      // ��ɫ�н��ٶ�v����׼����64��
reg [9:0] Obstacle;        // ��һ���˵�λ��
reg [3:0] Obstimes;        // ��һ����ɫ�����ȣ�0�������� 
// ��Ӧ��ʱ��
parameter _HOLD_TIME = 20;//�����0.3s
reg [6:0] counter;
// ��ʼ��
initial begin
    CurChara <= 0;
    Chstate[0] <= 0;
    Chstate[1] <= 0;
    Time[0] <= _START_P * _BAS_TIME;
    Time[1] <= (_DIAMETER - _START_P) * _BAS_TIME;
    Offset[0] <= 0;
    Offset[1] <= _BAS_OFFSET;
    Speed[0] <= 0;//_BAS_SPEED;
    Speed[1] <= 0;//_BAS_SPEED;
    Obstacle <= 0;
    Obstimes <= 0;
    win_flag <= 0;
    over_flag <= 0;
    counter <= 0;
end

//������һ����ɫ���λ��
wire [9:0] realObsta;
wire [3:0] realObstm;
anotherChara #(_BAS_TIME, _SCREEN_WIDTH, _SCREEN_TIME, _SCREEN_OFFSET, _CHARA_XPOS, _CHARA_WIDTH)
            anch_uut(Time[CurChara], Time[~CurChara], Offset[CurChara], Offset[~CurChara], realObsta, realObstm);
// �л���������������жϣ�
always @(posedge next_s or negedge rst_n) begin
    if (!rst_n) begin // ��ʼ��
        CurChara <= 0;
        counter <= 0;
        Obstacle <= 0;
        Obstimes <= 0;
    end // end of rst_n
    else begin
         if (next_s) begin
            // ������һ��ɫ����ʾ
            Obstacle <= realObsta;
            Obstimes <= realObstm;
            // �л�����
            if (counter != 0) begin
                counter <= counter - 1;
            end else begin
                if (operation[0]) begin
                    CurChara <= !CurChara;
                    counter <= _HOLD_TIME;
                end // end of operation
            end // end of counter
         end // end of next_s
    end // end of rst_n
end // end of always

//���½�ɫ�ٶ�
wire [9:0] realSpeed[1:0];
calSpeed #(_MAX_OFFSET, 0, _BAS_SPEED, _SPEED_LEVEL) chara_speed(Offset[0], realSpeed[0]);
calSpeed #(_MAX_OFFSET, _BAS_OFFSET, _BAS_SPEED, _SPEED_LEVEL) chris_speed(Offset[1], realSpeed[1]);
// ��������
always @(posedge next_s or negedge rst_n) begin
    if (!rst_n) begin // ��ʼ��
        Chstate[0] <= 0;
        Chstate[1] <= 0;
        Time[0] <= _START_P * _BAS_TIME;
        Time[1] <= (_DIAMETER - _START_P) * _BAS_TIME;
        Offset[0] <= 0;
        Offset[1] <= _BAS_OFFSET;
        Speed[0] <= 0;//_BAS_SPEED;
        Speed[1] <= 0;//_BAS_SPEED;
        win_flag <= 0;
        over_flag <= 0;
    end // end of rst_n
    else begin
        if (next_s && !over_flag) begin // �������
            // �������
            casex(operation[2:1])
                // ������
                2'bx1: begin
                    if (!CurChara) Chstate[0] <= 1'b0;  //��̫������
                    else Chstate[1] <= 1'b1;            //�����ܵ���
                end
                // ������
                2'b10: begin
                     if (!CurChara) Chstate[0] <= 1'b1;  //��̫�ɵ���
                     else Chstate[1] <= 1'b0;            //����������
                end
            endcase

            // ͬ������˫���ǲ���
            // ����ʱ��
            if (Chstate[0]) begin // ��̫��
                if (Time[0] > Speed[0]) Time[0] <= Time[0] - Speed[0];
                else Time[0] <= _DIAMETER * _BAS_TIME + Time[0] - Speed[0];
            end else begin
                if (Time[0] < _DIAMETER * _BAS_TIME)  Time[0] <= Time[0] + Speed[0];
                else Time[0] <= Speed[0];
            end
            if (!Chstate[1]) begin // ������
                 if (Time[1] > Speed[1]) Time[1] <= Time[1] - Speed[1];
                 else Time[1] <= _DIAMETER * _BAS_TIME;
            end else begin
                 if (Time[1] < _DIAMETER * _BAS_TIME)  Time[1] <= Time[1] + Speed[1];
                 else Time[1] <= Speed[1];
            end
            
            // ����ƫ����
            if (Chstate[0]) begin // ��̫��
                if (Offset[0] < _MAX_OFFSET) Offset[0] <= Offset[0] + _PER_OFFSET * Speed[0] / _BAS_SPEED;
                else Offset[0] <= 0;
            end else begin
                Offset[0] <= Offset[0]; // ���ֲ���
            end
            if (Chstate[1]) begin // ������
                if (Offset[1] > _PER_OFFSET) Offset[1] <= Offset[1] - _PER_OFFSET * Speed[1] / _BAS_SPEED;
                else Offset[1] <= _MAX_OFFSET;
            end else begin
                Offset[1] <= Offset[1]; // ���ֲ���
            end
            
            // ���½�ɫ�ٶ�
            Speed[0] <= realSpeed[0];
            Speed[1] <= realSpeed[1];
            
            // �ж���Ϸ����
            // ������������Ϸʤ��
            if (Time[0] <= Time[1] && Time[1] - Time[0] <= _MEET_DIST * _BAS_TIME &&
                (Offset[0] >= Offset[1] ? Offset[0] - Offset[1] : Offset[1] - Offset[0]) <= _MEET_OFF)
                begin  Chstate[0] <= 0; Chstate[1] <= 0;  //��ɫ״̬����
                       Speed[0] <= 0; Speed[1] <= 0;      //��ɫ�ٶ�����
                       win_flag <= 1; over_flag <= 1; end //ʤ�����
            // �˴˴������Ϸʧ��
            if (Time[0] <= Speed[0] || Time[1] >= _DIAMETER * _BAS_TIME ||
                Offset[1] > _BAS_OFFSET * _BAS_TIME || Offset[2] > _BAS_OFFSET * _BAS_TIME)
                 begin  Chstate[0] = 1; Chstate[1] = 1;     //��ɫ״̬��һ
                        Speed[0] <= 0; Speed[1] <= 0;       //��ɫ�ٶ�����
                        win_flag <= 0; over_flag <= 1; end  //ʧ�ܱ��
        end // end of next_s
    end // end of ena
end // end of always

//�����ֵ
assign character = {Chstate[~CurChara], Chstate[CurChara], CurChara};       // ��ɫ��Ϣ
assign offset = Offset[CurChara];                       // ������ƫ����0-99999999
assign speed = Speed[CurChara] / _BAS_SPEED;            // �ٶȣ�16�ݶ�0-15
assign obstacle = Obstacle;                     // �ϰ���λ��
assign obstimes = Obstimes;                     // �ϰ����С
assign progress = Time[CurChara] / _BAS_TIME * _SCREEN_WIDTH / _DIAMETER;   //��Ϸ����
assign offgress = (Offset[CurChara] >> 12) * 60 / (_BAS_OFFSET >> 12);      //ƫ�ƽ���
assign game_over = over_flag;           // ��Ϸ�������ߵ�ƽ��Ч
assign game_win = win_flag;             // ��Ϸ�ɹ����ߵ�ƽ��Ч

endmodule

module calSpeed(
    input[26:0] offset,
    output[9:0] speed
    );
parameter _MAX_OFFSET = 3355_4432; // ���������ƫ����
parameter _BAS_OFFSET = 1000_0000; // ����������ƫ����
parameter _BAS_SPEED = 64;   // �ٶȵ�λ��
parameter _SPEED_LEVEL = 16; // �ٶ���16���ȼ�

wire [26:0] off = (offset > _BAS_OFFSET) ? (offset - _BAS_OFFSET) % (_MAX_OFFSET >> 1) : (_BAS_OFFSET - offset) % (_MAX_OFFSET >> 1);
wire [5:0] ori_level = (off >> 8) * 2 * _SPEED_LEVEL / (_MAX_OFFSET >> 9); // 32���㼶
assign speed = _BAS_SPEED * ((ori_level < _SPEED_LEVEL / 2) ? (1 + ori_level) :
                             (ori_level < _SPEED_LEVEL) ? (5 + ori_level / 2) :
                             (7 + ori_level / 4));

endmodule

module anotherChara(
    input [21:0] thisTime,
    input [21:0] thatTime,
    input [26:0] thisOffset,
    input [26:0] thatOffset,
    output [9:0] obsta,
    output [3:0] obstm
    );
parameter _BAS_TIME = 64;    // ʱ�����Ż�׼ֵ
parameter _SCREEN_WIDTH = 1024; // ��Ļ���
parameter _SCREEN_TIME = 2048;  // һ�������ʱ��
parameter _SCREEN_OFFSET = 0050_0000;   // ����ʱ���߲��ֵ
parameter _CHARA_XPOS = 512; // ��ɫˮƽλ��
parameter _CHARA_WIDTH = 200; // ��ɫˮƽ���

wire [15:0] thisT = thisTime[21:6];
wire [15:0] thatT = thatTime[21:6];
wire exist = (thisT >= thatT ? thisT - thatT < _SCREEN_TIME >> 1 : thatT - thisT < _SCREEN_TIME >> 1);
wire [5:0] times = (thisOffset >= thatOffset ? (thisOffset - thatOffset) >> 5 : (thatOffset - thisOffset) >> 5) / (_SCREEN_OFFSET >> 5);
assign obsta = !exist ? 10'b0 :
               thisT >= thatT ? _CHARA_XPOS - (thisT - thatT) * _SCREEN_WIDTH / _SCREEN_TIME :
                                _CHARA_XPOS + (thatT - thisT) * _SCREEN_WIDTH / _SCREEN_TIME;
assign obstm = times > 15 ? 4'b0 : 15 - times;
endmodule
