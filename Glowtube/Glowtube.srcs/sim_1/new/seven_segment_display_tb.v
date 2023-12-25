`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg reset;
    reg [7:0] choice;
    wire [7:0] anodes;
    wire [7:0] segments;

    // 实例化七段显示模块
    test_ssd uut (
        .clk(clk),
        .reset(reset),
        .choice(choice),
        .anodes(anodes),
        .segments(segments)
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
        #100; // 等待一段时间以稳定初始状态

        // 释放重置信号
        reset = 0;
        number = 32'h12345678; // 设置一个测试数字
        #1000; // 等待一段时间以观察输出

        // 更改数字
        number = 32'h87654321;
        #1000; // 继续观察输出

        // 重置并结束测试
        reset = 1;
        #100;
        $finish;
    end

endmodule