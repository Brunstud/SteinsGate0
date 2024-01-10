`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 19:08:53
// Design Name: 
// Module Name: Gate_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: �߼�ģ�����
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gate_test(   
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
  wire [2:0] operation;  // �������
  wire [26:0] offset;    // ������ƫ����0-999999
  wire VS_negedge;       // ��ʼ����Ǻţ��ߵ�ƽ������Ƶ��Ϊ60Hz��
  wire [2:0] charac;    // ��ɫ���
  wire [3:0] speed;     // �ٶȱ��
  wire [9:0] obstacle;  // �ϰ���λ��
  wire [7:0] obstimes;  // �ϰ����С
  wire [9:0] progress;  // ���ȱ��
  wire [7:0] offgress;  // ���ȱ��
  wire game_over;       // ��Ϸ�������
  wire game_win;        // ��Ϸʤ�����
  // ��ת����������
  RotationSensor rs_uut(
      .clk(clk),               // ʱ���ź�
      .rst_n(!reset),          // ��λ�ź�
      .SIABW(SIABW),           // ��ת������SIA��SIB��SW����
      .operation(operation)    // ˳ʱ�롢��ʱ�롢��ѹ���
  );
  // ʵ���������߼�
  meet_logic gate_uut (
      .clk(clk),
      .rst_n(!reset),
      .next_s(VS_negedge),
      .operation(operation),
      
      .character(charac),
      .offset(offset),
      .speed(speed),
      .obstacle(obstacle),
      .obstimes(obstimes),
      .progress(progress),
      .offgress(offgress),
      
      .game_over(game_over),
      .game_win(game_win)
    );
  // �Թ����ʾoffsetֵ
  display_seg seg_uut(
       .clk(clk),
       .reset(!reset),
       .choice({!game_win, game_over}),
       .hex(offset),
       .speed(speed),
       .anodes(anodes),
       .segments(segments),
       .led(led)
   );
   // VGA��ʾ��
   vga_top vga_uut(
       .clk_100MHz(clk),        // ��׼ʱ��
       .rst_n(!reset),          // ��λ�źţ��ߵ�ƽ��Ч��������ԣ�
       
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
