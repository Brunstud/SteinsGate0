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
    input [2:0] operation,      // 操作信号：左转、右转、按钮，高电平有效
    output [7:0] anodes,   // 阳极信号（AN0..AN7）
    output [7:0] segments, // 段信号（A..G）和小数点 DP
    output [15:0] led      // led速度显示器
    );
  wire [26:0] offset;    // 世界线偏移量0-999999
  reg next_s;           // 开始运算记号，高电平激发（频率为60Hz）
  wire [1:0] charac;
  wire game_over;
  wire game_win;
  // 控制next_s为60Hz
  wire clk_60Hz;        // 60Hz时钟
  divider_60Hz(clk, !reset, clk_60Hz);
  always @(posedge clk_60Hz) begin
        next_s <= 1'b1;
        #2 next_s <= 1'b0;
  end
  // 实例化中心逻辑
  Gate_logic gate_uut (
      .ena(1'b1),
      .clk(clk),
      .rst_n(!reset),
      .next_s(1'b1),
      .operation(operation),
      .character(charac),
      .offset(offset),
      .speed(speed),
      .obstacle(),
      .game_over(game_over),
      .game_win(game_win)
    );
  // 辉光管显示offset值
  display_seg seg_uut(
       .clk(clk),
       .reset(!reset),
       .choice({!game_win, game_over}),
       .hex(offset),
       .speed(operation + charac[1]),
       .anodes(anodes),
       .segments(segments),
       .led(led)
   );
endmodule
