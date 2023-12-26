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
parameter  V_DISP   =  600;    // 竖直像素点数
wire [1:0] vaild_layer;             // 判断各图层是否有效
wire [11:0] pix_data_layer [1:0];   // 储存各图层像素点信息
        
always @(posedge vga_clk) begin
     if (disp_en && 
         pix_xpos >= 0  && pix_xpos < H_DISP && 
         pix_ypos >= 0  && pix_ypos < V_DISP) begin
     // 按图层优先级显示图片
          casex(vaild_layer)
              2'b01: begin pix_data <= pix_data_layer[0]; end
              2'b1x: begin pix_data <= pix_data_layer[1]; end
              default: begin pix_data <= 12'hfff; end//默认白色
          endcase
      end else begin
          pix_data <= 12'h000;
      end
end

// 实例化图层
Title_layer title_inst(
    .vga_clk(vga_clk),          // VGA驱动时钟
    .disp_en(disp_en),          // 显示有效信号
    .pix_xpos(pix_xpos),        // 像素点横坐标
    .pix_ypos(pix_ypos),        // 像素点纵坐标
    .vaild({vaild_layer[0]}),      // 该点是否有像素
    .pix_data(pix_data_layer[0])        // 像素点数据
    );
Character_layer chara_inst(
     .vga_clk(vga_clk),          // VGA驱动时钟
     .disp_en(disp_en),          // 显示有效信号
     .pix_xpos(pix_xpos),        // 像素点横坐标
     .pix_ypos(pix_ypos),        // 像素点纵坐标
     .vaild({vaild_layer[1]}),      // 该点是否有像素
     .pix_data(pix_data_layer[1])        // 像素点数据
     );
            
//////////////////////////////////////////////////////////////////
// 功能：把显示器屏幕分成16色块
//////////////////////////////////////////////////////////////////
/*always @(posedge vga_clk) begin
    if (disp_en) begin
    // 示例：分别生成红、绿、蓝等颜色块
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
end*/

endmodule
