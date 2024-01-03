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
    input [2:0] operation,      // �����źţ���ת����ת����ť���ߵ�ƽ��Ч
    output [7:0] anodes,   // �����źţ�AN0..AN7��
    output [7:0] segments, // ���źţ�A..G����С���� DP
    output [15:0] led      // led�ٶ���ʾ��
    );
  wire [26:0] offset;    // ������ƫ����0-999999
  reg next_s;           // ��ʼ����Ǻţ��ߵ�ƽ������Ƶ��Ϊ60Hz��
  wire [1:0] charac;
  wire game_over;
  wire game_win;
  // ����next_sΪ60Hz
  wire clk_60Hz;        // 60Hzʱ��
  divider_60Hz(clk, !reset, clk_60Hz);
  always @(posedge clk_60Hz) begin
        next_s <= 1'b1;
        #2 next_s <= 1'b0;
  end
  // ʵ���������߼�
  Gate_logic gate_uut (
      .ena(1'b1),
      .clk(clk),
      .rst_n(!reset),
      .next_s(1'b1),
      .operation(operation),
      .character(charac),
      .offset(offset),
      .speed(speed),
      .obstacle(),
      .game_over(game_over),
      .game_win(game_win)
    );
  // �Թ����ʾoffsetֵ
  display_seg seg_uut(
       .clk(clk),
       .reset(!reset),
       .choice({!game_win, game_over}),
       .hex(offset),
       .speed(operation + charac[1]),
       .anodes(anodes),
       .segments(segments),
       .led(led)
   );
endmodule
