`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 18:34:50
// Design Name: 
// Module Name: vga_test
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


module vga_test(
    input           clk_100MHz,         // ��׼ʱ��
    input           rst_n,              // ��λ�źţ��ߵ�ƽ��Ч��������ԣ�
    output          vga_hs,             // ��ͬ���ź�
    output          vga_vs,             // ��ͬ���ź�
    output  [11:0]  vga_rgb            // ���������
    );
wire VS_negedge;
// ǰ���ٶ�
reg chara = 0;
reg [3:0] speed = 0;
reg [9:0] obstacle = 512;
reg [7:0] obstimes = 100;
wire clk_1Hz;
divider_100M d100M(clk_100MHz, !rst_n, clk_1Hz);
always @(posedge clk_1Hz) begin
    speed <= speed + 1;
    if (speed == 0)
        chara <= ~chara;
    obstacle <= 512;
    obstimes <= 100;
    //if (obstimes == 0)obstimes <= 50;
    //else obstimes <= obstimes + 1;
end
//VGA����ģ��
vga_top vga_inst(
    .clk_100MHz(clk_100MHz),     // ��׼ʱ��
    .rst_n(!rst_n),              // ��λ�źţ��ߵ�ƽ��Ч��������ԣ�
    
    .chara(chara),          // ��ɫ״̬
    .speed(speed),          // �н��ٶ�
    .obstacle(obstacle),       // �ϰ���λ��
    .obstimes(obstimes),       // �ϰ����С
    
    .vga_hs(vga_hs),             // ��ͬ���ź�
    .vga_vs(vga_vs),             // ��ͬ���ź�
    .vga_rgb(vga_rgb),           // ���������
    .VS_negedge(VS_negedge)      // �½����ź�
    );
endmodule
