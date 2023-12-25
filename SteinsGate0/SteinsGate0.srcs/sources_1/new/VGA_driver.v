`timescale 1ns / 1ps
module VGA_driver (
    input wire clk,       // ����ʱ���ź�
    input wire rst_n,     // ��λ�źţ�����Ч��
    output reg hsync,     // ˮƽͬ���ź�
    output reg vsync,     // ��ֱͬ���ź�
    output reg [3:0] red, // ��ɫ����
    output reg [3:0] green, // ��ɫ����
    output reg [3:0] blue   // ��ɫ����
);

    // VGA ����
    parameter H_DISPLAY = 1024; // ˮƽ�ֱ���
    parameter H_SYNC_CYC = 96; // ˮƽͬ����������
    parameter H_FRONT_PORCH = 48; // ˮƽǰ������
    parameter H_BACK_PORCH = 16; // ˮƽ��������

    parameter V_DISPLAY = 768; // ��ֱ�ֱ���
    parameter V_SYNC_CYC = 2; // ��ֱͬ����������
    parameter V_FRONT_PORCH = 11; // ��ֱǰ������
    parameter V_BACK_PORCH = 31; // ��ֱ��������

    reg [10:0] h_count = 0; // ˮƽ������
    reg [10:0] v_count = 0; // ��ֱ������

    always @(posedge clk) begin
        // ˮƽ����������
        if (h_count == H_DISPLAY + H_SYNC_CYC + H_FRONT_PORCH + H_BACK_PORCH - 1)
            h_count <= 0;
        else
            h_count <= h_count + 1;

        // ��ֱ����������
        if (v_count == V_DISPLAY + V_SYNC_CYC + V_FRONT_PORCH + V_BACK_PORCH - 1) begin
            v_count <= 0;
            h_count <= 0; // ����ˮƽ������
        end
        else if (h_count == H_DISPLAY + H_SYNC_CYC + H_FRONT_PORCH + H_BACK_PORCH - 1)
            v_count <= v_count + 1;
    end
    
    //��λ�ź�
    always @(negedge rst_n) begin
            if (~rst_n) begin
                // �ڸ�λʱ���ü�������ͬ���ź�
                h_count <= 0;
                v_count <= 0;
                hsync <= 1;
                vsync <= 1;
                red <= 0;
                green <= 0;
                blue <= 0;
            end
        end

    // ����ˮƽͬ���ʹ�ֱͬ���ź�
    always @* begin
        if (h_count >= H_DISPLAY + H_SYNC_CYC + H_FRONT_PORCH && h_count < H_DISPLAY + H_SYNC_CYC + H_FRONT_PORCH + H_BACK_PORCH)
            hsync = 0; // ˮƽ����ʱ��
        else
            hsync = 1;

        if (v_count >= V_DISPLAY + V_SYNC_CYC + V_FRONT_PORCH && v_count < V_DISPLAY + V_SYNC_CYC + V_FRONT_PORCH + V_BACK_PORCH)
            vsync = 0; // ��ֱ����ʱ��
        else
            vsync = 1;
    end

    // ʾ����RGB���Ϊ�̶�ֵ
    always @* begin
        if (hsync == 0 || vsync == 0) begin
            red = 4'b1111; // ��������ɫ����Ϊ���ֵ
            green = 4'b0000; // ��������ɫ����Ϊ��Сֵ
            blue = 4'b0000; // ��������ɫ����Ϊ��Сֵ
        end
        else begin
            red = 4'b0000; // ��������ɫ����Ϊ��Сֵ
            green = 4'b1111; // ��������ɫ����Ϊ���ֵ
            blue = 4'b0000; // ��������ɫ����Ϊ��Сֵ
        end
    end

endmodule