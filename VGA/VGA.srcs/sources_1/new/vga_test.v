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
    input           clk_100MHz,         // 标准时钟
    input           rst_n,              // 复位信号，高电平有效（方便测试）
    output          vga_hs,             // 行同步信号
    output          vga_vs,             // 场同步信号
    output  [11:0]  vga_rgb            // 红绿蓝输出
    );
wire clk_25MHz;
wire disp_en;
wire VS_negedge;
wire [11:0] pix_data;
wire [11:0] pix_xpos;
wire [11:0] pix_ypos;
//时钟分频
divider_2 d2(clk_100MHz, !rst_n, clk_50MHz);
//颜色设置
VGA_color_syn clr_syn_inst(
    .vga_clk(clk_50MHz),        // VGA驱动时钟
    .disp_en(disp_en),          // 显示有效信号
    .pix_xpos(pix_xpos),        // 像素点横坐标
    .pix_ypos(pix_ypos),        // 像素点纵坐标
    .pix_data(pix_data)         // 像素点数据
    );
//VGA驱动器
vga_driver_1024x600 vga_driver_inst(
    .clk_50MHz(clk_50MHz),       // VGA驱动时钟
    .rst_n(!rst_n),              // 复位信号，低电平有效
    
    .disp_en(disp_en),                 //显示有效信号
    .VS_negedge(VS_negedge),           //输出场信号下降沿
    
    .vga_hs(vga_hs),             // 行同步信号
    .vga_vs(vga_vs),             // 场同步信号
    .vga_rgb(vga_rgb),           // 红绿蓝输出

    .pix_data(pix_data),           // 像素点数据
    .pix_xpos(pix_xpos),           // 像素点横坐标
    .pix_ypos(pix_ypos)            // 像素点纵坐标
    );
endmodule
