`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 15:55:42
// Design Name: 
// Module Name: VGA_game_layers_syn
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ��Ϸͼ���ۺ�ģ��
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module VGA_game_layers_syn(
    input  vga_clk,                 // VGA����ʱ��
    input  disp_en,                 // ��ʾ��Ч�ź�
    
    input  [3:0] chara,             // ��ǰ��ɫ
    input  [3:0] speed,             // ǰ���ٶ�
    input  [9:0] obstacle,          // ��һ����ɫλ��
    input  [3:0] obstimes,          // ��һ����ɫ������
    input  [9:0] progress,          // ʱ�����
    input  [8:0] offgress,          // ƫ�ƽ���
    
    input  [11:0]  pix_xpos,        // ���ص������
    input  [11:0]  pix_ypos,        // ���ص�������
    output reg  [11:0]  pix_data    // ���ص�����
    );
parameter  H_DISP   =  1024;   // ˮƽ���ص���
parameter  V_DISP   =  600;    // ��ֱ���ص���
wire [4:0] vaild_layer;             // �жϸ�ͼ���Ƿ���Ч
wire [11:0] pix_data_layer [4:0];   // �����ͼ�����ص���Ϣ
        
always @(posedge vga_clk) begin
     if (disp_en && 
         pix_xpos >= 0  && pix_xpos < H_DISP && 
         pix_ypos >= 0  && pix_ypos < V_DISP) begin
     // ��ͼ�����ȼ���ʾͼƬ
          casex(vaild_layer)
              5'b00001: begin pix_data <= pix_data_layer[0]; end
              5'b0001x: begin pix_data <= pix_data_layer[1]; end
              5'b001xx: begin pix_data <= pix_data_layer[2]; end
              5'b01xxx: begin pix_data <= pix_data_layer[3]; end
              //5'b1xxxx: begin pix_data <= pix_data_layer[4]; end
              default: begin pix_data <= 12'hfff; end//Ĭ�ϰ�ɫ
          endcase
      end else begin
          pix_data <= 12'h000;
      end
end

// ʵ����ͼ��
BG_layer bg_inst(
    .vga_clk(vga_clk),          // VGA����ʱ��
    .disp_en(disp_en),          // ��ʾ��Ч�ź�
    .pix_xpos(pix_xpos),        // ���ص������
    .pix_ypos(pix_ypos),        // ���ص�������
    .valid({vaild_layer[0]}),      // �õ��Ƿ�������
    .pix_data(pix_data_layer[0])        // ���ص�����
    );
Satellbg_layer satellbg_inst(
    .vga_clk(vga_clk),          // VGA����ʱ��
    .disp_en(disp_en),          // ��ʾ��Ч�ź�
    .progress(progress),        // ����
    .pix_xpos(pix_xpos),        // ���ص������
    .pix_ypos(pix_ypos),        // ���ص�������
    .valid({vaild_layer[1]}),      // �õ��Ƿ�������
    .pix_data(pix_data_layer[1])        // ���ص�����
    );
Road_layer road_inst(
     .vga_clk(vga_clk),          // VGA����ʱ��
     .disp_en(disp_en),          // ��ʾ��Ч�ź�
     .forward(!(chara[0]^chara[1])),              // �����н�����
     .speed(speed),              // ·���н��ٶ�
     .pix_xpos(pix_xpos),        // ���ص������
     .pix_ypos(pix_ypos),        // ���ص�������
     .valid({vaild_layer[2]}),      // �õ��Ƿ�������
     .pix_data(pix_data_layer[2])        // ���ص�����
     );
Chara_layer chara_inst(
     .vga_clk(vga_clk),          // VGA����ʱ��
     .disp_en(disp_en),          // ��ʾ��Ч�ź�
     .chara(chara),              // ѡ��ǰ��ɫ
     .obstacle(obstacle),        // ��һ����ɫλ��
     .obstimes(obstimes),        // ��һ����ɫ������
     .progress(progress),        // ʱ�����
     .offgress(offgress),        // ƫ�ƽ���
     .pix_xpos(pix_xpos),        // ���ص������
     .pix_ypos(pix_ypos),        // ���ص�������
     .valid({vaild_layer[3]}),      // �õ��Ƿ�������
     .pix_data(pix_data_layer[3])        // ���ص�����
     );
/*Satellite_layer satellite_inst(
     .vga_clk(vga_clk),          // VGA����ʱ��
     .disp_en(disp_en),          // ��ʾ��Ч�ź�
     .basex(obstacle),           // �ϰ���λ��
     .times(obstimes),           // �ϰ����С
     .pix_xpos(pix_xpos),        // ���ص������
     .pix_ypos(pix_ypos),        // ���ص�������
     .valid({vaild_layer[4]}),      // �õ��Ƿ�������
     .pix_data(pix_data_layer[4])        // ���ص�����
     );*/
/*Progress_layer prog_inst(
     .vga_clk(vga_clk),          // VGA����ʱ��
     .disp_en(disp_en),          // ��ʾ��Ч�ź�
     .chara(chara),              // ��ǰ��ɫ
     .progress(progress),        // ʱ�����
     .offgress(offgress),        // ƫ�ƽ���
     .pix_xpos(pix_xpos),        // ���ص������
     .pix_ypos(pix_ypos),        // ���ص�������
     .valid({vaild_layer[4]}),      // �õ��Ƿ�������
     .pix_data(pix_data_layer[4])        // ���ص�����
     );*/
     
endmodule
