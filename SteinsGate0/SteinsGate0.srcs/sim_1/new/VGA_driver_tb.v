`timescale 1ns / 1ps
module VGA_driver_tb;
    reg clk;       // 输入时钟信号
    reg rst_n;     // 复位信号（低有效）
    wire hsync;     // 水平同步信号
    wire vsync;     // 垂直同步信号
    wire [3:0] red; // 红色分量
    wire [3:0] green; // 绿色分量
    wire [3:0] blue;   // 蓝色分量
    
    // 定义时钟参数
    parameter CLK_PERIOD = 2; // 时钟周期（单位：ns）

    // 生成时钟信号
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // 产生复位信号
    initial begin
        clk = 0;
        rst_n = 0;
        #10; // 等待一段时间后释放复位
        rst_n = 1;
    end

    // 实例化待测试的 VGA_driver 模块
    VGA_driver dut (
        .clk(clk),
        .rst_n(rst_n),
        .hsync(hsync),
        .vsync(vsync),
        .red(red),
        .green(green),
        .blue(blue)
    );

    // 添加其他测试逻辑和断言（Assertions）...

    // 模拟时长
    initial #5000 $finish; // 模拟5000个时钟周期后停止仿真

endmodule
