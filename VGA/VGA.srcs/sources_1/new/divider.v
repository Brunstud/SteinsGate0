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
// Description: 分频器
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//分频器2
module divider_2 (
    input I_CLK,     //输入时钟信号，上升沿有效
    input I_rst_n,   //复位信号，低电平有效
    output O_CLK     //输出时钟
);
// 2分频
reg O_CLK_reg; // 内部时钟输出
always @(posedge I_CLK or negedge I_rst_n)
begin
    if(!I_rst_n)
        O_CLK_reg   <=  1'b0        ;
    else
        O_CLK_reg   <=  ~O_CLK_reg  ;     
end

  // 输出
  assign O_CLK = O_CLK_reg;
endmodule

//分频器4
module divider_4 (
    input I_CLK,     //输入时钟信号，上升沿有效
    input I_rst_n,   //复位信号，低电平有效
    output O_CLK     //输出时钟
);
// 4分频
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

  // 输出
  assign O_CLK = O_CLK_reg;
endmodule

//分频1M
module divider_1M (
    input I_CLK, //输入时钟信号，上升沿有效
    input rst,   //复位信号，低电平有效
    output O_CLK //输出时钟
);
// 默认分频倍数
parameter DIV_FACTOR = 1000000;
reg [$clog2(DIV_FACTOR) - 1:0] count; // 计数器
reg O_CLK_reg; // 内部时钟输出
initial O_CLK_reg <= 1'b0;//初始化
  // 计数器逻辑 同步复位
  always @(posedge I_CLK) begin
  if (!rst) begin
      count <= 0;
      O_CLK_reg <= 0;
  end else begin
      if (count == DIV_FACTOR - 1) begin
          count <= 0;
          O_CLK_reg <= ~O_CLK_reg; // 产生分频后的时钟信号
      end else begin
          count <= count + 1;
      end
  end
  end

  // 输出
  assign O_CLK = O_CLK_reg;
endmodule

//分频100M
module divider_100M (
    input I_CLK, //输入时钟信号，上升沿有效
    input rst,   //复位信号，低电平有效
    output O_CLK //输出时钟
);
// 默认分频倍数
parameter DIV_FACTOR = 100000000;
reg [$clog2(DIV_FACTOR) - 1:0] count; // 计数器
reg O_CLK_reg; // 内部时钟输出
initial O_CLK_reg <= 1'b0;//初始化
  // 计数器逻辑 同步复位
  always @(posedge I_CLK) begin
  if (!rst) begin
      count <= 0;
      O_CLK_reg <= 0;
  end else begin
      if (count == DIV_FACTOR - 1) begin
          count <= 0;
          O_CLK_reg <= ~O_CLK_reg; // 产生分频后的时钟信号
      end else begin
          count <= count + 1;
      end
  end
  end

  // 输出
  assign O_CLK = O_CLK_reg;
endmodule