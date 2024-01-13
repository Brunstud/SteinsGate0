`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/11 22:28:40
// Design Name: 
// Module Name: GateFSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ������״̬��ģ��
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gate_ctrl(
    input clk,          // ϵͳʱ��
    input rst_n,        // �����ź�
    input [2:0] op,     // ��ת�����������ź�
    input [1:0] GL_over,// ��Ϸ�߼�ģ��Ľ����ź�(win,over)
    input VGA_comp,     // VGA���һ����ӡ�ź�
    output reg RS_en,       // ��ת������ģ��ʹ���ź�
    output reg GL_en,       // ��Ϸ�߼�����ģ��ʹ���ź�
    output reg DP_en,       // ��������ʾģ��ʹ���ź�
    output reg [1:0] DP_ch, // ��������ʾ����
    output reg VGA_en       // VGA��ʾģ��ʹ���ź�
);
// ״̬
reg[1:0] state;
localparam idle = 2'b00, start = 2'b01, over = 2'b10;

// ��ʼ��
initial begin
    // ״̬��ʼ��
    state <= idle;
    // ���ƶ˿ڳ�ʼ��
    RS_en <= 0;
    GL_en <= 0;
    DP_en <= 0;
    DP_ch <= 0;
    VGA_en <= 0;
end

// ״̬��
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= idle;
    end else begin
        case(state)
            // �ȴ���ʼ״̬
            idle:begin
                if (VGA_comp && op) state <= start;
                else state <= idle;
            end
            // ��Ϸ����״̬
            start:begin
                if (VGA_comp && GL_over[0]) state <= over;
                else state <= start;
            end
            // ��Ϸ����״̬
            over:begin
                if (VGA_comp && op[2:1]) state <= idle;
                else state <= over;
            end
            // ����״̬
            default:state <= idle;
        endcase // end of case
    end // end of rst_n
end // end of always

// ����߼�
always @(state or rst_n) begin
    if (!rst_n) begin
       RS_en <= 0;
       GL_en <= 0;
       DP_en <= 0;
       DP_ch <= 0;
       VGA_en <= 0;
    end else begin
        case(state)
            // �ȴ���ʼ״̬
            idle:begin
                RS_en <= 1;
                GL_en <= 0;     // �߼�����������
                DP_en <= 1;
                DP_ch <= 2'b01; // ��ʾSTEN_GATE
                VGA_en <= 1;
            end
            // ��Ϸ����״̬
            start:begin
                RS_en <= 1;
                GL_en <= 1;     // �߼�����������
                DP_en <= 1;
                DP_ch <= 2'b10; // ��ʾƫ�������ٶ�
                VGA_en <= 1;
            end
            // ��Ϸ����״̬
            over:begin
                RS_en <= 1;
                GL_en <= 1;      // �߼���������������
                DP_en <= 1;
                DP_ch <= {~GL_over[1], GL_over[0]};// ��ʾ���
                VGA_en <= 1;
            end
            // ����״̬
            default:begin
                RS_en <= 0;
                GL_en <= 0;
                DP_en <= 0;
                DP_ch <= 0;
                VGA_en <= 0;
            end
        endcase // end of case
    end // end of rst_n
end // end of always

endmodule
