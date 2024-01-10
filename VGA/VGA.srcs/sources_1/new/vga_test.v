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
wire VS_negedge;
// 前行速度
reg chara = 0;
reg [3:0] speed = 0;
reg [9:0] obstacle = 512;
reg [7:0] obstimes = 100;
wire clk_1Hz;
divider_100M d100M(clk_100MHz, !rst_n, clk_1Hz);
always @(posedge clk_1Hz) begin
    speed <= speed + 1;
    if (speed == 0)
        chara <= ~chara;
    obstacle <= 512;
    obstimes <= 100;
    //if (obstimes == 0)obstimes <= 50;
    //else obstimes <= obstimes + 1;
end
//VGA顶层模块
vga_top vga_inst(
    .clk_100MHz(clk_100MHz),     // 标准时钟
    .rst_n(!rst_n),              // 复位信号，高电平有效（方便测试）
    
    .chara(chara),          // 角色状态
    .speed(speed),          // 行进速度
    .obstacle(obstacle),       // 障碍物位置
    .obstimes(obstimes),       // 障碍物大小
    
    .vga_hs(vga_hs),             // 行同步信号
    .vga_vs(vga_vs),             // 场同步信号
    .vga_rgb(vga_rgb),           // 红绿蓝输出
    .VS_negedge(VS_negedge)      // 下降沿信号
    );
endmodule
