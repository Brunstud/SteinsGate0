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
    output game_win             // ��Ϸ�ɹ���1���ɹ���0��ʧ�ܣ�
    );
//��Ϸ������Ƶ��Ϊ60Hz��
parameter _START_P = 600;    // ��ʼʱ���
parameter _BETA = 4096;      // beta�����߽ǣ���׼ֵ4096��
parameter _DEL_PHI = 1;      // phi�Ƕ���������׼ֵ4096��
parameter _BAS_PHI = 4096;   // �ǶȻ�׼ֵ
parameter _BAS_SPEED = 64;   // �ٶȵ�λ��
parameter _BAS_TIME = 64;    // ʱ�����Ż�׼ֵ
parameter _CHARA_XPOS = 218; // ��ɫˮƽλ��
//״̬�����
reg dirc_beta;      // beta����ƫ�Ʒ�����Ϊ0����Ϊ1
reg dirc_phi;       // phi�н������ǣ���Ϊ0����Ϊ1
reg over_flag;      // ��Ϸ�������
reg win_flag;       // ��Ϸʤ�����
//��Ϸ����
reg [1:0] Charac;     // ��ɫ
reg [22:0] Time;      // ʱ��t�����ֵ131072 * 64��
reg signed [14:0] Phi;       // ��ɫƫ�ƽ�phi����׼ֵ4096��ȡֵ-16382~16381��,��
reg signed [23:0] Offset;    // ��ɫƫ����s�����ֵ��131072 * 64��
reg [22:0] Distance;  // ����ƫ����d�����ֵ131072 * 64��
reg [9:0] Speed;      // ��ɫ�н��ٶ�v����׼����64��
reg [12:0] Obstacle;  // �ϰ���λ��
//���������

//��������
always @(posedge clk) begin
if (ena) begin
    if (!rst_n) begin // ��ʼ��
        Charac <= 2'b00;
        Time <= _START_P;
        Phi <= 0;
        Offset <= 0;
        Distance <= _BETA * _START_P;
        Speed <= _BAS_SPEED;
        Obstacle <= 0;
        dirc_beta <= 0;
        dirc_phi <= 0;
        win_flag <= 0;
        over_flag <= 0;
    end // end of rst_n
    else
    if (next_s) begin // �������
        // �������
        casex(operation)
            3'bxx1: Charac[1] <= !Charac[1]; // �ı��ɫ״̬
            3'bx10: if (Charac[1]) begin     // ��ת���
                        if (0 == Phi) begin
                            dirc_phi = 1'b1;     // ����ƫת
                            Phi <= _DEL_PHI; // ��ʼ��ƫ�ƽ�
                        end else if (dirc_phi) begin
                            Phi <= Phi + _DEL_PHI; // Զ������������
                        end else begin
                            if (Phi > _DEL_PHI) Phi <= Phi - _DEL_PHI; // ������������ƫ��
                            else begin dirc_phi = !dirc_phi; Phi <= _DEL_PHI - Phi; end // ת����һ��
                        end
                    end
            3'b100: if (Charac[1]) begin      // ��ת���
                        if (0 == Phi) begin
                             dirc_phi = 1'b0;     // ����ƫת 
                             Phi <= _DEL_PHI; // ��ʼ��ƫ�ƽ�
                        end else if (!dirc_phi) begin
                             Phi <= Phi + _DEL_PHI; // Զ������������
                        end else begin
                             if (Phi > _DEL_PHI) Phi <= Phi - _DEL_PHI; // ������������ƫ��
                             else begin dirc_phi = !dirc_phi; Phi <= _DEL_PHI - Phi; end // ת����һ��
                        end
                    end
        endcase
        
        // ��������
        Time <= Time + Speed * _BAS_TIME / _BAS_SPEED; // ����ʱ��
        // ���½�ɫƫ��ֵ
        if (0 == Offset) begin 
            dirc_beta <= dirc_phi;
            Offset <= Phi * _BAS_TIME / _BAS_PHI;
        end else if (dirc_beta == dirc_phi) //�н�������ͬ
            Offset <= Offset + Phi * _BAS_TIME / _BAS_PHI;
        else if (Offset > Phi * _BAS_TIME / _BAS_PHI) //�н������෴
            Offset <= Offset - Phi * _BAS_TIME / _BAS_PHI;
        Distance <= _BETA * _START_P;
        Speed <= _BAS_SPEED;
        Obstacle <= 0;
        
        // �ж���Ϸflag
        if (Offset >= Distance) begin win_flag = 1'b1; over_flag = 1'b1; end
        if (Obstacle[0] && Obstacle[12:1] <= _CHARA_XPOS) over_flag = 1'b1;
    end // end of next_s
end // end of ena
end // end of always
//�����ֵ
assign character = Charac;                      // ��ɫ��Ϣ
assign offset = Offset * 100000 / Distance;     // ������ƫ����0-999999
assign speed = Speed / _BAS_SPEED;              // �ٶȣ�16�ݶ�
assign obstacle = Obstacle;                     // �ϰ���λ��
assign game_over = over_flag;           // ��Ϸ�������ߵ�ƽ��Ч
assign game_win = win_flag;             // ��Ϸ�ɹ����ߵ�ƽ��Ч

endmodule
