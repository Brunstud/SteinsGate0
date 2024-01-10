`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 18:11:13
// Design Name: 
// Module Name: divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ��Ƶ��
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//��Ƶ��2
module divider_2 (
    input I_CLK,     //����ʱ���źţ���������Ч
    input I_rst_n,   //��λ�źţ��͵�ƽ��Ч
    output O_CLK     //���ʱ��
);
// 2��Ƶ
reg O_CLK_reg; // �ڲ�ʱ�����
always @(posedge I_CLK or negedge I_rst_n)
begin
    if(!I_rst_n)
        O_CLK_reg   <=  1'b0        ;
    else
        O_CLK_reg   <=  ~O_CLK_reg  ;     
end

  // ���
  assign O_CLK = O_CLK_reg;
endmodule

//��Ƶ��4
module divider_4 (
    input I_CLK,     //����ʱ���źţ���������Ч
    input I_rst_n,   //��λ�źţ��͵�ƽ��Ч
    output O_CLK     //���ʱ��
);
// 4��Ƶ
reg count = 1'b0; 
reg O_CLK_reg;
always @(posedge I_CLK or negedge I_rst_n) 
begin 
    if(!I_rst_n)
    begin
      count <= 1'b0;
      O_CLK_reg <= 0;  
    end
    else if(count == 1'b1) 
    begin 
        count <= 1'b0; 
        O_CLK_reg <= ~ O_CLK_reg; 
    end 
    else
        count <= 1'b1; 
end

  // ���
  assign O_CLK = O_CLK_reg;
endmodule

//��Ƶ1M
module divider_1M (
    input I_CLK, //����ʱ���źţ���������Ч
    input rst,   //��λ�źţ��͵�ƽ��Ч
    output O_CLK //���ʱ��
);
// Ĭ�Ϸ�Ƶ����
parameter DIV_FACTOR = 1000000;
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

//��Ƶ100M
module divider_100M (
    input I_CLK, //����ʱ���źţ���������Ч
    input rst,   //��λ�źţ��͵�ƽ��Ч
    output O_CLK //���ʱ��
);
// Ĭ�Ϸ�Ƶ����
parameter DIV_FACTOR = 100000000;
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