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
// Description: �ۺϰ���ʾ
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display_seg(
    input clk,             // ʱ���ź�
    input reset,           // �����źţ��͵�ƽ��Ч
    input [1:0] choice,    // ��ʾģʽ��00:ֻ��ʾ����;10:��ʾ���ֺ��ٶ�;01:��Ϸ��ʼ;11:��Ϸ����;
    input [26:0] hex,      // Ҫ��ʾ��27bitʮ����������
    input [3:0] speed,     // Ҫ��ʾ���ٶ�ֵ
    output [7:0] anodes,   // �����źţ�AN0..AN7��
    output [7:0] segments, // ���źţ�A..G����С���� DP
    output [15:0] led      // led�ٶ���ʾ��
    );
    wire [31:0]bcd; //��תbcd��
    // ʵ����bcd��ת��
    hex_to_bcd uut1(
        .hex(hex), 
        .bcd(bcd)
        );
    // ʵ�����߶���ʾģ��
    seven_segment_display uut0 (
        .clk(clk),
        .reset(reset),
        .choice(choice),
        .bcdnum(bcd),
        .anodes(anodes),
        .segments(segments)
        );
    // ʵ�����ٶ�led��ʾ����ֻ�е�choice=10ʱ�Ż���ʾ
    speed_led_display uut2(
        .clk(clk),
        .ena(reset && choice != 2'b00), 
        .flicker(choice[0]),
        .speed(speed), 
        .led(led)
        );
endmodule
