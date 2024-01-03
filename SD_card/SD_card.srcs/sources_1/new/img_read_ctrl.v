`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 22:23:43
// Design Name: 
// Module Name: sd_read_ctrl
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


module img_read_ctrl(
    input                clk            ,  // ʱ���ź�
    input                rst            ,  // ��λ�ź�
    
    input                rd_busy        ,  // SD����æ
    output  reg          rd_start_en    ,  // ��ʼдSD�������ź�
    output  reg  [31:0]  rd_sec_addr       // ������������ַ
    );

/**************************************************************   
��������(16��ͼƬ�ĵ�ַ)
*************************************************************/
parameter PIC_ADDR0 = 32'd23040 ; 
parameter PIC_ADDR1 = 32'd28288 ;
parameter PIC_ADDR2 = 32'd34688 ;
parameter PIC_ADDR3 = 32'd32128 ;

parameter PIC_ADDR4 = 32'd29568 ;
parameter PIC_ADDR5 = 32'd26880 ;
parameter PIC_ADDR6 = 32'd24320 ;
parameter PIC_ADDR7 = 32'd16640 ;

parameter PIC_ADDR8 = 32'd19200 ;
parameter PIC_ADDR9 = 32'd17920 ;
parameter PIC_ADDR10 = 32'd25664 ;
parameter PIC_ADDR11 = 32'd30848 ;

parameter PIC_ADDR12 = 32'd35968 ;
parameter PIC_ADDR13 = 32'd33408 ;
parameter PIC_ADDR14 = 32'd20480 ;
parameter PIC_ADDR15 = 32'd21760 ;

parameter RD_NUM     = 11'd1200  ;          // ����ͼƬ�ܹ������Ĵ���(640*480*16/256)
parameter ONE_SECOND = 32'd130_000_000    ; // ��ʱ2.5���ȡ����ͼƬ


/**************************************************************   
�Ĵ�������������
*************************************************************/
reg    [1:0]          rd_flow_cnt       ;    // ���������̿��Ƽ�����
reg    [10:0]         rd_sec_cnt        ;    // ����������������
reg    [3:0]          rd_addr_sel       ;  
reg    [31:0]         delay_cnt         ;    // ��ʱ�л�ͼƬ������

reg                   rd_busy_bat0      ;    // ��æ�źŴ��ģ������ɼ��½���
reg                   rd_busy_bat1      ;  
wire                  neg_rd_busy       ;    // SD����æ�ź��½���

/**************************************************************   
��ʱ���ģ������ɼ�rd_busy���½���
*************************************************************/
assign  neg_rd_busy = (~rd_busy_bat0) & rd_busy_bat1;
always @(posedge clk or negedge rst) begin
    if(rst == 1'b0) begin
        rd_busy_bat0 <= 1'b0;
        rd_busy_bat1 <= 1'b0;
    end
    else begin
        rd_busy_bat0 <= rd_busy;
        rd_busy_bat1 <= rd_busy_bat0;
    end
end


/**************************************************************   
����ѭ����ȡ16��ͼƬ
*************************************************************/
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        rd_flow_cnt <= 2'd0;
        rd_addr_sel <= 2'b00;
        rd_sec_cnt  <= 11'd0;
        rd_start_en <= 1'b0;
        rd_sec_addr <= 32'd0;
    end
    else begin
        rd_start_en <= 1'b0;
        case(rd_flow_cnt)
            2'd0 : begin
                rd_flow_cnt <= rd_flow_cnt + 2'd1; // ��ʼ��ȡSD������
                rd_start_en <= 1'b1;
                rd_addr_sel <= rd_addr_sel + 4'd1; //������ַ�л�
                case (rd_addr_sel)
                    4'd0: 
                        rd_sec_addr <= PIC_ADDR0;
                    4'd1: 
                        rd_sec_addr <= PIC_ADDR1;
                    4'd2: 
                        rd_sec_addr <= PIC_ADDR2;
                    4'd3: 
                        rd_sec_addr <= PIC_ADDR3;
                    4'd4: 
                        rd_sec_addr <= PIC_ADDR4;
                    4'd5:
                        rd_sec_addr <= PIC_ADDR5;
                    4'd6:
                        rd_sec_addr <= PIC_ADDR6;
                    4'd7:
                        rd_sec_addr <= PIC_ADDR7;
                    4'd8:
                        rd_sec_addr <= PIC_ADDR8;
                    4'd9:
                        rd_sec_addr <= PIC_ADDR9;
                    4'd10:
                        rd_sec_addr <= PIC_ADDR10;
                    4'd11:
                        rd_sec_addr <= PIC_ADDR11;
                    4'd12:
                        rd_sec_addr <= PIC_ADDR12;
                    4'd13:
                        rd_sec_addr <= PIC_ADDR13;
                    4'd14:
                        rd_sec_addr <= PIC_ADDR14;
                    4'd15:
                        rd_sec_addr <= PIC_ADDR15;
                endcase
            end
            2'd1 : begin
                // ����һ������,��ʼ��ȡ��һ������ַ����
                if(neg_rd_busy) begin                          
                    rd_sec_cnt <= rd_sec_cnt + 11'd1;
                    rd_sec_addr <= rd_sec_addr + 32'd1;
                    //����ͼƬ����
                    if(rd_sec_cnt == RD_NUM - 11'b1) begin 
                        rd_sec_cnt <= 11'd0;
                        rd_flow_cnt <= rd_flow_cnt + 2'd1;
                    end    
                    else
                        rd_start_en <= 1'b1;
                end                    
            end
            2'd2 : begin
                //��ȡ��ɺ���ʱ2.5��
                delay_cnt <= delay_cnt + 32'd1;                
                if(delay_cnt == ONE_SECOND - 32'd1) begin
                    delay_cnt <= 32'd0;
                    rd_flow_cnt <= 2'd0;
                end 
            end    
            default : ;
        endcase    
    end
end

endmodule