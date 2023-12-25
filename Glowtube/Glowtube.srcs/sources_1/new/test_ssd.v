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
    input clk,             // ʱ���ź�
    input reset,           // �����źţ��ߵ�ƽ��Ч
    input [7:0] number,    // Ҫ��ʾ�����֣�һ���˸����ֹ����ԣ�
    input [3:0] speed,     // Ҫ��ʾ���ٶ�ֵ
    output [7:0] anodes,   // �����źţ�AN0..AN7��
    output [7:0] segments, // ���źţ�A..G����С���� DP
    output [15:0] led      // led�ٶ���ʾ��
    );
    reg [1:0]ch = 0;
    reg [26:0]hex;
    // ʵ������������ʾģ��
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
    // ��������
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
