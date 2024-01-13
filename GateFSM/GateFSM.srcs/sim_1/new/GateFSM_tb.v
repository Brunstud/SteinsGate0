`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/13 16:41:16
// Design Name: 
// Module Name: GateFSM_tb
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


module Gate_ctrl_tb();

    reg clk_tb;          // 系统时钟
    reg rst_n_tb;        // 重置信号
    reg [2:0] op_tb;     // 旋转编码器操作信号
    reg [1:0] GL_over_tb;// 游戏逻辑模块的结束信号(win,over)
    reg VGA_comp_tb;     // VGA完成一屏打印信号
    wire RS_en_tb;       // 旋转编码器模块使能信号
    wire GL_en_tb;       // 游戏逻辑处理模块使能信号
    wire DP_en_tb;       // 开发板显示模块使能信号
    wire [1:0] DP_ch_tb; // 开发板显示类型
    wire VGA_en_tb;      // VGA显示模块使能信号

    // 实例化被测试模块
    Gate_ctrl uut(
        .clk(clk_tb), 
        .rst_n(rst_n_tb),
        .op(op_tb), 
        .GL_over(GL_over_tb),
        .VGA_comp(VGA_comp_tb),
        .RS_en(RS_en_tb), 
        .GL_en(GL_en_tb),
        .DP_en(DP_en_tb), 
        .DP_ch(DP_ch_tb),
        .VGA_en(VGA_en_tb)
    );

    // 时钟信号生成
    initial begin
        clk_tb = 0;
        forever #10 clk_tb = ~clk_tb;  // 生成50MHz时钟
    end

    // 测试序列
    initial begin
        // 初始化输入
        rst_n_tb = 0;
        op_tb = 0;
        GL_over_tb = 0;
        VGA_comp_tb = 0;

        // 重置
        #10 rst_n_tb = 1;
        
        // 设置测试条件
        // 例如：开始游戏、游戏过程、游戏结束等
        #50 op_tb = 3'b001;
        #50 GL_over_tb = 1;
        #50 op_tb = 3'b010;
        
        VGA_comp_tb = 1;
        op_tb = 0;
        GL_over_tb = 0;
        #50 op_tb = 3'b001;
        #50 GL_over_tb = 1;
        #50 op_tb = 3'b010;

        // 结束测试
        #1000;
        $finish;
    end

endmodule
