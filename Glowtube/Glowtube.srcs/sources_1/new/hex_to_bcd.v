`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/23 14:10:04
// Design Name: 
// Module Name: hex_to_bcd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ��27bit��16������ת��Ϊ32bit��bcd��
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module hex_to_bcd(
    input [26:0] hex,  // 27-bit ʮ��������
    output reg [31:0] bcd // 32-bit BCD �루8λ��ÿλ 4-bit��
);

integer i, j;

always @(hex) begin
    // ��ʼ�� BCD Ϊ 0
    bcd = 0;

    // ��ÿһ������λ���д���
    for (i = 26; i >= 0; i = i - 1) begin
        // ���ÿ�� BCD �����Ƿ���� 4
        for (j = 0; j < 8; j = j + 1) begin
            if (bcd[4*j +: 4] > 4)
                bcd[4*j +: 4] = bcd[4*j +: 4] + 3;
        end

        // ���� BCD ��
        bcd = bcd << 1;

        // ��ʮ�����Ƶ����λ��ӵ� BCD �����λ
        bcd[0] = hex[i];
    end
end

endmodule
