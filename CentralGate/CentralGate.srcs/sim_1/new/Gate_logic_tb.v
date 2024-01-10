`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 16:50:02
// Design Name: 
// Module Name: Gate_logic_tb
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


module Gate_logic_tb;

  // 定义时钟周期
  reg clk;
  // 为模块定义信号
  reg ena, rst_n, next_s;
  reg [2:0] operation;
  wire character;
  wire [26:0] offset;
  wire [3:0] speed;
  wire [9:0] obstacle;
  wire [7:0] obstimes;
  wire game_over, game_win;
  
  //测试
  wire [12:0] phi;
  wire [21:0] off;
  // 实例化被测模块
  Gate_logic2 uut (
    .ena(ena),
    .clk(clk),
    .rst_n(rst_n),
    .next_s(next_s),
    .operation(operation),
    .character(character),
    .offset(offset),
    .speed(speed),
    .obstacle(obstacle),
    .obstimes(obstimes),
    .game_over(game_over),
    .game_win(game_win),
    //测试
    .phi(phi),
    .off(off)
  );
  
  // 定义初始时钟周期
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 定义一个50%占空比的时钟信号，周期为10个时间单位
  end
  
  // 定义测试过程
  initial begin
    // 初始化所有输入信号
    ena = 0;
    rst_n = 0;
    next_s = 0;
    operation = 0;
    
    // 开始测试用例
    #10 ena = 1; // 使能信号
        
    // 等待一段时间，然后激活复位信号
    #10 rst_n = 1;
    
    // 在此添加更多的测试步骤，根据需要设置输入信号
    #20 operation = 3'b001;
    next_s = 1;
    //repeat(2) begin #5 next_s = 1; #5 next_s = 0; end // n次运算
    
    #20 operation = 3'b101;
    //repeat(2) begin #20 next_s = 1; #5 next_s = 0; end // n次运算
    
    #20 operation = 3'b011;
    //repeat(60) begin #20 next_s = 1; #5 next_s = 0; end // n次运算
    
    // 等待一段时间，观察输出信号
    #100 $display("Character: %b, Offset: %b, Speed: %b, Obstacle: %b, Game Over: %b, Game Win: %b", character, offset, speed, obstacle, game_over, game_win);
    
    // 在此添加更多的测试步骤，根据需要设置输入信号
    
    // 结束仿真
  end
  
endmodule
