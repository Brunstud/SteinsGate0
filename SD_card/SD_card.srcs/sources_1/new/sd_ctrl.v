`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 22:23:43
// Design Name: 
// Module Name: sd_ctrl
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


module sd_ctrl(
    input               clk_ref     ,  // ʱ���ź�
    input               rst         ,  // ��λ�ź�,�͵�ƽ��Ч

    // SD���ӿ�
    input               SD_CD       ,
    output              SD_RESET    ,
    output              SD_SCK      ,
    output              SD_CMD      ,
    inout   [3:0]       SD_DATA     ,

    // ��SD���ӿ�
    input               rd_start_en    ,    // ��ʼ��SD�������ź�
    input   [31:0]      rd_sec_addr    ,    // ������������ַ
    output              rd_busy        ,    // ������æ�ź�
    output              rd_val_en      ,    // ��������Ч�ź�
    output  [15:0]      rd_val_data    ,    // ������
    output  [18:0]      ram_wr_addr    ,    // д��ran�ĵ�ַ

    output              sd_init_done        // SD����ʼ������ź�
    );

/**************************************************************   
�������Ĵ�������������y������
*************************************************************/ 
wire    init_clk    ;       // ��ʼ��SD��ʱ�ĵ���ʱ��
wire    init_cs     ;       // ��ʼ��ģ��SDƬѡ�ź�
wire    init_mosi   ;       // ��ʼ��ģ��SD��������ź�

wire    rd_cs       ;       // ������ģ��SDƬѡ�ź�     
wire    rd_mosi     ;       // ������ģ��SD��������ź� 

wire    spi_miso    ;       // MISO�ӿ�
wire    spi_clk     ;       // CLK�ӿ�
reg     spi_cs      ;       // CS�ӿ�
reg     spi_mosi    ;       // MOSI�ӿ�

wire    clk_ref_neg ;       // ����λʱ��

// SPIģʽ�ӿ�
assign      SD_RESET        =   0;
assign      SD_DATA[1]      =   1;
assign      SD_DATA[2]      =   1;
assign      SD_DATA[3]      =   spi_cs    ;
assign      SD_CMD          =   spi_mosi  ;
assign      SD_SCK          =   spi_clk   ;
assign      spi_miso        =   SD_DATA[0];

// SD����SPI_CLK
assign  clk_ref_neg = ~clk_ref;
assign  spi_clk = (sd_init_done == 1'b0)  ?  init_clk  :  clk_ref_neg;

/**************************************************************   
SD���ӿڵ��ź�ѡ��
*************************************************************/ 
always @(*) begin
    if(sd_init_done == 1'b0) begin     
        spi_cs = init_cs;
        spi_mosi = init_mosi;
    end
    else if(rd_busy) begin
        spi_cs = rd_cs;
        spi_mosi = rd_mosi;       
    end
    else begin
        spi_cs = 1'b1;
        spi_mosi = 1'b1;
    end    
end    

/**************************************************************   
ʵ����SD����ʼ��ģ��
*************************************************************/ 
sd_init sd_init_ins(
    .clk_ref            (clk_ref),
    .rst                (rst),

    .sd_miso            (spi_miso),
    .sd_clk             (init_clk),
    .sd_cs              (init_cs),
    .sd_mosi            (init_mosi),

    .sd_init_done       (sd_init_done)
    );

/**************************************************************   
ʵ����SD����ģ��
*************************************************************/
sd_read sd_read_ins(
    .clk_ref            (clk_ref),
    .rst                (rst),
    
    .sd_miso            (spi_miso),
    .sd_cs              (rd_cs),
    .sd_mosi            (rd_mosi),

    .rd_start_en        (rd_start_en & sd_init_done),  
    .rd_sec_addr        (rd_sec_addr),
    .rd_busy            (rd_busy),
    .rd_val_en          (rd_val_en),
    .rd_val_data        (rd_val_data),

    .ram_wr_addr        (ram_wr_addr)
    );

endmodule