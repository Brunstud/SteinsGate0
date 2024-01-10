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
    .reset(reset), 
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
    #20; SIA = 1; SIB = 1;
    #200; SIA = 0; SIB = 1;
    #20; SIA = 0; SIB = 0;

    // ģ����ʱ����ת
    #80; SIA = 0; SIB = 1;
    #20; SIA = 1; SIB = 1;
    #200; SIA = 1; SIB = 0;
    #20; SIA = 0; SIB = 0;

    // ģ�ⰴѹ����
    #80; SW = 1;
    #200; SW = 0;

    // ����ģ��
    #100;
end

// ʱ���ź�����
always #10 clk = ~clk; // ����50MHz��ʱ��

endmodule
