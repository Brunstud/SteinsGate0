`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 18:17:42
// Design Name: 
// Module Name: VGA_color_syn
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ͼ���ۺ�ģ��
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module VGA_color_syn(
    input  vga_clk,                 // VGA����ʱ��
    input  disp_en,                 // ��ʾ��Ч�ź�
    input  [11:0]  pix_xpos,        // ���ص������
    input  [11:0]  pix_ypos,        // ���ص�������
    output reg  [11:0]  pix_data    // ���ص�����
    );
parameter  H_DISP   =  1024;   // ˮƽ���ص���
parameter  V_DISP   =  600;   // ��ֱ���ص���

//////////////////////////////////////////////////////////////////
// ���ܣ�����ʾ����Ļ�ֳ�8�����У�ÿ�����еĿ����?
//////////////////////////////////////////////////////////////////
always @(posedge vga_clk) begin
    if (disp_en) begin
    // ���� R_h_cnt ��ֵ���趨��ɫ
    // ʾ�����ֱ����ɺ졢�̡�������ɫ��
        case (pix_xpos * 4 / H_DISP + pix_ypos * 4 / V_DISP)
            0: pix_data <= 12'hF00; // ��ɫ
            1: pix_data <= 12'h0F0; // ��ɫ
            2: pix_data <= 12'h00F; // ��ɫ
            3: pix_data <= 12'hFFF; // ��ɫ
            4: pix_data <= 12'h000; // ��ɫ
            5: pix_data <= 12'hFF0; // ��ɫ
            6: pix_data <= 12'hF0F; // ��ɫ
            7: pix_data <= 12'h0FF; // ��ɫ
            default: pix_data <= 12'h000; // ��ɫ
        endcase
    end else begin
        pix_data <= 12'h000;
    end
end

endmodule
