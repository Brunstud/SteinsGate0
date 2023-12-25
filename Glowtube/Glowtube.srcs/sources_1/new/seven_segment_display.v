`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/23 13:47:34
// Design Name: 
// Module Name: seven_segment_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: �߶ξ������ʾ
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module seven_segment_display (
    input clk,            // ʱ���ź�
    input reset,          // �����źţ��͵�ƽ��Ч
    input [1:0] choice,   // ѡ����ʾ����
    input [31:0] bcdnum,  // Ҫ��ʾ�� 8 λ���֣�ÿ������ 4 λ��
    output reg [7:0] anodes,   // �����źţ�AN0..AN7��
    output reg [7:0] segments  // ���źţ�A..G����С���� DP
);

// ��Ƶ�����������ڴ�����ʾˢ����
reg [15:0] refresh_counter;
always @(posedge clk or negedge reset) begin
    if (!reset)
        refresh_counter <= 0;
    else
        refresh_counter <= refresh_counter + 1;
end

// ��ǰ��Ծ����ʾλ
wire [2:0] active_digit = refresh_counter[15:13]; // ��������Ե���ˢ����

// �߶ν�����
function [7:0] decode;
    input [3:0] digit;
    input [2:0] digit_index;
    begin
        case (digit)
            4'h0: decode[7:1] = 7'b0000001; // 0
            4'h1: decode[7:1] = 7'b1001111; // 1
            4'h2: decode[7:1] = 7'b0010010; // 2
            4'h3: decode[7:1] = 7'b0000110; // 3
            4'h4: decode[7:1] = 7'b1001100; // 4
            4'h5: decode[7:1] = 7'b0100100; // 5
            4'h6: decode[7:1] = 7'b0100000; // 6
            4'h7: decode[7:1] = 7'b0001111; // 7
            4'h8: decode[7:1] = 7'b0000000; // 8
            4'h9: decode[7:1] = 7'b0000100; // 9
            default: decode = 7'b1111111; // �հ�
        endcase
        // ���λС������Զ����
        decode = {decode[7:1], digit_index != 3'b111};
    end
endfunction

// �߶ν�������STEN_GATE��
function [7:0] STEN_GATE;
    input [2:0] digit_index;
    begin
        case (digit_index)
            4'h7: STEN_GATE[7:1] = ~7'b1011011; // S
            4'h6: STEN_GATE[7:1] = ~7'b1110000; // T
            4'h5: STEN_GATE[7:1] = ~7'b1001111; // E
            4'h4: STEN_GATE[7:1] = ~7'b0110111; // N
            4'h3: STEN_GATE[7:1] = ~7'b1011111; // G
            4'h2: STEN_GATE[7:1] = ~7'b1110111; // A
            4'h1: STEN_GATE[7:1] = ~7'b1110000; // T
            4'h0: STEN_GATE[7:1] = ~7'b1001111; // E
            default: STEN_GATE = 7'b1111111; // �հ�
        endcase
        // �м��С������Զ����
        STEN_GATE = {STEN_GATE[7:1], digit_index != 3'b100};
    end
endfunction

// �߶ν�������GAME_OVER��
function [7:0] GAME_OVER;
    input [2:0] digit_index;
    begin
        case (digit_index)
            4'h7: GAME_OVER[7:1] = ~7'b1011111; // G
            4'h6: GAME_OVER[7:1] = ~7'b1110111; // A
            4'h5: GAME_OVER[7:1] = ~7'b1110111; // M
            4'h4: GAME_OVER[7:1] = ~7'b1001111; // E
            4'h3: GAME_OVER[7:1] = ~7'b1111110; // O
            4'h2: GAME_OVER[7:1] = ~7'b0111110; // V
            4'h1: GAME_OVER[7:1] = ~7'b1001111; // E
            4'h0: GAME_OVER[7:1] = ~7'b1110111; // R
            default: GAME_OVER = 7'b1111111; // �հ�
        endcase
        // �м��С������Զ����
        GAME_OVER = {GAME_OVER[7:1], digit_index != 3'b100};
    end
endfunction

// ������ʾ����
always @(posedge clk or negedge reset) begin
    if (!reset) begin
        anodes <= 8'b11111111;
        segments <= 8'b11111111;
    end else begin
        anodes <= ~(1'b1 << active_digit); // ѡ��ǰ��Ծ������
        casex(choice)
            2'bx0: segments <= decode(bcdnum[4*active_digit +: 4], active_digit); // ���뵱ǰ���ֲ�����С����
            2'b01: segments <= STEN_GATE(active_digit);
            2'b11: segments <= GAME_OVER(active_digit);
        endcase
    end
end

endmodule
