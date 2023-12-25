`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/24 11:58:28
// Design Name: 
// Module Name: display_seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 综合板显示
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display_seg(
    input clk,             // 时钟信号
    input reset,           // 重置信号，低电平有效
    input [1:0] choice,    // 显示模式：00:只显示数字;10:显示数字和速度;01:游戏开始;11:游戏结束;
    input [26:0] hex,      // 要显示的27bit十六进制数字
    input [3:0] speed,     // 要显示的速度值
    output [7:0] anodes,   // 阳极信号（AN0..AN7）
    output [7:0] segments, // 段信号（A..G）和小数点 DP
    output [15:0] led      // led速度显示器
    );
    wire [31:0]bcd; //中转bcd码
    // 实例化bcd码转换
    hex_to_bcd uut1(
        .hex(hex), 
        .bcd(bcd)
        );
    // 实例化七段显示模块
    seven_segment_display uut0 (
        .clk(clk),
        .reset(reset),
        .choice(choice),
        .bcdnum(bcd),
        .anodes(anodes),
        .segments(segments)
        );
    // 实例化速度led显示器：只有当choice=10时才会显示
    speed_led_display uut2(
        .clk(clk),
        .ena(reset && choice != 2'b00), 
        .flicker(choice[0]),
        .speed(speed), 
        .led(led)
        );
endmodule
