`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 18:17:42
// Design Name: 
// Module Name: VGA_color_syn
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 图层综合模块
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module VGA_color_syn(
    input  vga_clk,                 // VGA驱动时钟
    input  disp_en,                 // 显示有效信号
    input  [11:0]  pix_xpos,        // 像素点横坐标
    input  [11:0]  pix_ypos,        // 像素点纵坐标
    output reg  [11:0]  pix_data    // 像素点数据
    );
parameter  H_DISP   =  1024;   // 水平像素点数
parameter  V_DISP   =  600;   // 竖直像素点数

//////////////////////////////////////////////////////////////////
// 功能：把显示器屏幕分成8个纵列，每个纵列的宽度是?
//////////////////////////////////////////////////////////////////
always @(posedge vga_clk) begin
    if (disp_en) begin
    // 根据 R_h_cnt 的值来设定颜色
    // 示例：分别生成红、绿、蓝等颜色条
        case (pix_xpos * 4 / H_DISP + pix_ypos * 4 / V_DISP)
            0: pix_data <= 12'hF00; // 红色
            1: pix_data <= 12'h0F0; // 绿色
            2: pix_data <= 12'h00F; // 蓝色
            3: pix_data <= 12'hFFF; // 白色
            4: pix_data <= 12'h000; // 黑色
            5: pix_data <= 12'hFF0; // 黄色
            6: pix_data <= 12'hF0F; // 紫色
            7: pix_data <= 12'h0FF; // 青色
            default: pix_data <= 12'h000; // 黑色
        endcase
    end else begin
        pix_data <= 12'h000;
    end
end

endmodule
