`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 19:22:27
// Design Name: 
// Module Name: vga_test_tb
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


module vga_test_tb;

    reg clk_100MHz;        // 测试用 100MHz 时钟
    reg rst_n;             // 测试用复位信号
    wire vga_hs;           // VGA 行同步信号
    wire vga_vs;           // VGA 场同步信号
    wire [11:0] vga_rgb;   // VGA RGB 输出

    // 实例化 vga_test 模块
    vga_test uut(
        .clk_100MHz(clk_100MHz),
        .rst_n(rst_n),
        .vga_hs(vga_hs),
        .vga_vs(vga_vs),
        .vga_rgb(vga_rgb)
    );

    // 生成 100MHz 时钟信号
    initial begin
        clk_100MHz = 0;
        forever #5 clk_100MHz = ~clk_100MHz; // 100MHz 时钟周期为 10ns
    end

    // 生成复位信号
    initial begin
        rst_n = 0;            // 初始复位
        #100 rst_n = 1;       // 释放复位
        #1000000;             // 等待足够长的时间以观察 VGA 信号
        $stop;                // 停止模拟
    end

    // 可选：添加一些观察点以监视关键信号
    initial begin
        $monitor("Time = %t, vga_hs = %b, vga_vs = %b, vga_rgb = %h",
                 $time, vga_hs, vga_vs, vga_rgb);
    end

endmodule
