`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 18:34:50
// Design Name: 
// Module Name: vga_test
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


module vga_test(
    input           clk_100MHz,         // ��׼ʱ��
    input           rst_n,              // ��λ�źţ��ߵ�ƽ��Ч��������ԣ�
    output          vga_hs,             // ��ͬ���ź�
    output          vga_vs,             // ��ͬ���ź�
    output  [11:0]  vga_rgb            // ���������
    );
wire clk_25MHz;
wire disp_en;
wire VS_negedge;
wire [11:0] pix_data;
wire [11:0] pix_xpos;
wire [11:0] pix_ypos;
//ʱ�ӷ�Ƶ
divider_2 d2(clk_100MHz, !rst_n, clk_50MHz);
//��ɫ����
VGA_color_syn clr_syn_inst(
    .vga_clk(clk_50MHz),        // VGA����ʱ��
    .disp_en(disp_en),          // ��ʾ��Ч�ź�
    .pix_xpos(pix_xpos),        // ���ص������
    .pix_ypos(pix_ypos),        // ���ص�������
    .pix_data(pix_data)         // ���ص�����
    );
//VGA������
vga_driver_1024x600 vga_driver_inst(
    .clk_50MHz(clk_50MHz),       // VGA����ʱ��
    .rst_n(!rst_n),              // ��λ�źţ��͵�ƽ��Ч
    
    .disp_en(disp_en),                 //��ʾ��Ч�ź�
    .VS_negedge(VS_negedge),           //������ź��½���
    
    .vga_hs(vga_hs),             // ��ͬ���ź�
    .vga_vs(vga_vs),             // ��ͬ���ź�
    .vga_rgb(vga_rgb),           // ���������

    .pix_data(pix_data),           // ���ص�����
    .pix_xpos(pix_xpos),           // ���ص������
    .pix_ypos(pix_ypos)            // ���ص�������
    );
endmodule
