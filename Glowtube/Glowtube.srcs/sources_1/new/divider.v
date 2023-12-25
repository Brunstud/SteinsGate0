`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/24 12:34:00
// Design Name: 
// Module Name: divider
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


//��Ƶ��20M
module divider_20M (
    input I_CLK, //����ʱ���źţ���������Ч
    input rst,   //��λ�źţ��͵�ƽ��Ч
    output O_CLK //���ʱ��
);
// Ĭ�Ϸ�Ƶ����
parameter DIV_FACTOR = 20000000;
reg [$clog2(DIV_FACTOR) - 1:0] count; // ������
reg O_CLK_reg; // �ڲ�ʱ�����
initial O_CLK_reg <= 1'b0;//��ʼ��
  // �������߼� ͬ����λ
  always @(posedge I_CLK) begin
  if (!rst) begin
      count <= 0;
      O_CLK_reg <= 0;
  end else begin
      if (count == DIV_FACTOR - 1) begin
          count <= 0;
          O_CLK_reg <= ~O_CLK_reg; // ������Ƶ���ʱ���ź�
      end else begin
          count <= count + 1;
      end
  end
  end

  // ���
  assign O_CLK = O_CLK_reg;
endmodule

//��Ƶ��5M
module divider_5M (
    input I_CLK, //����ʱ���źţ���������Ч
    input rst,   //��λ�źţ��͵�ƽ��Ч
    output O_CLK //���ʱ��
);
// Ĭ�Ϸ�Ƶ����
parameter DIV_FACTOR = 5000000;
reg [$clog2(DIV_FACTOR) - 1:0] count; // ������
reg O_CLK_reg; // �ڲ�ʱ�����
initial O_CLK_reg <= 1'b0;//��ʼ��
  // �������߼� ͬ����λ
  always @(posedge I_CLK) begin
  if (!rst) begin
      count <= 0;
      O_CLK_reg <= 0;
  end else begin
      if (count == DIV_FACTOR - 1) begin
          count <= 0;
          O_CLK_reg <= ~O_CLK_reg; // ������Ƶ���ʱ���ź�
      end else begin
          count <= count + 1;
      end
  end
  end

  // ���
  assign O_CLK = O_CLK_reg;
endmodule
