`timescale 1ns / 1ps
module vga_linear_test_1024x600
(
    input                   I_clk   , // 系统时钟
    input                   I_rst_n , // 系统复位
    output   reg   [3:0]    O_red   , // VGA红色分量 (4-bit)
    output   reg   [3:0]    O_green , // VGA绿色分量 (4-bit)
    output   reg   [3:0]    O_blue  , // VGA蓝色分量 (4-bit)
    output                  O_hs    , // VGA行同步信号
    output                  O_vs      // VGA场同步信号
);

// 以下时序参数需根据您的显示器进行调整
parameter      C_H_SYNC_PULSE      =   136 ,  // 水平同步脉冲宽度
                C_H_BACK_PORCH      =   160,  // 水平后沿
                C_H_ACTIVE_TIME     =   1024,  // 水平有效显示区域
                C_H_FRONT_PORCH     =   24  ,  // 水平前沿
                C_H_LINE_PERIOD     =   1344;  // 水平总周期

parameter      C_V_SYNC_PULSE      =   3   ,  // 垂直同步脉冲宽度
                C_V_BACK_PORCH      =   23  ,  // 垂直后沿
                C_V_ACTIVE_TIME     =   600 ,  // 垂直有效显示区域
                C_V_FRONT_PORCH     =   1   ,  // 垂直前沿
                C_V_FRAME_PERIOD    =   627 ;  // 垂直总周期

parameter       C_COLOR_BAR_WIDTH   =   C_H_ACTIVE_TIME / 8  ;  

reg [11:0]      R_h_cnt         ; // 行时序计数器
reg [11:0]      R_v_cnt         ; // 列时序计数器
reg             R_clk_50M       ;

wire            W_active_flag   ; // 激活标志，当这个信号为1时RGB的数据可以显示在屏幕上

//////////////////////////////////////////////////////////////////
//功能： 产生25MHz的像素时钟
//////////////////////////////////////////////////////////////////
always @(posedge I_clk or negedge I_rst_n)
begin
    if(!I_rst_n)
        R_clk_50M   <=  1'b0        ;
    else
        R_clk_50M   <=  ~R_clk_50M  ;     
end
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// 功能：产生行时序
//////////////////////////////////////////////////////////////////
always @(posedge R_clk_50M or negedge I_rst_n)
begin
    if(!I_rst_n)
        R_h_cnt <=  12'd0   ;
    else if(R_h_cnt == C_H_LINE_PERIOD - 1'b1)
        R_h_cnt <=  12'd0   ;
    else
        R_h_cnt <=  R_h_cnt + 1'b1  ;                
end                

assign O_hs =   (R_h_cnt < C_H_SYNC_PULSE) ? 1'b0 : 1'b1    ; 
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// 功能：产生场时序
//////////////////////////////////////////////////////////////////
always @(posedge R_clk_50M or negedge I_rst_n)
begin
    if(!I_rst_n)
        R_v_cnt <=  12'd0   ;
    else if(R_v_cnt == C_V_FRAME_PERIOD - 1'b1)
        R_v_cnt <=  12'd0   ;
    else if(R_h_cnt == C_H_LINE_PERIOD - 1'b1)
        R_v_cnt <=  R_v_cnt + 1'b1  ;
    else
        R_v_cnt <=  R_v_cnt ;                        
end                

assign O_vs =   (R_v_cnt < C_V_SYNC_PULSE) ? 1'b0 : 1'b1    ; 
//////////////////////////////////////////////////////////////////  

assign W_active_flag =  (R_h_cnt >= (C_H_SYNC_PULSE + C_H_BACK_PORCH                  ))  &&
                        (R_h_cnt <= (C_H_SYNC_PULSE + C_H_BACK_PORCH + C_H_ACTIVE_TIME))  && 
                        (R_v_cnt >= (C_V_SYNC_PULSE + C_V_BACK_PORCH                  ))  &&
                        (R_v_cnt <= (C_V_SYNC_PULSE + C_V_BACK_PORCH + C_V_ACTIVE_TIME))  ;                     

//////////////////////////////////////////////////////////////////
// 功能：把显示器屏幕分成8个纵列，每个纵列的宽度是?
//////////////////////////////////////////////////////////////////
always @(posedge R_clk_50M or negedge I_rst_n) begin
    if (!I_rst_n) begin
        O_red <= 0;
        O_green <= 0;
        O_blue <= 0;
    end else if (W_active_flag) begin
        // 根据 R_h_cnt 的值来设定颜色
        // 示例：分别生成红、绿、蓝等颜色条
        case ((R_h_cnt - C_H_SYNC_PULSE - C_H_BACK_PORCH) / C_COLOR_BAR_WIDTH)
            0: {O_red, O_green, O_blue} <= {4'hF, 4'h0, 4'h0}; // 红色
            1: {O_red, O_green, O_blue} <= {4'h0, 4'hF, 4'h0}; // 绿色
            2: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'hF}; // 蓝色
            3: {O_red, O_green, O_blue} <= {4'hF, 4'hF, 4'hF}; // 白色
            4: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0}; // 黑色
            5: {O_red, O_green, O_blue} <= {4'hF, 4'hF, 4'h0}; // 黄色
            6: {O_red, O_green, O_blue} <= {4'hF, 4'h0, 4'hF}; // 紫色
            7: {O_red, O_green, O_blue} <= {4'h0, 4'hF, 4'hF}; // 青色
            default: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0}; // 黑色
        endcase
    end else begin
        {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0};
    end
end

endmodule

module vga_linear_test_640x480
(
    input                   I_clk   , // 系统时钟
    input                   I_rst_n , // 系统复位
    output   reg   [3:0]    O_red   , // VGA红色分量 (4-bit)
    output   reg   [3:0]    O_green , // VGA绿色分量 (4-bit)
    output   reg   [3:0]    O_blue  , // VGA蓝色分量 (4-bit)
    output                  O_hs    , // VGA行同步信号
    output                  O_vs      // VGA场同步信号
);

// 分辨率为640*480时行时序各个参数定义
parameter       C_H_SYNC_PULSE      =   96  , 
                C_H_BACK_PORCH      =   48  ,
                C_H_ACTIVE_TIME     =   640 ,
                C_H_FRONT_PORCH     =   16  ,
                C_H_LINE_PERIOD     =   800 ;

// 分辨率为640*480时场时序各个参数定义               
parameter       C_V_SYNC_PULSE      =   2   , 
                C_V_BACK_PORCH      =   33  ,
                C_V_ACTIVE_TIME     =   480 ,
                C_V_FRONT_PORCH     =   10  ,
                C_V_FRAME_PERIOD    =   525 ;
                
parameter       C_COLOR_BAR_WIDTH   =   C_H_ACTIVE_TIME / 8  ;  

reg [11:0]      R_h_cnt         ; // 行时序计数器
reg [11:0]      R_v_cnt         ; // 列时序计数器
reg             R_clk_25M       ;

wire            W_active_flag   ; // 激活标志，当这个信号为1时RGB的数据可以显示在屏幕上

//////////////////////////////////////////////////////////////////
//功能： 产生25MHz的像素时钟
//////////////////////////////////////////////////////////////////
//4分频
reg count = 1'b0; 
always @(posedge I_clk or negedge I_rst_n) 
begin 
    if(!I_rst_n)
    begin
      count <= 1'b0;
       R_clk_25M <= 0;  
    end
    else if(count == 1'b1) 
    begin 
        count <= 1'b0; 
         R_clk_25M <= ~ R_clk_25M; 
    end 
    else
        count <= 1'b1; 
end
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// 功能：产生行时序
//////////////////////////////////////////////////////////////////
always @(posedge R_clk_25M or negedge I_rst_n)
begin
    if(!I_rst_n)
        R_h_cnt <=  12'd0   ;
    else if(R_h_cnt == C_H_LINE_PERIOD - 1'b1)
        R_h_cnt <=  12'd0   ;
    else
        R_h_cnt <=  R_h_cnt + 1'b1  ;                
end                

assign O_hs =   (R_h_cnt < C_H_SYNC_PULSE) ? 1'b0 : 1'b1    ; 
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// 功能：产生场时序
//////////////////////////////////////////////////////////////////
always @(posedge R_clk_25M or negedge I_rst_n)
begin
    if(!I_rst_n)
        R_v_cnt <=  12'd0   ;
    else if(R_v_cnt == C_V_FRAME_PERIOD - 1'b1)
        R_v_cnt <=  12'd0   ;
    else if(R_h_cnt == C_H_LINE_PERIOD - 1'b1)
        R_v_cnt <=  R_v_cnt + 1'b1  ;
    else
        R_v_cnt <=  R_v_cnt ;                        
end                

assign O_vs =   (R_v_cnt < C_V_SYNC_PULSE) ? 1'b0 : 1'b1    ; 
//////////////////////////////////////////////////////////////////  

assign W_active_flag =  (R_h_cnt >= (C_H_SYNC_PULSE + C_H_BACK_PORCH                  ))  &&
                        (R_h_cnt <= (C_H_SYNC_PULSE + C_H_BACK_PORCH + C_H_ACTIVE_TIME))  && 
                        (R_v_cnt >= (C_V_SYNC_PULSE + C_V_BACK_PORCH                  ))  &&
                        (R_v_cnt <= (C_V_SYNC_PULSE + C_V_BACK_PORCH + C_V_ACTIVE_TIME))  ;                     

//////////////////////////////////////////////////////////////////
// 功能：把显示器屏幕分成8个纵列，每个纵列的宽度是?
//////////////////////////////////////////////////////////////////
always @(posedge R_clk_25M or negedge I_rst_n) begin
    if (!I_rst_n) begin
        O_red <= 0;
        O_green <= 0;
        O_blue <= 0;
    end else if (W_active_flag) begin
        // 根据 R_h_cnt 的值来设定颜色
        // 示例：分别生成红、绿、蓝等颜色条
        case ((R_h_cnt - C_H_SYNC_PULSE - C_H_BACK_PORCH) / C_COLOR_BAR_WIDTH)
            0: {O_red, O_green, O_blue} <= {4'hF, 4'h0, 4'h0}; // 红色
            1: {O_red, O_green, O_blue} <= {4'h0, 4'hF, 4'h0}; // 绿色
            2: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'hF}; // 蓝色
            3: {O_red, O_green, O_blue} <= {4'hF, 4'hF, 4'hF}; // 白色
            4: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0}; // 黑色
            5: {O_red, O_green, O_blue} <= {4'hF, 4'hF, 4'h0}; // 黄色
            6: {O_red, O_green, O_blue} <= {4'hF, 4'h0, 4'hF}; // 紫色
            7: {O_red, O_green, O_blue} <= {4'h0, 4'hF, 4'hF}; // 青色
            default: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0}; // 黑色
        endcase
    end else begin
        {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0};
    end
end

endmodule