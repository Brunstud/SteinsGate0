`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg reset;
    reg [7:0] choice;
    wire [7:0] anodes;
    wire [7:0] segments;

    // ʵ�����߶���ʾģ��
    test_ssd uut (
        .clk(clk),
        .reset(reset),
        .choice(choice),
        .anodes(anodes),
        .segments(segments)
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
        #100; // �ȴ�һ��ʱ�����ȶ���ʼ״̬

        // �ͷ������ź�
        reset = 0;
        number = 32'h12345678; // ����һ����������
        #1000; // �ȴ�һ��ʱ���Թ۲����

        // ��������
        number = 32'h87654321;
        #1000; // �����۲����

        // ���ò���������
        reset = 1;
        #100;
        $finish;
    end

endmodule