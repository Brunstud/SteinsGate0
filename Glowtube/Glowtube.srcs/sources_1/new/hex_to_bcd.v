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
// Description: 将27bit的16进制数转换为32bit的bcd码
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module hex_to_bcd(
    input [26:0] hex,  // 27-bit 十六进制数
    output reg [31:0] bcd // 32-bit BCD 码（8位，每位 4-bit）
);

integer i, j;

always @(hex) begin
    // 初始化 BCD 为 0
    bcd = 0;

    // 对每一个输入位进行处理
    for (i = 26; i >= 0; i = i - 1) begin
        // 检查每个 BCD 数字是否大于 4
        for (j = 0; j < 8; j = j + 1) begin
            if (bcd[4*j +: 4] > 4)
                bcd[4*j +: 4] = bcd[4*j +: 4] + 3;
        end

        // 左移 BCD 码
        bcd = bcd << 1;

        // 将十六进制的最高位添加到 BCD 的最低位
        bcd[0] = hex[i];
    end
end

endmodule
