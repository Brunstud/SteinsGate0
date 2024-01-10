`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/07 16:40:30
// Design Name: 
// Module Name: RotationSensor_tb
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


module RotaryEncoder_tb;

// Inputs
reg clk;
reg reset;
reg SIA;
reg SIB;
reg SW;

// Outputs
wire CW;
wire CCW;
wire Pressed;

// 实例化被测试模块
RotaryEncoder uut (
    .clk(clk), 
    .reset(reset), 
    .SIA(SIA), 
    .SIB(SIB), 
    .SW(SW), 
    .CW(CW), 
    .CCW(CCW), 
    .Pressed(Pressed)
);

initial begin
    // 初始化信号
    clk = 0;
    reset = 1;
    SIA = 0;
    SIB = 0;
    SW = 0;

    // 复位
    #20;
    reset = 0;

    // 模拟顺时针旋转
    #20; SIA = 1; SIB = 0;
    #20; SIA = 1; SIB = 1;
    #200; SIA = 0; SIB = 1;
    #20; SIA = 0; SIB = 0;

    // 模拟逆时针旋转
    #80; SIA = 0; SIB = 1;
    #20; SIA = 1; SIB = 1;
    #200; SIA = 1; SIB = 0;
    #20; SIA = 0; SIB = 0;

    // 模拟按压动作
    #80; SW = 1;
    #200; SW = 0;

    // 结束模拟
    #100;
end

// 时钟信号生成
always #10 clk = ~clk; // 生成50MHz的时钟

endmodule
