`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 16:50:02
// Design Name: 
// Module Name: Gate_logic_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gate_logic_tb;

  // ����ʱ������
  reg clk;
  // Ϊģ�鶨���ź�
  reg ena, rst_n, next_s;
  reg [2:0] operation;
  wire [1:0] character;
  wire [26:0] offset;
  wire [3:0] speed;
  wire [12:0] obstacle;
  wire game_over, game_win;
  
  //����
  wire [15:0] phi;
  wire [23:0] off;
  // ʵ��������ģ��
  Gate_logic uut (
    .ena(ena),
    .clk(clk),
    .rst_n(rst_n),
    .next_s(next_s),
    .operation(operation),
    .character(character),
    .offset(offset),
    .speed(speed),
    .obstacle(obstacle),
    .game_over(game_over),
    .game_win(game_win),
    //����
    .phi(phi),
    .off(off)
  );
  
  // �����ʼʱ������
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // ����һ��50%ռ�ձȵ�ʱ���źţ�����Ϊ10��ʱ�䵥λ
  end
  
  // ������Թ���
  initial begin
    // ��ʼ�����������ź�
    ena = 0;
    rst_n = 0;
    next_s = 0;
    operation = 0;
    
    // ��ʼ��������
    #10 ena = 1; // ʹ���ź�
        
    // �ȴ�һ��ʱ�䣬Ȼ�󼤻λ�ź�
    #10 rst_n = 1;
    
    // �ڴ���Ӹ���Ĳ��Բ��裬������Ҫ���������ź�
    #20 operation = 3'b001;
    next_s = 1;
    //repeat(2) begin #5 next_s = 1; #5 next_s = 0; end // n������
    
    #20 operation = 3'b100;
    //repeat(2) begin #20 next_s = 1; #5 next_s = 0; end // n������
    
    #20 operation = 3'b010;
    //repeat(60) begin #20 next_s = 1; #5 next_s = 0; end // n������
    
    // �ȴ�һ��ʱ�䣬�۲�����ź�
    #100 $display("Character: %b, Offset: %b, Speed: %b, Obstacle: %b, Game Over: %b, Game Win: %b", character, offset, speed, obstacle, game_over, game_win);
    
    // �ڴ���Ӹ���Ĳ��Բ��裬������Ҫ���������ź�
    
    // ��������
  end
  
endmodule
