`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/23 23:02:36
// Design Name: 
// Module Name: vga_driver_1024x600
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 1024x600像素VGA驱动器
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga_driver_1024x600(
    input           clk_50MHz,            // VGA驱动时钟
    input           rst_n,                // 复位信号

    output          vga_hs,             // 行同步信号
    output          vga_vs,             // 场同步信号
    output  [11:0]  vga_rgb,            // 红绿蓝输出

    input   [11:0]  pix_data,           // 像素点数据
    output  [11:0]  pix_xpos,           // 像素点横坐标
    output  [11:0]  pix_ypos,            // 像素点纵坐标
    
    output disp_en,                 //显示有效信号
    output VS_negedge               //输出场信号下降沿
    );

/**************************************************************   
参数、寄存器、线网定义(分辨率: 1024*600 时钟频率: 50.561mhz 位数：12位 )
*************************************************************/ 
// 以下时序参数需根据您的显示器进行调整
parameter  H_SYNC   =  136;    // 行同步
parameter  H_BACK   =  160;    // 行显示后沿
parameter  H_DISP   =  1024;   // 行有效数据
parameter  H_FRONT  =  24;     // 行显示前沿
parameter  H_TOTAL  =  1344;   // 行扫描周期

parameter  V_SYNC   =  3;     // 场同步
parameter  V_BACK   =  23;    // 场显示后沿
parameter  V_DISP   =  600;   // 场有效数据
parameter  V_FRONT  =  1;     // 场显示前沿
parameter  V_TOTAL  =  627;   // 场扫描周期
                         
reg     [11:0]      cnt_h;      // 行时序计数器           
reg     [11:0]      cnt_v;      // 场时序计数器    

reg VS_reg1, VS_reg2;       //场信号由1->0时，即下降沿时才进行状态转移。每一帧的下降沿，图片看起来是一帧一帧的运动，进来连续运动形成动画

/**************************************************************   
VGA时钟：50M
*************************************************************/
wire vga_clk;
assign vga_clk = clk_50MHz;

/**************************************************************   
VGA显示
*************************************************************/
// VGA请求数据标志  
wire pix_data_req_flag;
assign pix_data_req_flag = ((cnt_h >= (H_SYNC + H_BACK          )) &&
                            (cnt_h <= (H_SYNC + H_BACK + H_DISP )) && 
                            (cnt_v >= (V_SYNC + V_BACK          )) &&
                            (cnt_v <= (V_SYNC + V_BACK + V_DISP )))
                            ?  1'b1 : 1'b0;

// 输出的像素点坐标
assign pix_xpos = pix_data_req_flag ? (cnt_h - (H_SYNC + H_BACK) + 1'b1) : 12'd0;
assign pix_ypos = pix_data_req_flag ? (cnt_v - (V_SYNC + V_BACK) + 1'b1) : 12'd0;

// VGA行场同步信号
assign vga_hs  = (cnt_h < H_SYNC ) ? 1'b0 : 1'b1;
assign vga_vs  = (cnt_v < V_SYNC ) ? 1'b0 : 1'b1;

// 行计数器计数
always @(posedge vga_clk or negedge rst_n) begin         
    if (!rst_n)
        cnt_h <= 12'd0;                                  
    else begin
        if(cnt_h < H_TOTAL - 1'b1)                                               
            cnt_h <= cnt_h + 1'b1;                               
        else 
            cnt_h <= 12'd0;  
    end
end

// 场计数计数
always @(posedge vga_clk or negedge rst_n)
begin
    if(!rst_n)
        cnt_v <=  12'd0   ;
    else if(cnt_v == V_TOTAL - 1'b1)
        cnt_v <=  12'd0   ;
    else if(cnt_h == H_TOTAL - 1'b1)
        cnt_v <=  cnt_v + 1'b1  ;
    else
        cnt_v <=  cnt_v ;                        
end   

//计算是否为场时序下降沿
always @ (posedge vga_clk or negedge rst_n) begin
      if(!rst_n) begin
          VS_reg1 <= 0;
          VS_reg2 <= 0;
      end else begin
          VS_reg1 <= vga_vs;
          VS_reg2 <= VS_reg1;     //非阻塞赋值，此刻reg1的值是当前clk上升沿的VS，reg2为上一clk上升沿的VS
      end
  end
  
 assign VS_negedge = ~VS_reg1 & VS_reg2; //优先级~高于&，VS由1变为0时，最终值取1，作为图片移动状态机转移的有效信号（来自网上）

// RGB显示的使能信号
assign disp_en  = pix_data_req_flag;

// VGA显示像素数据
assign vga_rgb = disp_en ? pix_data : 12'd0;

endmodule
