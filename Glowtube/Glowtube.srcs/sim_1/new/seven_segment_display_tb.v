`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg reset;
    reg [7:0] number;
    reg [3:0] speed;
    wire [7:0] anodes;
    wire [7:0] segments;
    wire [15:0] led;

    // 实例化七段显示模块
    test_ssd uut (
        .clk(clk),
        .reset(reset),
        .number(number),
        .speed(speed),
        .anodes(anodes),
        .segments(segments),
        .led(led)
    );

    // 时钟信号生成
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 生成一个周期为 20ns 的时钟信号
    end

    // 测试用例
    initial begin
        // 初始化
        reset = 1;
        number = 0;
        speed = 0;
        #100; // 等待一段时间以稳定初始状态

        // 释放重置信号
        reset = 0;
        number = 8'b1000_0000; // 设置一个测试数字
        speed = 4;
        #100_0000; // 等待一段时间以观察输出

        // 更改数字
        number = 8'b0001_0000;
        speed = 8;
        #100_0000; // 继续观察输出

        // 重置并结束测试
        reset = 1;
        #100;
        $finish;
    end

endmodule