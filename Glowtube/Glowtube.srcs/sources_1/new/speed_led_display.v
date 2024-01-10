`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/24 11:24:02
// Design Name: 
// Module Name: speed_led_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ��led����ʾ�ٶ�
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module speed_led_display(
    input clk,       //ʱ���ź�
    input ena,       //ʹ���ź�
    input flicker,     //��˸Ч��
    input [3:0] speed,      //�ٶ�
    output reg [15:0] led  //led��ʾ��
    );

// ʱ�ӷ�Ƶ
wire clk_5Hz;
divider_5M divider_uut(clk, ena, clk_5Hz);
//��˸Ч��
reg [3:0] lednum = 4'b1111;
always @(posedge clk_5Hz or negedge ena) begin
    if (!ena || !flicker)
        lednum = 4'b1111;
    else if (lednum == 4'b0000)
        lednum = 4'b1111;
    else
        lednum = lednum - 1;
end
// ��led��ʾ��ǰ�ٶ�or��˸
genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin : GEN_REGS
        always @(posedge clk_5Hz) begin
            if (!ena) begin
                led[i] <= 1'b0;
            end else begin
                if (!flicker) begin
                    if (i >= 15 - speed)  led[i] <= 1'b1;
                    else                  led[i] <= 1'b0;
                end else begin
                    if (i == lednum)      led[i] <= 1'b1;
                    else                  led[i] <= 1'b0;
                end
            end
        end
    end
endgenerate

endmodule
