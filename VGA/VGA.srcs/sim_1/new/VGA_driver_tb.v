`timescale 1ns / 1ps
module VGA_driver_tb;
    reg clk;       // ����ʱ���ź�
    reg rst_n;     // ��λ�źţ�����Ч��
    wire hsync;     // ˮƽͬ���ź�
    wire vsync;     // ��ֱͬ���ź�
    wire [3:0] red; // ��ɫ����
    wire [3:0] green; // ��ɫ����
    wire [3:0] blue;   // ��ɫ����
    
    // ����ʱ�Ӳ���
    parameter CLK_PERIOD = 2; // ʱ�����ڣ���λ��ns��

    // ����ʱ���ź�
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // ������λ�ź�
    initial begin
        clk = 0;
        rst_n = 0;
        #10; // �ȴ�һ��ʱ����ͷŸ�λ
        rst_n = 1;
    end

    // ʵ���������Ե� VGA_driver ģ��
    VGA_driver dut (
        .clk(clk),
        .rst_n(rst_n),
        .hsync(hsync),
        .vsync(vsync),
        .red(red),
        .green(green),
        .blue(blue)
    );

    // ������������߼��Ͷ��ԣ�Assertions��...

    // ģ��ʱ��
    initial #5000 $finish; // ģ��5000��ʱ�����ں�ֹͣ����

endmodule
