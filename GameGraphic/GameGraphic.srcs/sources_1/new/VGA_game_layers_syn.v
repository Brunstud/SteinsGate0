`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 15:55:42
// Design Name: 
// Module Name: VGA_game_layers_syn
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 游戏图层综合模块
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module VGA_game_layers_syn(
    input  vga_clk,                 // VGA驱动时钟
    input  disp_en,                 // 显示有效信号
    
    input  [3:0] chara,             // 当前角色
    input  [3:0] speed,             // 前进速度
    input  [9:0] obstacle,          // 另一个角色位置
    input  [3:0] obstimes,          // 另一个角色清晰度
    input  [9:0] progress,          // 时间进度
    input  [8:0] offgress,          // 偏移进度
    
    input  [11:0]  pix_xpos,        // 像素点横坐标
    input  [11:0]  pix_ypos,        // 像素点纵坐标
    output reg  [11:0]  pix_data    // 像素点数据
    );
parameter  H_DISP   =  1024;   // 水平像素点数
parameter  V_DISP   =  600;    // 竖直像素点数
wire [4:0] vaild_layer;             // 判断各图层是否有效
wire [11:0] pix_data_layer [4:0];   // 储存各图层像素点信息
        
always @(posedge vga_clk) begin
     if (disp_en && 
         pix_xpos >= 0  && pix_xpos < H_DISP && 
         pix_ypos >= 0  && pix_ypos < V_DISP) begin
     // 按图层优先级显示图片
          casex(vaild_layer)
              5'b00001: begin pix_data <= pix_data_layer[0]; end
              5'b0001x: begin pix_data <= pix_data_layer[1]; end
              5'b001xx: begin pix_data <= pix_data_layer[2]; end
              5'b01xxx: begin pix_data <= pix_data_layer[3]; end
              //5'b1xxxx: begin pix_data <= pix_data_layer[4]; end
              default: begin pix_data <= 12'hfff; end//默认白色
          endcase
      end else begin
          pix_data <= 12'h000;
      end
end

// 实例化图层
BG_layer bg_inst(
    .vga_clk(vga_clk),          // VGA驱动时钟
    .disp_en(disp_en),          // 显示有效信号
    .pix_xpos(pix_xpos),        // 像素点横坐标
    .pix_ypos(pix_ypos),        // 像素点纵坐标
    .valid({vaild_layer[0]}),      // 该点是否有像素
    .pix_data(pix_data_layer[0])        // 像素点数据
    );
Satellbg_layer satellbg_inst(
    .vga_clk(vga_clk),          // VGA驱动时钟
    .disp_en(disp_en),          // 显示有效信号
    .progress(progress),        // 进度
    .pix_xpos(pix_xpos),        // 像素点横坐标
    .pix_ypos(pix_ypos),        // 像素点纵坐标
    .valid({vaild_layer[1]}),      // 该点是否有像素
    .pix_data(pix_data_layer[1])        // 像素点数据
    );
Road_layer road_inst(
     .vga_clk(vga_clk),          // VGA驱动时钟
     .disp_en(disp_en),          // 显示有效信号
     .forward(!(chara[0]^chara[1])),              // 控制行进方向
     .speed(speed),              // 路面行进速度
     .pix_xpos(pix_xpos),        // 像素点横坐标
     .pix_ypos(pix_ypos),        // 像素点纵坐标
     .valid({vaild_layer[2]}),      // 该点是否有像素
     .pix_data(pix_data_layer[2])        // 像素点数据
     );
Chara_layer chara_inst(
     .vga_clk(vga_clk),          // VGA驱动时钟
     .disp_en(disp_en),          // 显示有效信号
     .chara(chara),              // 选择当前角色
     .obstacle(obstacle),        // 另一个角色位置
     .obstimes(obstimes),        // 另一个角色清晰度
     .progress(progress),        // 时间进度
     .offgress(offgress),        // 偏移进度
     .pix_xpos(pix_xpos),        // 像素点横坐标
     .pix_ypos(pix_ypos),        // 像素点纵坐标
     .valid({vaild_layer[3]}),      // 该点是否有像素
     .pix_data(pix_data_layer[3])        // 像素点数据
     );
/*Satellite_layer satellite_inst(
     .vga_clk(vga_clk),          // VGA驱动时钟
     .disp_en(disp_en),          // 显示有效信号
     .basex(obstacle),           // 障碍物位置
     .times(obstimes),           // 障碍物大小
     .pix_xpos(pix_xpos),        // 像素点横坐标
     .pix_ypos(pix_ypos),        // 像素点纵坐标
     .valid({vaild_layer[4]}),      // 该点是否有像素
     .pix_data(pix_data_layer[4])        // 像素点数据
     );*/
/*Progress_layer prog_inst(
     .vga_clk(vga_clk),          // VGA驱动时钟
     .disp_en(disp_en),          // 显示有效信号
     .chara(chara),              // 当前角色
     .progress(progress),        // 时间进度
     .offgress(offgress),        // 偏移进度
     .pix_xpos(pix_xpos),        // 像素点横坐标
     .pix_ypos(pix_ypos),        // 像素点纵坐标
     .valid({vaild_layer[4]}),      // 该点是否有像素
     .pix_data(pix_data_layer[4])        // 像素点数据
     );*/
     
endmodule
