`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 19:22:27
// Design Name: 
// Module Name: vga_test_tb
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


module vga_test_tb;

    reg clk_100MHz;        // ������ 100MHz ʱ��
    reg rst_n;             // �����ø�λ�ź�
    wire vga_hs;           // VGA ��ͬ���ź�
    wire vga_vs;           // VGA ��ͬ���ź�
    wire [11:0] vga_rgb;   // VGA RGB ���

    // ʵ���� vga_test ģ��
    vga_test uut(
        .clk_100MHz(clk_100MHz),
        .rst_n(rst_n),
        .vga_hs(vga_hs),
        .vga_vs(vga_vs),
        .vga_rgb(vga_rgb)
    );

    // ���� 100MHz ʱ���ź�
    initial begin
        clk_100MHz = 0;
        forever #5 clk_100MHz = ~clk_100MHz; // 100MHz ʱ������Ϊ 10ns
    end

    // ���ɸ�λ�ź�
    initial begin
        rst_n = 0;            // ��ʼ��λ
        #100 rst_n = 1;       // �ͷŸ�λ
        #1000000;             // �ȴ��㹻����ʱ���Թ۲� VGA �ź�
        $stop;                // ֹͣģ��
    end

    // ��ѡ�����һЩ�۲���Լ��ӹؼ��ź�
    initial begin
        $monitor("Time = %t, vga_hs = %b, vga_vs = %b, vga_rgb = %h",
                 $time, vga_hs, vga_vs, vga_rgb);
    end

endmodule
