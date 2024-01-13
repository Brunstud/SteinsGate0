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

// ʵ����������ģ��
RotaryEncoder uut (
    .clk(clk), 
    .rst_n(reset), 
    .SIA(SIA), 
    .SIB(SIB), 
    .SW(SW), 
    .CW(CW), 
    .CCW(CCW), 
    .Pressed(Pressed)
);

initial begin
    // ��ʼ���ź�
    clk = 0;
    reset = 1;
    SIA = 0;
    SIB = 0;
    SW = 0;

    // ��λ
    #20;
    reset = 0;

    // ģ��˳ʱ����ת
    #20; SIA = 1; SIB = 0;
    #10_0000; SIA = 1; SIB = 1;
    #100_0000; SIA = 0; SIB = 1;
    #20; SIA = 0; SIB = 0;

    // ģ����ʱ����ת
    #80; SIA = 0; SIB = 1;
    #10_0000; SIA = 1; SIB = 1;
    #100_0000; SIA = 1; SIB = 0;
    #20; SIA = 0; SIB = 0;

    // ģ�ⰴѹ����
    #80; SW = 1;
    #100_0000; SW = 0;

    // ����ģ��
    #100;
    $finish;
end

// ʱ���ź�����
always #1 clk = ~clk; // ����500MHz��ʱ��

endmodule
