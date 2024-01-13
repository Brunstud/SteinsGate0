`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg reset;
    reg [7:0] number;
    reg [3:0] speed;
    wire [7:0] anodes;
    wire [7:0] segments;
    wire [15:0] led;

    // ʵ�����߶���ʾģ��
    test_ssd uut (
        .clk(clk),
        .reset(reset),
        .number(number),
        .speed(speed),
        .anodes(anodes),
        .segments(segments),
        .led(led)
    );

    // ʱ���ź�����
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // ����һ������Ϊ 20ns ��ʱ���ź�
    end

    // ��������
    initial begin
        // ��ʼ��
        reset = 1;
        number = 0;
        speed = 0;
        #100; // �ȴ�һ��ʱ�����ȶ���ʼ״̬

        // �ͷ������ź�
        reset = 0;
        number = 8'b1000_0000; // ����һ����������
        speed = 4;
        #100_0000; // �ȴ�һ��ʱ���Թ۲����

        // ��������
        number = 8'b0001_0000;
        speed = 8;
        #100_0000; // �����۲����

        // ���ò���������
        reset = 1;
        #100;
        $finish;
    end

endmodule