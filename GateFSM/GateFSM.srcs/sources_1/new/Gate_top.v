`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/13 16:26:56
// Design Name: 
// Module Name: Gate_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 命运石扭结top模块
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gate_top(   
    input clk,             // 时钟信号
    input reset,           // 重置信号，高电平有效
    input [2:0] SIABW,     // 旋转编码器SIA、SIB、SW引脚
    output [7:0] anodes,   // 阳极信号（AN0..AN7）
    output [7:0] segments, // 段信号（A..G）和小数点 DP
    output [15:0] led,     // led速度显示器
    output          vga_hs,             // 行同步信号
    output          vga_vs,             // 场同步信号
    output  [11:0]  vga_rgb             // 红绿蓝输出
    );
  // 控制器使能
  wire RS_ena;
  wire GL_ena;
  wire DP_ena;
  wire [1:0] DP_choice;
  wire VGA_ena;
  // 传递参数
  wire [2:0] operation;  // 操作标记
  wire [26:0] offset;    // 世界线偏移量0-999999
  wire VS_negedge;       // 开始运算记号，高电平激发（频率为60Hz）
  wire [2:0] charac;     // 角色标记
  wire [3:0] speed;      // 速度标记
  wire [9:0] obstacle;   // 障碍物位置
  wire [7:0] obstimes;   // 障碍物大小
  wire [9:0] progress;   // 进度标记
  wire [7:0] offgress;   // 进度标记
  wire [1:0] over_flag;  // 游戏结束标记
  // 系统控制器
  Gate_ctrl ctrl_uut(
      .clk(clk),            // 系统时钟
      .rst_n(!reset),       // 重置信号
      .op(operation),       // 旋转编码器操作信号
      .GL_over(over_flag),  // 游戏逻辑模块的结束信号(win,over)
      .VGA_comp(VS_negedge),// VGA完成一屏打印信号
      .RS_en(RS_ena),       // 旋转编码器模块使能信号
      .GL_en(GL_ena),       // 游戏逻辑处理模块使能信号
      .DP_en(DP_ena),       // 开发板显示模块使能信号
      .DP_ch(DP_choice),    // 开发板显示类型
      .VGA_en(VGA_ena)      // VGA显示模块使能信号
  );
  // 旋转编码器输入
  RotationSensor rs_uut(
      .clk(clk),               // 时钟信号
      .rst_n(RS_ena),          // 复位信号
      .SIABW(SIABW),           // 旋转编码器SIA、SIB、SW引脚
      .operation(operation)    // 顺时针、逆时针、按压检测
  );
  // 实例化中心逻辑
  meet_logic gate_uut (
      .clk(clk),
      .rst_n(GL_ena),
      .next_s(VS_negedge),
      .operation(operation),
      
      .character(charac),
      .offset(offset),
      .speed(speed),
      .obstacle(obstacle),
      .obstimes(obstimes),
      .progress(progress),
      .offgress(offgress),
      
      .game_over(over_flag[0]),
      .game_win(over_flag[1])
    );
  // 辉光管显示offset值
  display_seg seg_uut(
       .clk(clk),
       .reset(DP_ena),
       .choice(DP_choice),
       .hex(offset),
       .speed(speed),
       .anodes(anodes),
       .segments(segments),
       .led(led)
   );
   // VGA显示屏
   vga_top vga_uut(
       .clk_100MHz(clk),        // 标准时钟
       .rst_n(VGA_ena),         // 复位信号，低电平有效
       
       .chara(charac),          // 角色状态
       .speed(speed),           // 行进速度
       .obstacle(obstacle),     // 障碍物位置
       .obstimes(obstimes),     // 障碍物大小
       .progress(progress),     // 进度条
       .offgress(offgress),     // 进度条
       
       .vga_hs(vga_hs),          // 行同步信号
       .vga_vs(vga_vs),          // 场同步信号
       .vga_rgb(vga_rgb),        // 红绿蓝输出
       .VS_negedge(VS_negedge)   // 下降沿信号
   );
endmodule
