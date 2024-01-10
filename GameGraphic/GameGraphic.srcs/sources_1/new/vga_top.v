`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/09 16:20:57
// Design Name: 
// Module Name: vga_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: vga����
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga_top(
    input           clk_100MHz,         // ��׼ʱ��
    input           rst_n,              // ��λ�źţ��ߵ�ƽ��Ч��������ԣ�
    
    input [2:0]     chara,          // ��ɫ״̬
    input [3:0]     speed,          // �н��ٶ�
    input [9:0]     obstacle,       // �ϰ���λ��
    input [3:0]     obstimes,       // �ϰ����С
    input [9:0]     progress,       // ʱ�����
    input [8:0]     offgress,       // ƫ�ƽ���
    
    output          vga_hs,             // ��ͬ���ź�
    output          vga_vs,             // ��ͬ���ź�
    output  [11:0]  vga_rgb,            // ���������
    output          VS_negedge          // �½����ź�
    );
wire clk_25MHz;
wire disp_en;
wire [11:0] pix_data;
wire [11:0] pix_xpos;
wire [11:0] pix_ypos;
//ʱ�ӷ�Ƶ
divider_2 d2(clk_100MHz, rst_n, clk_50MHz);
//ͼ���ۺ�
VGA_game_layers_syn clr_syn_inst(
    .vga_clk(clk_50MHz),        // VGA����ʱ��
    .disp_en(disp_en),          // ��ʾ��Ч�ź�
    
    .chara(chara),              // ѡ���ɫ
    .speed(speed),              // ǰ���ٶ�
    .obstacle(obstacle),        // �ϰ���λ��
    .obstimes(obstimes),        // �ϰ����С
    .progress(progress),        // ʱ�����
    .offgress(offgress),        // ƫ�ƽ���
    
    .pix_xpos(pix_xpos),        // ���ص������
    .pix_ypos(pix_ypos),        // ���ص�������
    .pix_data(pix_data)         // ���ص�����
    );
//VGA������
vga_driver_1024x600 vga_driver_inst(
    .clk_50MHz(clk_50MHz),       // VGA����ʱ��
    .rst_n(rst_n),              // ��λ�źţ��͵�ƽ��Ч
    
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
