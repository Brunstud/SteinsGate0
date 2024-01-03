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


module Gate_logic(
    input ena,                  // ʹ���ͺţ�ÿ�ο�ʼע���ȳ�ʼ����
    input clk,                  // ϵͳʱ��
    input rst_n,                // ���㣬�͵�ƽ��Ч
    input next_s,               // ��ʼ����Ǻţ��ߵ�ƽ������Ƶ��Ϊ60Hz��
    input [2:0] operation,      // �����źţ���ת����ת����ť���ߵ�ƽ��Ч
    
    output [1:0] character,     // ��ɫ��Ϣ����ɫ״̬����ɫѡ��
    output [26:0] offset,       // ������ƫ����0-999999
    output [3:0] speed,         // �ٶȣ�16�ݶ�
    output [12:0] obstacle,     // �ϰ���λ�ã�0λ���Ƿ����ϰ���
    
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
parameter _CHARA_XPOS = 218; // ��ɫˮƽλ��
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
reg [12:0] Obstacle;  // �ϰ���λ��

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
assign speed = Speed / _BAS_SPEED - 1;          // �ٶȣ�16�ݶ�0-15
assign obstacle = Obstacle;                     // �ϰ���λ��
assign game_over = over_flag;           // ��Ϸ�������ߵ�ƽ��Ч
assign game_win = win_flag;             // ��Ϸ�ɹ����ߵ�ƽ��Ч

//����
assign phi = Phi;
assign off = Offset;

endmodule
