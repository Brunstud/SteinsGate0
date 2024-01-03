`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 22:23:43
// Design Name: 
// Module Name: sd_init
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


module sd_init(
    input          clk_ref       ,  // �ο�ʱ��
    input          rst           ,  // ��λ�ź�,�͵�ƽ��Ч
    
    input          sd_miso       ,  // SD��SPI�������������ź�
    output         sd_clk        ,  // SD��SPIʱ���ź�
    output  reg    sd_cs         ,  // SD��SPIƬѡ�ź�
    output  reg    sd_mosi       ,  // SD��SPI������������ź�
    
    output  reg    sd_init_done     // SD����ʼ������ź�
    );

/**************************************************************   
��������
*************************************************************/    
// SD�������
parameter  CMD0  = {8'h40,8'h00,8'h00,8'h00,8'h00,8'h95};
parameter  CMD8  = {8'h48,8'h00,8'h00,8'h01,8'haa,8'h87};
parameter  CMD55 = {8'h77,8'h00,8'h00,8'h00,8'h00,8'hff};
parameter  ACMD41 = {8'h69,8'h40,8'h00,8'h00,8'h00,8'hff};

// ״̬����
parameter  sta_idle        = 7'b000_0001;  // �ϵ�ȴ�SD���ȶ�
parameter  sta_send_cmd0   = 7'b000_0010;  // ������λ����
parameter  sta_wait_cmd0   = 7'b000_0100;  // �ȴ�SD����Ӧ
parameter  sta_send_cmd8   = 7'b000_1000;  // ���SD���Ƿ������ѹ��Χ
parameter  sta_send_cmd55  = 7'b001_0000;  // ����SD����������������Ӧ���������
parameter  sta_send_acmd41 = 7'b010_0000;  // ���Ͳ����Ĵ���(OCR)����
parameter  sta_init_done   = 7'b100_0000;  // SD����ʼ�����

// ʱ�ӷ�Ƶϵ��,��ʼ��SD��ʱ��Ҫ����SD����ʱ��Ƶ��,50M/250K = 200 
parameter  DIV_NUM = 200;

// �ϵ����ٵȴ�74��ͬ��ʱ������,�ڵȴ��ϵ��ȶ��ڼ�,sd_cs = 1,sd_mosi = 1
parameter  POWER_ON_NUM = 5000;

// ���������λ����ʱ�ȴ�SD�����ص����ʱ��,T = 100ms; 100_000us/4us = 25000
parameter  OVER_TIME = 25000;

/**************************************************************   
�Ĵ�������
*************************************************************/    
reg    [7:0]   cur_sta      ;    // ��̬
reg    [7:0]   nex_sta      ;    // ��̬
                              
reg    [7:0]   div_cnt        ;    // ��Ƶ������
reg            clk_250khz     ;    // ��Ƶ���250khzʱ��         
reg    [12:0]  poweron_cnt    ;    // �ȴ��ȶ�������
reg            res_en         ;    // ����SD������������Ч�ź�
reg    [47:0]  res_data       ;    // ����SD����������
reg            res_flag       ;    // ��ʼ���շ������ݵı�־
reg    [5:0]   res_bit_cnt    ;    // ����λ���ݼ�����
                                   
reg    [5:0]   cmd_bit_cnt    ;    // ����ָ��λ������
reg    [15:0]  over_time_cnt  ;    // ��ʱ������
reg            over_time_en   ;    // ��ʱʹ���ź�

/**************************************************************   
ʱ�ӷ�Ƶ
*************************************************************/ 
assign  sd_clk = ~clk_250khz;         // ���sd_clk
always @(posedge clk_ref or negedge rst) begin
    if(!rst) begin
        clk_250khz <= 1'b0;
        div_cnt <= 8'd0;
    end
    else begin
        if(div_cnt == DIV_NUM/2 - 1'b1) begin
            clk_250khz <= ~clk_250khz;
            div_cnt <= 8'd0;
        end
        else    
            div_cnt <= div_cnt + 1'b1;
    end        
end   

/**************************************************************   
�ȴ�SD���ȶ�
*************************************************************/ 
always @(posedge clk_250khz or negedge rst) begin
    if(!rst) 
        poweron_cnt <= 13'd0;
    else if(cur_sta == sta_idle) begin
        if(poweron_cnt < POWER_ON_NUM)
            poweron_cnt <= poweron_cnt + 1'b1;
    end
    else
        poweron_cnt <= 13'd0;    
end

/**************************************************************   
����SD�����ص�����
*************************************************************/ 
always @(negedge clk_250khz or negedge rst) begin
    if(!rst) begin
        res_en <= 1'b0;
        res_data <= 48'd0;
        res_flag <= 1'b0;
        res_bit_cnt <= 6'd0;
    end    
    else begin
        // ��ʼ������Ӧ����
        if(sd_miso == 1'b0 && res_flag == 1'b0) begin 
            res_flag <= 1'b1;
            res_data <= {res_data[46:0],sd_miso};
            res_bit_cnt <= res_bit_cnt + 6'd1;
            res_en <= 1'b0;
        end
        else if(res_flag) begin
            // ����6���ֽ�,�����1���ֽ�Ϊ8��ʱ�����ڵ���ʱ
            res_data <= {res_data[46:0],sd_miso};     
            res_bit_cnt <= res_bit_cnt + 6'd1;
            if(res_bit_cnt == 6'd47) begin
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
����ʽ״̬��
*************************************************************/ 
always @(posedge clk_250khz or negedge rst) begin
    if(!rst)
        cur_sta <= sta_idle;
    else
        cur_sta <= nex_sta;
end

always @(*) begin
    nex_sta = sta_idle;
    case(cur_sta)
        // �ϵ�ȴ�SD���ȶ�
        sta_idle : begin
            // �ϵ����ٵȴ�74��ͬ��ʱ������
            if(poweron_cnt == POWER_ON_NUM)          
                nex_sta = sta_send_cmd0;
            else
                nex_sta = sta_idle;
        end
        // ������λ���� 
        sta_send_cmd0 : begin                         
            if(cmd_bit_cnt == 6'd47)
                nex_sta = sta_wait_cmd0;
            else
                nex_sta = sta_send_cmd0;    
        end
        // �ȴ�SD����Ӧ               
        sta_wait_cmd0 : begin                         
            if(res_en) begin                         // SD��������Ӧ�ź�
                if(res_data[47:40] == 8'h01)         // SD�����ظ�λ�ɹ�
                    nex_sta = sta_send_cmd8;
                else
                    nex_sta = sta_idle;
            end
            else if(over_time_en)                    // SD����Ӧ��ʱ
                nex_sta = sta_idle;
            else
                nex_sta = sta_wait_cmd0;                                    
        end    
        // ���SD���Ƿ������ѹ��Χ
        sta_send_cmd8 : begin 
            if(res_en) begin                         // SD��������Ӧ�ź�  
                // ����SD���Ĳ�����ѹ,[19:16] = 4'b0001(2.7V~3.6V)
                if(res_data[19:16] == 4'b0001)       
                    nex_sta = sta_send_cmd55;
                else
                    nex_sta = sta_idle;
            end
            else
                nex_sta = sta_send_cmd8;            
        end
        // ����SD����������������Ӧ���������
        sta_send_cmd55 : begin     
            if(res_en) begin                         // SD��������Ӧ�ź�  
                if(res_data[47:40] == 8'h01)         // SD�����ؿ���״̬
                    nex_sta = sta_send_acmd41;
                else
                    nex_sta = sta_send_cmd55;    
            end        
            else
                nex_sta = sta_send_cmd55;     
        end
        // ���Ͳ����Ĵ���(OCR)����  
        sta_send_acmd41 : begin                       
            if(res_en) begin                         // SD��������Ӧ�ź�  
                if(res_data[47:40] == 8'h00)         // ��ʼ������ź�
                    nex_sta = sta_init_done;
                else
                    nex_sta = sta_send_cmd55;      // ��ʼ��δ���,���·��� 
            end
            else
                nex_sta = sta_send_acmd41;     
        end
        // ��ʼ�����              
        sta_init_done : nex_sta = sta_init_done;    

        default : nex_sta = sta_idle;
    endcase
end

always @(posedge clk_250khz or negedge rst) begin
    if(!rst) begin
        sd_cs <= 1'b1;
        sd_mosi <= 1'b1;
        sd_init_done <= 1'b0;
        cmd_bit_cnt <= 6'd0;
        over_time_cnt <= 16'd0;
        over_time_en <= 1'b0;
    end
    else begin
        over_time_en <= 1'b0;
        case(cur_sta)
            // �ϵ�ȴ�SD���ȶ�
            sta_idle : begin                               
                sd_cs <= 1'b1;                            // �ڵȴ��ϵ��ȶ��ڼ�,sd_cs=1
                sd_mosi <= 1'b1;                          // sd_mosi=1
            end
            // ����CMD0�����λ����     
            sta_send_cmd0 : begin                          
                cmd_bit_cnt <= cmd_bit_cnt + 6'd1;        
                sd_cs <= 1'b0;                            
                sd_mosi <= CMD0[6'd47 - cmd_bit_cnt];     // �ȷ���CMD0�����λ
                if(cmd_bit_cnt == 6'd47)                  
                    cmd_bit_cnt <= 6'd0;                  
            end      
            //�ڽ���CMD0��Ӧ�����ڼ�,ƬѡCS����,����SPIģʽ                                     
            sta_wait_cmd0 : begin                          
                sd_mosi <= 1'b1;
                // SD��������Ӧ�ź�             
                if(res_en)                                
                    sd_cs <= 1'b1;                          // �������֮��������,����SPIģʽ                                              
                over_time_cnt <= over_time_cnt + 1'b1;    // ��ʱ��������ʼ����
                // SD����Ӧ��ʱ,���·��������λ����
                if(over_time_cnt == OVER_TIME - 1'b1)
                    over_time_en <= 1'b1; 
                if(over_time_en)
                    over_time_cnt <= 16'd0;                                        
            end
            sta_send_cmd8 : begin                          // ����CMD8
                if(cmd_bit_cnt<=6'd47) begin
                    cmd_bit_cnt <= cmd_bit_cnt + 6'd1;
                    sd_cs <= 1'b0;
                    sd_mosi <= CMD8[6'd47 - cmd_bit_cnt]; // �ȷ���CMD8�����λ       
                end
                else begin
                    sd_mosi <= 1'b1;
                    // SD��������Ӧ�ź�
                    if(res_en) begin                      
                        sd_cs <= 1'b1;
                        cmd_bit_cnt <= 6'd0; 
                    end
                end                                                                   
            end 
            sta_send_cmd55 : begin                         // ����CMD55
                if(cmd_bit_cnt<=6'd47) begin
                    cmd_bit_cnt <= cmd_bit_cnt + 6'd1;
                    sd_cs <= 1'b0;
                    sd_mosi <= CMD55[6'd47 - cmd_bit_cnt];       
                end
                else begin
                    sd_mosi <= 1'b1;
                    if(res_en) begin                      // SD��������Ӧ�ź�
                        sd_cs <= 1'b1;
                        cmd_bit_cnt <= 6'd0;     
                    end        
                end                                                                                    
            end
            sta_send_acmd41 : begin                        // ����ACMD41
                if(cmd_bit_cnt <= 6'd47) begin
                    cmd_bit_cnt <= cmd_bit_cnt + 6'd1;
                    sd_cs <= 1'b0;
                    sd_mosi <= ACMD41[6'd47 - cmd_bit_cnt];      
                end
                else begin
                    sd_mosi <= 1'b1;
                    if(res_en) begin                       // SD��������Ӧ�ź�
                        sd_cs <= 1'b1;
                        cmd_bit_cnt <= 6'd0;  
                    end        
                end     
            end
            sta_init_done : begin                          // ��ʼ�����
                sd_init_done <= 1'b1;
                sd_cs <= 1'b1;
                sd_mosi <= 1'b1;
            end
            default : begin
                sd_cs <= 1'b1;
                sd_mosi <= 1'b1;                
            end    
        endcase
    end
end

endmodule
