`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 19:08:53
// Design Name: 
// Module Name: Gate_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 逻辑模块测试
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gate_test(   
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
  wire [2:0] operation;  // 操作标记
  wire [26:0] offset;    // 世界线偏移量0-999999
  wire VS_negedge;       // 开始运算记号，高电平激发（频率为60Hz）
  wire [2:0] charac;    // 角色标记
  wire [3:0] speed;     // 速度标记
  wire [9:0] obstacle;  // 障碍物位置
  wire [7:0] obstimes;  // 障碍物大小
  wire [9:0] progress;  // 进度标记
  wire [7:0] offgress;  // 进度标记
  wire game_over;       // 游戏结束标记
  wire game_win;        // 游戏胜利标记
  // 旋转编码器输入
  RotationSensor rs_uut(
      .clk(clk),               // 时钟信号
      .rst_n(!reset),          // 复位信号
      .SIABW(SIABW),           // 旋转编码器SIA、SIB、SW引脚
      .operation(operation)    // 顺时针、逆时针、按压检测
  );
  // 实例化中心逻辑
  meet_logic gate_uut (
      .clk(clk),
      .rst_n(!reset),
      .next_s(VS_negedge),
      .operation(operation),
      
      .character(charac),
      .offset(offset),
      .speed(speed),
      .obstacle(obstacle),
      .obstimes(obstimes),
      .progress(progress),
      .offgress(offgress),
      
      .game_over(game_over),
      .game_win(game_win)
    );
  // 辉光管显示offset值
  display_seg seg_uut(
       .clk(clk),
       .reset(!reset),
       .choice({!game_win, game_over}),
       .hex(offset),
       .speed(speed),
       .anodes(anodes),
       .segments(segments),
       .led(led)
   );
   // VGA显示屏
   vga_top vga_uut(
       .clk_100MHz(clk),        // 标准时钟
       .rst_n(!reset),          // 复位信号，高电平有效（方便测试）
       
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
