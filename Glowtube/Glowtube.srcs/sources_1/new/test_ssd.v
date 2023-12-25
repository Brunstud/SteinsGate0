`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/23 14:03:19
// Design Name: 
// Module Name: test_ssd
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


module test_ssd(
    input clk,             // 时钟信号
    input reset,           // 重置信号，高电平有效
    input [7:0] number,    // 要显示的数字（一共八个数字供测试）
    input [3:0] speed,     // 要显示的速度值
    output [7:0] anodes,   // 阳极信号（AN0..AN7）
    output [7:0] segments, // 段信号（A..G）和小数点 DP
    output [15:0] led      // led速度显示器
    );
    reg [1:0]ch = 0;
    reg [26:0]hex;
    // 实例化开发板显示模块
    display_seg uut(
        .clk(clk),
        .reset(!reset),
        .choice(ch),
        .hex(hex),
        .speed(speed),
        .anodes(anodes),
        .segments(segments),
        .led(led)
        );
    // 测试数据
    always @(number) begin
        casex(number)
            8'b1xxxxxxx: begin ch <= 2'b01; end
            8'b01xxxxxx: begin ch <= 2'b11; end
            8'b001xxxxx: begin hex <= 01010101; ch <= 2'b10; end
            8'b0001xxxx: begin hex <= 10271828; ch <= 2'b10; end
            8'b00001xxx: begin hex <= 99999999; ch <= 2'b00; end
            8'b000001xx: begin hex <= 98765432; ch <= 2'b00; end
            8'b0000001x: begin hex <= 55555555; ch <= 2'b00; end
            8'b00000001: begin hex <= 123; ch <= 2'b00; end
            default: begin hex <= 00000000; ch <= 2'b00; end
        endcase
    end
endmodule
