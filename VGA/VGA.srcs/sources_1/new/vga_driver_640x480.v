`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/23 22:59:57
// Design Name: 
// Module Name: vga_driver_640x480
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 640x480����VGA������
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga_driver_640x480(
    input           clk_25MHz,         // VGA����ʱ��
    input           rst_n,              // ��λ�źţ��͵�ƽ��Ч

    output          vga_hs,             // ��ͬ���ź�
    output          vga_vs,             // ��ͬ���ź�
    output  [11:0]  vga_rgb,            // ���������

    input   [11:0]  pix_data,           // ���ص�����
    output  [11:0]  pix_xpos,           // ���ص������
    output  [11:0]  pix_ypos,           // ���ص�������
    
    output disp_en,                 //��ʾ��Ч�ź�
    output VS_negedge               //������ź��½���
    );

/**************************************************************   
�������Ĵ�������������(�ֱ���: 640*480 ʱ��Ƶ��: 25.175mhz λ����11λ )
*************************************************************/ 
parameter  H_SYNC   =  96;    // ��ͬ��
parameter  H_BACK   =  48;    // ����ʾ����
parameter  H_DISP   =  640;   // ����Ч����
parameter  H_FRONT  =  16;    // ����ʾǰ��
parameter  H_TOTAL  =  800;   // ��ɨ������

parameter  V_SYNC   =  2;     // ��ͬ��
parameter  V_BACK   =  33;    // ����ʾ����
parameter  V_DISP   =  480;   // ����Ч����
parameter  V_FRONT  =  10;    // ����ʾǰ��
parameter  V_TOTAL  =  525;   // ��ɨ������
                         
reg     [11:0]      cnt_h;      // ��ʱ�������           
reg     [11:0]      cnt_v;      // ��ʱ�������    

reg VS_reg1, VS_reg2;       //���ź���1->0ʱ�����½���ʱ�Ž���״̬ת�ơ�ÿһ֡���½��أ�ͼƬ��������һ֡һ֡���˶������������˶��γɶ���

/**************************************************************   
VGAʱ�ӣ�25M
*************************************************************/
wire vga_clk;
assign vga_clk = clk_25MHz;

/**************************************************************   
VGA��ʾ
*************************************************************/
// VGA�������ݱ�־  
wire pix_data_req_flag;
assign pix_data_req_flag = ((cnt_h >= (H_SYNC + H_BACK          )) &&
                            (cnt_h <= (H_SYNC + H_BACK + H_DISP )) && 
                            (cnt_v >= (V_SYNC + V_BACK          )) &&
                            (cnt_v <= (V_SYNC + V_BACK + V_DISP )))
                            ?  1'b1 : 1'b0;

// ��������ص�����
assign pix_xpos = pix_data_req_flag ? (cnt_h - (H_SYNC + H_BACK)) : 12'd0;
assign pix_ypos = pix_data_req_flag ? (cnt_v - (V_SYNC + V_BACK)) : 12'd0;

// VGA�г�ͬ���ź�
assign vga_hs  = (cnt_h < H_SYNC ) ? 1'b0 : 1'b1;
assign vga_vs  = (cnt_v < V_SYNC ) ? 1'b0 : 1'b1;

// �м���������
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

// ����������
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

//�����Ƿ�Ϊ��ʱ���½���
always @ (posedge vga_clk or negedge rst_n) begin
      if(!rst_n) begin
          VS_reg1 <= 0;
          VS_reg2 <= 0;
      end else begin
          VS_reg1 <= vga_vs;
          VS_reg2 <= VS_reg1;     //��������ֵ���˿�reg1��ֵ�ǵ�ǰclk�����ص�VS��reg2Ϊ��һclk�����ص�VS
      end
  end
  
 assign VS_negedge = ~VS_reg1 & VS_reg2; //���ȼ�~����&��VS��1��Ϊ0ʱ������ֵȡ1����ΪͼƬ�ƶ�״̬��ת�Ƶ���Ч�źţ��������ϣ�

// RGB��ʾ��ʹ���ź�
assign disp_en  = pix_data_req_flag;

// VGA��ʾ��������
assign vga_rgb = disp_en ? pix_data : 12'd0;

endmodule