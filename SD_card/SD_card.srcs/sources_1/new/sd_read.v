`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 22:23:43
// Design Name: 
// Module Name: sd_read
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


module sd_read(
    input                clk_ref        ,  // ʱ���ź�
    input                rst            ,  // ��λ�ź�

    input                sd_miso        ,  // SD��SPI�������������ź�
    output  reg          sd_cs          ,  // SD��SPIƬѡ�ź�
    output  reg          sd_mosi        ,  // SD��SPI������������ź�

    input                rd_start_en    ,  // ��ʼ��SD�������ź�
    input        [31:0]  rd_sec_addr    ,  // ������������ַ                        
    output  reg          rd_busy        ,  // ������æ�ź�
    output  reg          rd_val_en      ,  // ��������Ч�ź�
    output  reg  [15:0]  rd_val_data    ,  // ������

    output  reg  [18:0]  ram_wr_addr       // ��ram��ַ
    );

/**************************************************************   
�������������Ĵ�������
*************************************************************/
parameter      MAX_ADDR =  19'd307200;      // ram����ַ
reg            rd_start_en_bat0      ;      // ��ʱ����
reg            rd_start_en_bat1      ;      // ��ʱ����

reg            res_en        ;            // ����SD������������Ч�ź�      
reg    [7:0]   res_data      ;            // ����SD����������                  
reg            res_flag      ;            // ��ʼ���շ������ݵı�־            
reg    [5:0]   res_bit_cnt   ;            // ����λ���ݼ�����                  
                              
reg            rx_en_t       ;            // ����SD������ʹ���ź�
reg    [15:0]  rx_data_t     ;            // ����SD��������
reg            rx_flag       ;            // ��ʼ���յı�־
reg    [3:0]   rx_bit_cnt    ;            // ��������λ������
reg    [8:0]   rx_data_cnt   ;            // ���յ����ݸ���������
reg            rx_finish_en  ;            // �������ʹ���ź�
                              
reg    [3:0]   rd_ctrl_cnt   ;            // �����Ƽ�����
reg    [47:0]  cmd_rd        ;            // ������
reg    [5:0]   cmd_bit_cnt   ;            // ������λ������
reg            rd_data_flag  ;            // ׼����ȡ���ݵı�־

wire           pos_rd_start_en      ;     // ��ʼ��SD�������źŵ�������

/**************************************************************   
������ʱ���ĵķ����ɼ�rd_start_en��������
*************************************************************/
assign pos_rd_start_en = rd_start_en_bat0 & (~rd_start_en_bat1);
always @(posedge clk_ref or negedge rst) begin
    if(!rst) begin
        rd_start_en_bat0 <= 1'b0;
        rd_start_en_bat1 <= 1'b0;
    end    
    else begin
        rd_start_en_bat0 <= rd_start_en;
        rd_start_en_bat1 <= rd_start_en_bat0;
    end        
end

/**************************************************************   
����SD�����ص���Ӧ����
*************************************************************/
always @(negedge clk_ref or negedge rst) begin
    if(!rst) begin
        res_en <= 1'b0;
        res_data <= 8'd0;
        res_flag <= 1'b0;
        res_bit_cnt <= 6'd0;
    end    
    else begin
        
        if(sd_miso == 1'b0 && res_flag == 1'b0) begin
            res_flag <= 1'b1;
            res_data <= {res_data[6:0],sd_miso};
            res_bit_cnt <= res_bit_cnt + 6'd1;
            res_en <= 1'b0;
        end    
        else if(res_flag) begin
            res_data <= {res_data[6:0],sd_miso};
            res_bit_cnt <= res_bit_cnt + 6'd1;
            if(res_bit_cnt == 6'd7) begin
                res_flag <= 1'b0;
                res_bit_cnt <= 6'd0;
                res_en <= 1'b1; 
            end                
        end 

        else
            res_en <= 1'b0;        
    end
end 

/**************************************************************   
����SD�����ص���Ч����
*************************************************************/
always @(negedge clk_ref or negedge rst) begin
    if(!rst) begin
        rx_en_t <= 1'b0;
        rx_data_t <= 16'd0;
        rx_flag <= 1'b0;
        rx_bit_cnt <= 4'd0;
        rx_data_cnt <= 9'd0;
        rx_finish_en <= 1'b0;
    end    
    else begin
        rx_en_t <= 1'b0; 
        rx_finish_en <= 1'b0;
        // SD�����ص�����ͷ0xfe 8'b1111_1110
        if(rd_data_flag && sd_miso == 1'b0 && rx_flag == 1'b0)    
            rx_flag <= 1'b1;   
        else if(rx_flag) begin
            rx_bit_cnt <= rx_bit_cnt + 4'd1;
            rx_data_t <= {rx_data_t[14:0],sd_miso};
            if(rx_bit_cnt == 4'd15) begin 
                rx_data_cnt <= rx_data_cnt + 9'd1;
                // ���յ���BLOCK��512���ֽ� = 256 * 16bit
                if(rx_data_cnt <= 9'd255)
                    rx_en_t <= 1'b1;  
                else if(rx_data_cnt == 9'd257) begin   // ����CRCУ��ֵ
                    rx_flag <= 1'b0;
                    rx_finish_en <= 1'b1;
                    rx_data_cnt <= 9'd0;               
                    rx_bit_cnt <= 4'd0;
                end    
            end
        end       
        else
            rx_data_t <= 16'd0;
    end    
end    

/**************************************************************   
��SD�����Ͷ�����
*************************************************************/
always @(posedge clk_ref or negedge rst) begin
    if(!rst) begin
        sd_cs <= 1'b1;
        sd_mosi <= 1'b1;        
        rd_ctrl_cnt <= 4'd0;
        cmd_rd <= 48'd0;
        cmd_bit_cnt <= 6'd0;
        rd_busy <= 1'b0;
        rd_data_flag <= 1'b0;
    end   
    else begin
        case(rd_ctrl_cnt)
            4'd0 : begin
                rd_busy <= 1'b0;
                sd_cs <= 1'b1;
                sd_mosi <= 1'b1;
                if(pos_rd_start_en) begin
                    cmd_rd <= {8'h51,rd_sec_addr,8'hff};    // д�뵥�������CMD17
                    rd_ctrl_cnt <= rd_ctrl_cnt + 4'd1;      // ���Ƽ�������1
                    // ��ʼִ�ж�ȡ����,���߶�æ�ź�
                    rd_busy <= 1'b1;                      
                end    
            end
            4'd1 : begin
                if(cmd_bit_cnt <= 6'd47) begin              // ��ʼ��λ���Ͷ�����
                    cmd_bit_cnt <= cmd_bit_cnt + 6'd1;
                    sd_cs <= 1'b0;
                    sd_mosi <= cmd_rd[6'd47 - cmd_bit_cnt]; // �ȷ��͸��ֽ�
                end    
                else begin                                  
                    sd_mosi <= 1'b1;
                    if(res_en) begin                        // SD����Ӧ
                        rd_ctrl_cnt <= rd_ctrl_cnt + 4'd1;  // ���Ƽ�������1 
                        cmd_bit_cnt <= 6'd0;
                    end    
                end    
            end    
            4'd2 : begin
                // ����rd_data_flag�ź�,׼����������
                rd_data_flag <= 1'b1;                       
                if(rx_finish_en) begin                      // ���ݽ������
                    rd_ctrl_cnt <= rd_ctrl_cnt + 4'd1; 
                    rd_data_flag <= 1'b0;
                    sd_cs <= 1'b1;
                end
            end        
            default : begin
                // �������״̬��,����Ƭѡ�ź�,�ȴ�8��ʱ����������
                sd_cs <= 1'b1;   
                rd_ctrl_cnt <= rd_ctrl_cnt + 4'd1;
            end    
        endcase
    end         
end

/**************************************************************   
������ݺ�������Ч�ź�
*************************************************************/
always @(posedge clk_ref or negedge rst) begin
    if(!rst) begin
        rd_val_en <= 1'b0;
        rd_val_data <= 16'd0;
        ram_wr_addr <= 19'd0;
    end
    else begin
        if(rx_en_t) begin
            rd_val_en <= 1'b1;
            rd_val_data <= rx_data_t;
            if(ram_wr_addr < MAX_ADDR - 1) begin
                ram_wr_addr <= ram_wr_addr +19'd1;
            end
            else begin
                ram_wr_addr <= 19'd0;
            end
        end    
        else
            rd_val_en <= 1'b0;
    end
end      

endmodule