`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 21:27:30
// Design Name: 
// Module Name: Layers_Color
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 图层像素值计算模块
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Title_layer(
    input  vga_clk,                 // VGA驱动时钟
    input  disp_en,                 // 显示有效信号
    input  [11:0]  pix_xpos,        // 像素点横坐标
    input  [11:0]  pix_ypos,        // 像素点纵坐标
    output reg  vaild,              // 该点是否有像素
    output reg  [11:0]  pix_data    // 像素点数据
    );
    parameter  IMG_WIDTH = 480;
    parameter  IMG_HEIGHT = 300;
    reg [17:0] img_addr;
    wire [15:0] img_data;
            
    always @(posedge vga_clk) begin
         if (disp_en) begin
              img_addr <= 12'b0; //文件指针归零
              if(pix_xpos >= 32  && pix_xpos < 32 + IMG_WIDTH * 2 && pix_ypos >= 0  && pix_ypos < IMG_HEIGHT * 2) 
                   begin
                       vaild <= 1'b1;//该图层有效数据
                       pix_data <= img_data[11:0];
                       img_addr <= (pix_ypos / 2) * IMG_WIDTH + (pix_xpos - 32) / 2; 
                    end
               else begin
                    vaild = 1'b0;//该图层透明像素点
                    pix_data <= 12'hfff;
               end
          end else begin
              vaild = 1'b0;
              pix_data <= 12'h000;
          end
    end
    
    blk_mem_gen_0 ROM_inst (
         .clka(vga_clk),
         .addra(img_addr),
         .douta(img_data),
         .ena(disp_en) // 连接 ROM 输出数据到您的模块中
         );

endmodule

module Character_layer(
    input  vga_clk,                 // VGA驱动时钟
    input  disp_en,                 // 显示有效信号
    input  [11:0]  pix_xpos,        // 像素点横坐标
    input  [11:0]  pix_ypos,        // 像素点纵坐标
    output reg  vaild,              // 该点是否有像素
    output reg  [11:0]  pix_data    // 像素点数据
    );
    parameter  IMG_WIDTH = 300;
    parameter  IMG_HEIGHT = 300;
    reg [16:0] img_addr;
    wire [15:0] img_data;
            
    always @(posedge vga_clk) begin
         if (disp_en) begin
              img_addr <= 12'b0; //文件指针归零
              if(pix_xpos >= 32  && pix_xpos < 32 + IMG_WIDTH  && pix_ypos >= 0  && pix_ypos < IMG_HEIGHT) 
                   begin
                       vaild <= 1'b1;//该图层有效数据
                       pix_data <= img_data[11:0];
                       img_addr <= (pix_ypos) * IMG_WIDTH + (pix_xpos - 32); 
                    end
               else begin
                    vaild = 1'b0;//该图层透明像素点
                    pix_data <= 12'hfff;
               end
          end else begin
              vaild = 1'b0;
              pix_data <= 12'h000;
          end
    end
    
    character0_rom ROM_inst (
         .clka(vga_clk),
         .addra(img_addr),
         .douta(img_data),
         .ena(disp_en) // 连接 ROM 输出数据到您的模块中
         );

endmodule
