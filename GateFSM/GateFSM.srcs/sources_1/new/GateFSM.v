`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/11 22:28:40
// Design Name: 
// Module Name: GateFSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 控制器状态机模块
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gate_ctrl(
    input clk,          // 系统时钟
    input rst_n,        // 重置信号
    input [2:0] op,     // 旋转编码器操作信号
    input [1:0] GL_over,// 游戏逻辑模块的结束信号(win,over)
    input VGA_comp,     // VGA完成一屏打印信号
    output reg RS_en,       // 旋转编码器模块使能信号
    output reg GL_en,       // 游戏逻辑处理模块使能信号
    output reg DP_en,       // 开发板显示模块使能信号
    output reg [1:0] DP_ch, // 开发板显示类型
    output reg VGA_en       // VGA显示模块使能信号
);
// 状态
reg[1:0] state;
localparam idle = 2'b00, start = 2'b01, over = 2'b10;

// 初始化
initial begin
    // 状态初始化
    state <= idle;
    // 控制端口初始化
    RS_en <= 0;
    GL_en <= 0;
    DP_en <= 0;
    DP_ch <= 0;
    VGA_en <= 0;
end

// 状态机
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= idle;
    end else begin
        case(state)
            // 等待开始状态
            idle:begin
                if (VGA_comp && op) state <= start;
                else state <= idle;
            end
            // 游戏进行状态
            start:begin
                if (VGA_comp && GL_over[0]) state <= over;
                else state <= start;
            end
            // 游戏结束状态
            over:begin
                if (VGA_comp && op[2:1]) state <= idle;
                else state <= over;
            end
            // 其他状态
            default:state <= idle;
        endcase // end of case
    end // end of rst_n
end // end of always

// 组合逻辑
always @(state or rst_n) begin
    if (!rst_n) begin
       RS_en <= 0;
       GL_en <= 0;
       DP_en <= 0;
       DP_ch <= 0;
       VGA_en <= 0;
    end else begin
        case(state)
            // 等待开始状态
            idle:begin
                RS_en <= 1;
                GL_en <= 0;     // 逻辑处理器清零
                DP_en <= 1;
                DP_ch <= 2'b01; // 显示STEN_GATE
                VGA_en <= 1;
            end
            // 游戏进行状态
            start:begin
                RS_en <= 1;
                GL_en <= 1;     // 逻辑处理器运行
                DP_en <= 1;
                DP_ch <= 2'b10; // 显示偏移量及速度
                VGA_en <= 1;
            end
            // 游戏结束状态
            over:begin
                RS_en <= 1;
                GL_en <= 1;      // 逻辑处理器继续运行
                DP_en <= 1;
                DP_ch <= {~GL_over[1], GL_over[0]};// 显示结果
                VGA_en <= 1;
            end
            // 其他状态
            default:begin
                RS_en <= 0;
                GL_en <= 0;
                DP_en <= 0;
                DP_ch <= 0;
                VGA_en <= 0;
            end
        endcase // end of case
    end // end of rst_n
end // end of always

endmodule
