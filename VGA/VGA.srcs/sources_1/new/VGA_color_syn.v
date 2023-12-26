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
parameter  V_DISP   =  600;    // ��ֱ���ص���
wire [1:0] vaild_layer;             // �жϸ�ͼ���Ƿ���Ч
wire [11:0] pix_data_layer [1:0];   // �����ͼ�����ص���Ϣ
        
always @(posedge vga_clk) begin
     if (disp_en && 
         pix_xpos >= 0  && pix_xpos < H_DISP && 
         pix_ypos >= 0  && pix_ypos < V_DISP) begin
     // ��ͼ�����ȼ���ʾͼƬ
          casex(vaild_layer)
              2'b01: begin pix_data <= pix_data_layer[0]; end
              2'b1x: begin pix_data <= pix_data_layer[1]; end
              default: begin pix_data <= 12'hfff; end//Ĭ�ϰ�ɫ
          endcase
      end else begin
          pix_data <= 12'h000;
      end
end

// ʵ����ͼ��
Title_layer title_inst(
    .vga_clk(vga_clk),          // VGA����ʱ��
    .disp_en(disp_en),          // ��ʾ��Ч�ź�
    .pix_xpos(pix_xpos),        // ���ص������
    .pix_ypos(pix_ypos),        // ���ص�������
    .vaild({vaild_layer[0]}),      // �õ��Ƿ�������
    .pix_data(pix_data_layer[0])        // ���ص�����
    );
Character_layer chara_inst(
     .vga_clk(vga_clk),          // VGA����ʱ��
     .disp_en(disp_en),          // ��ʾ��Ч�ź�
     .pix_xpos(pix_xpos),        // ���ص������
     .pix_ypos(pix_ypos),        // ���ص�������
     .vaild({vaild_layer[1]}),      // �õ��Ƿ�������
     .pix_data(pix_data_layer[1])        // ���ص�����
     );
            
//////////////////////////////////////////////////////////////////
// ���ܣ�����ʾ����Ļ�ֳ�16ɫ��
//////////////////////////////////////////////////////////////////
/*always @(posedge vga_clk) begin
    if (disp_en) begin
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
end*/

endmodule
