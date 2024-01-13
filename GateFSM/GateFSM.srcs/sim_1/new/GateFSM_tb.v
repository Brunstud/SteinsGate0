`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/13 16:41:16
// Design Name: 
// Module Name: GateFSM_tb
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


module Gate_ctrl_tb();

    reg clk_tb;          // ϵͳʱ��
    reg rst_n_tb;        // �����ź�
    reg [2:0] op_tb;     // ��ת�����������ź�
    reg [1:0] GL_over_tb;// ��Ϸ�߼�ģ��Ľ����ź�(win,over)
    reg VGA_comp_tb;     // VGA���һ����ӡ�ź�
    wire RS_en_tb;       // ��ת������ģ��ʹ���ź�
    wire GL_en_tb;       // ��Ϸ�߼�����ģ��ʹ���ź�
    wire DP_en_tb;       // ��������ʾģ��ʹ���ź�
    wire [1:0] DP_ch_tb; // ��������ʾ����
    wire VGA_en_tb;      // VGA��ʾģ��ʹ���ź�

    // ʵ����������ģ��
    Gate_ctrl uut(
        .clk(clk_tb), 
        .rst_n(rst_n_tb),
        .op(op_tb), 
        .GL_over(GL_over_tb),
        .VGA_comp(VGA_comp_tb),
        .RS_en(RS_en_tb), 
        .GL_en(GL_en_tb),
        .DP_en(DP_en_tb), 
        .DP_ch(DP_ch_tb),
        .VGA_en(VGA_en_tb)
    );

    // ʱ���ź�����
    initial begin
        clk_tb = 0;
        forever #10 clk_tb = ~clk_tb;  // ����50MHzʱ��
    end

    // ��������
    initial begin
        // ��ʼ������
        rst_n_tb = 0;
        op_tb = 0;
        GL_over_tb = 0;
        VGA_comp_tb = 0;

        // ����
        #10 rst_n_tb = 1;
        
        // ���ò�������
        // ���磺��ʼ��Ϸ����Ϸ���̡���Ϸ������
        #50 op_tb = 3'b001;
        #50 GL_over_tb = 1;
        #50 op_tb = 3'b010;
        
        VGA_comp_tb = 1;
        op_tb = 0;
        GL_over_tb = 0;
        #50 op_tb = 3'b001;
        #50 GL_over_tb = 1;
        #50 op_tb = 3'b010;

        // ��������
        #1000;
        $finish;
    end

endmodule
