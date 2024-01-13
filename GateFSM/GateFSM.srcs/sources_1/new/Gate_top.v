`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/13 16:26:56
// Design Name: 
// Module Name: Gate_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ����ʯŤ��topģ��
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gate_top(   
    input clk,             // ʱ���ź�
    input reset,           // �����źţ��ߵ�ƽ��Ч
    input [2:0] SIABW,     // ��ת������SIA��SIB��SW����
    output [7:0] anodes,   // �����źţ�AN0..AN7��
    output [7:0] segments, // ���źţ�A..G����С���� DP
    output [15:0] led,     // led�ٶ���ʾ��
    output          vga_hs,             // ��ͬ���ź�
    output          vga_vs,             // ��ͬ���ź�
    output  [11:0]  vga_rgb             // ���������
    );
  // ������ʹ��
  wire RS_ena;
  wire GL_ena;
  wire DP_ena;
  wire [1:0] DP_choice;
  wire VGA_ena;
  // ���ݲ���
  wire [2:0] operation;  // �������
  wire [26:0] offset;    // ������ƫ����0-999999
  wire VS_negedge;       // ��ʼ����Ǻţ��ߵ�ƽ������Ƶ��Ϊ60Hz��
  wire [2:0] charac;     // ��ɫ���
  wire [3:0] speed;      // �ٶȱ��
  wire [9:0] obstacle;   // �ϰ���λ��
  wire [7:0] obstimes;   // �ϰ����С
  wire [9:0] progress;   // ���ȱ��
  wire [7:0] offgress;   // ���ȱ��
  wire [1:0] over_flag;  // ��Ϸ�������
  // ϵͳ������
  Gate_ctrl ctrl_uut(
      .clk(clk),            // ϵͳʱ��
      .rst_n(!reset),       // �����ź�
      .op(operation),       // ��ת�����������ź�
      .GL_over(over_flag),  // ��Ϸ�߼�ģ��Ľ����ź�(win,over)
      .VGA_comp(VS_negedge),// VGA���һ����ӡ�ź�
      .RS_en(RS_ena),       // ��ת������ģ��ʹ���ź�
      .GL_en(GL_ena),       // ��Ϸ�߼�����ģ��ʹ���ź�
      .DP_en(DP_ena),       // ��������ʾģ��ʹ���ź�
      .DP_ch(DP_choice),    // ��������ʾ����
      .VGA_en(VGA_ena)      // VGA��ʾģ��ʹ���ź�
  );
  // ��ת����������
  RotationSensor rs_uut(
      .clk(clk),               // ʱ���ź�
      .rst_n(RS_ena),          // ��λ�ź�
      .SIABW(SIABW),           // ��ת������SIA��SIB��SW����
      .operation(operation)    // ˳ʱ�롢��ʱ�롢��ѹ���
  );
  // ʵ���������߼�
  meet_logic gate_uut (
      .clk(clk),
      .rst_n(GL_ena),
      .next_s(VS_negedge),
      .operation(operation),
      
      .character(charac),
      .offset(offset),
      .speed(speed),
      .obstacle(obstacle),
      .obstimes(obstimes),
      .progress(progress),
      .offgress(offgress),
      
      .game_over(over_flag[0]),
      .game_win(over_flag[1])
    );
  // �Թ����ʾoffsetֵ
  display_seg seg_uut(
       .clk(clk),
       .reset(DP_ena),
       .choice(DP_choice),
       .hex(offset),
       .speed(speed),
       .anodes(anodes),
       .segments(segments),
       .led(led)
   );
   // VGA��ʾ��
   vga_top vga_uut(
       .clk_100MHz(clk),        // ��׼ʱ��
       .rst_n(VGA_ena),         // ��λ�źţ��͵�ƽ��Ч
       
       .chara(charac),          // ��ɫ״̬
       .speed(speed),           // �н��ٶ�
       .obstacle(obstacle),     // �ϰ���λ��
       .obstimes(obstimes),     // �ϰ����С
       .progress(progress),     // ������
       .offgress(offgress),     // ������
       
       .vga_hs(vga_hs),          // ��ͬ���ź�
       .vga_vs(vga_vs),          // ��ͬ���ź�
       .vga_rgb(vga_rgb),        // ���������
       .VS_negedge(VS_negedge)   // �½����ź�
   );
endmodule
