`timescale 1ns / 1ps
module vga_linear_test_1024x600
(
    input                   I_clk   , // ϵͳʱ��
    input                   I_rst_n , // ϵͳ��λ
    output   reg   [3:0]    O_red   , // VGA��ɫ���� (4-bit)
    output   reg   [3:0]    O_green , // VGA��ɫ���� (4-bit)
    output   reg   [3:0]    O_blue  , // VGA��ɫ���� (4-bit)
    output                  O_hs    , // VGA��ͬ���ź�
    output                  O_vs      // VGA��ͬ���ź�
);

// ����ʱ����������������ʾ�����е���
parameter      C_H_SYNC_PULSE      =   136 ,  // ˮƽͬ��������
                C_H_BACK_PORCH      =   160,  // ˮƽ����
                C_H_ACTIVE_TIME     =   1024,  // ˮƽ��Ч��ʾ����
                C_H_FRONT_PORCH     =   24  ,  // ˮƽǰ��
                C_H_LINE_PERIOD     =   1344;  // ˮƽ������

parameter      C_V_SYNC_PULSE      =   3   ,  // ��ֱͬ��������
                C_V_BACK_PORCH      =   23  ,  // ��ֱ����
                C_V_ACTIVE_TIME     =   600 ,  // ��ֱ��Ч��ʾ����
                C_V_FRONT_PORCH     =   1   ,  // ��ֱǰ��
                C_V_FRAME_PERIOD    =   627 ;  // ��ֱ������

parameter       C_COLOR_BAR_WIDTH   =   C_H_ACTIVE_TIME / 8  ;  

reg [11:0]      R_h_cnt         ; // ��ʱ�������
reg [11:0]      R_v_cnt         ; // ��ʱ�������
reg             R_clk_50M       ;

wire            W_active_flag   ; // �����־��������ź�Ϊ1ʱRGB�����ݿ�����ʾ����Ļ��

//////////////////////////////////////////////////////////////////
//���ܣ� ����25MHz������ʱ��
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
// ���ܣ�������ʱ��
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
// ���ܣ�������ʱ��
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
// ���ܣ�����ʾ����Ļ�ֳ�8�����У�ÿ�����еĿ����?
//////////////////////////////////////////////////////////////////
always @(posedge R_clk_50M or negedge I_rst_n) begin
    if (!I_rst_n) begin
        O_red <= 0;
        O_green <= 0;
        O_blue <= 0;
    end else if (W_active_flag) begin
        // ���� R_h_cnt ��ֵ���趨��ɫ
        // ʾ�����ֱ����ɺ졢�̡�������ɫ��
        case ((R_h_cnt - C_H_SYNC_PULSE - C_H_BACK_PORCH) / C_COLOR_BAR_WIDTH)
            0: {O_red, O_green, O_blue} <= {4'hF, 4'h0, 4'h0}; // ��ɫ
            1: {O_red, O_green, O_blue} <= {4'h0, 4'hF, 4'h0}; // ��ɫ
            2: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'hF}; // ��ɫ
            3: {O_red, O_green, O_blue} <= {4'hF, 4'hF, 4'hF}; // ��ɫ
            4: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0}; // ��ɫ
            5: {O_red, O_green, O_blue} <= {4'hF, 4'hF, 4'h0}; // ��ɫ
            6: {O_red, O_green, O_blue} <= {4'hF, 4'h0, 4'hF}; // ��ɫ
            7: {O_red, O_green, O_blue} <= {4'h0, 4'hF, 4'hF}; // ��ɫ
            default: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0}; // ��ɫ
        endcase
    end else begin
        {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0};
    end
end

endmodule

module vga_linear_test_640x480
(
    input                   I_clk   , // ϵͳʱ��
    input                   I_rst_n , // ϵͳ��λ
    output   reg   [3:0]    O_red   , // VGA��ɫ���� (4-bit)
    output   reg   [3:0]    O_green , // VGA��ɫ���� (4-bit)
    output   reg   [3:0]    O_blue  , // VGA��ɫ���� (4-bit)
    output                  O_hs    , // VGA��ͬ���ź�
    output                  O_vs      // VGA��ͬ���ź�
);

// �ֱ���Ϊ640*480ʱ��ʱ�������������
parameter       C_H_SYNC_PULSE      =   96  , 
                C_H_BACK_PORCH      =   48  ,
                C_H_ACTIVE_TIME     =   640 ,
                C_H_FRONT_PORCH     =   16  ,
                C_H_LINE_PERIOD     =   800 ;

// �ֱ���Ϊ640*480ʱ��ʱ�������������               
parameter       C_V_SYNC_PULSE      =   2   , 
                C_V_BACK_PORCH      =   33  ,
                C_V_ACTIVE_TIME     =   480 ,
                C_V_FRONT_PORCH     =   10  ,
                C_V_FRAME_PERIOD    =   525 ;
                
parameter       C_COLOR_BAR_WIDTH   =   C_H_ACTIVE_TIME / 8  ;  

reg [11:0]      R_h_cnt         ; // ��ʱ�������
reg [11:0]      R_v_cnt         ; // ��ʱ�������
reg             R_clk_25M       ;

wire            W_active_flag   ; // �����־��������ź�Ϊ1ʱRGB�����ݿ�����ʾ����Ļ��

//////////////////////////////////////////////////////////////////
//���ܣ� ����25MHz������ʱ��
//////////////////////////////////////////////////////////////////
//4��Ƶ
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
// ���ܣ�������ʱ��
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
// ���ܣ�������ʱ��
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
// ���ܣ�����ʾ����Ļ�ֳ�8�����У�ÿ�����еĿ����?
//////////////////////////////////////////////////////////////////
always @(posedge R_clk_25M or negedge I_rst_n) begin
    if (!I_rst_n) begin
        O_red <= 0;
        O_green <= 0;
        O_blue <= 0;
    end else if (W_active_flag) begin
        // ���� R_h_cnt ��ֵ���趨��ɫ
        // ʾ�����ֱ����ɺ졢�̡�������ɫ��
        case ((R_h_cnt - C_H_SYNC_PULSE - C_H_BACK_PORCH) / C_COLOR_BAR_WIDTH)
            0: {O_red, O_green, O_blue} <= {4'hF, 4'h0, 4'h0}; // ��ɫ
            1: {O_red, O_green, O_blue} <= {4'h0, 4'hF, 4'h0}; // ��ɫ
            2: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'hF}; // ��ɫ
            3: {O_red, O_green, O_blue} <= {4'hF, 4'hF, 4'hF}; // ��ɫ
            4: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0}; // ��ɫ
            5: {O_red, O_green, O_blue} <= {4'hF, 4'hF, 4'h0}; // ��ɫ
            6: {O_red, O_green, O_blue} <= {4'hF, 4'h0, 4'hF}; // ��ɫ
            7: {O_red, O_green, O_blue} <= {4'h0, 4'hF, 4'hF}; // ��ɫ
            default: {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0}; // ��ɫ
        endcase
    end else begin
        {O_red, O_green, O_blue} <= {4'h0, 4'h0, 4'h0};
    end
end

endmodule