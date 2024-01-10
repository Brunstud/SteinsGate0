`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/07 16:25:49
// Design Name: 
// Module Name: RotationSensor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ��ת������
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RotaryEncoder (
    input clk,            // ʱ���ź�
    input rst_n,          // ��λ�ź�
    input SIA,            // ��ת������SIA����
    input SIB,            // ��ת������SIB����
    input SW,             // ��ת������SW����
    output reg CW,        // ˳ʱ����ת������
    output reg CCW,       // ��ʱ����ת������
    output reg Pressed    // ��ѹ����������
);

parameter HOLD_TIME = 1000000;  // �����źŵ�ʱ��
//10ms������������������
reg ok_10ms;
reg [31:0]cnt0;
always@(posedge clk,negedge rst_n)
begin
    if(!rst_n)begin
        cnt0 <= 0;
        ok_10ms <= 1'b0;
    end
    else begin
        if(cnt0 < 32'd49_9999)begin//10ms���� //�ҵı����� ��ֵ����Ϊ4999���ã�������������������������
            cnt0 <= cnt0 + 1'b1;
            ok_10ms <= 1'b0;
        end
        else begin
            cnt0 <= 0;
            ok_10ms <= 1'b1;
        end
    end
end


//ͬ��/���� A��B
reg A_reg,A_reg0;
reg B_reg,B_reg0;
wire A_Debounce;
wire B_Debounce;
always@(posedge clk,negedge rst_n)begin
    if(!rst_n)begin
        A_reg <= 1'b1;
        A_reg0 <= 1'b1;
        B_reg <= 1'b1;
        B_reg0 <= 1'b1;
    end
    else begin
        if(ok_10ms)begin
            A_reg <= SIA;
            A_reg0 <= A_reg;
            B_reg <= SIB;
            B_reg0 <= B_reg;
        end
    end
end

assign A_Debounce = A_reg0 && A_reg && SIA;
assign B_Debounce = B_reg0 && B_reg && SIB;


//���������A���������أ��½��ؼ�⡣
reg A_Debounce_reg;
wire A_posedge,A_negedge;
always@(posedge clk,negedge rst_n)begin
    if(!rst_n)begin
        A_Debounce_reg <= 1'b1;
    end
    else begin
        A_Debounce_reg <= A_Debounce;
    end
end
assign A_posedge = !A_Debounce_reg && A_Debounce;
assign A_negedge = A_Debounce_reg && !A_Debounce;


//��AB�����������Ϊ��������
reg rotary_right;
reg rotary_left;
always@(posedge clk,negedge rst_n)begin
    if(!rst_n)begin
        rotary_right <= 1'b1;
        rotary_left <= 1'b1;
    end
    else begin
        //A��������ʱ�����BΪ�͵�ƽ������ת����������ת
        if(A_posedge && !B_Debounce)begin
            rotary_right <= 1'b1;
        end
        //A������ʱ�����BΪ�ߵ�ƽ������ת����������ת
        else if(A_posedge && B_Debounce)begin
            rotary_left <= 1'b1;
        end
        //A���½���BΪ�ߵ�ƽ����һ����ת����
        else if(A_negedge && B_Debounce)begin
            rotary_right <= 1'b0;
        end
        //A���½���BΪ�͵�ƽ����һ����ת����
        else if(A_negedge && !B_Debounce)begin
            rotary_left <= 1'b0;
        end
    end
end


//ͨ����������������Է��֣�
//"rotary_right"Ϊ�����ص�ʱ���־��һ����ת
//"rotary_left" Ϊ�����ص�ʱ���־��һ����ת
//���´����Ƕ�����������ؼ��
reg rotary_right_reg,rotary_left_reg;
wire rotary_right_pos,rotary_left_pos;
always@(posedge clk,negedge rst_n)begin
    if(!rst_n)begin
        rotary_right_reg <= 1'b1;
        rotary_left_reg <= 1'b1;
    end
    else begin
        rotary_right_reg <= rotary_right;
        rotary_left_reg <= rotary_left;
    end
end

assign rotary_right_pos = !rotary_right_reg && rotary_right;
assign rotary_left_pos = !rotary_left_reg && rotary_left;

// �����ź�
reg [23:0] cw_timer = 0, ccw_timer = 0;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cw_timer <= 0;
        ccw_timer <= 0;
    end else begin
        if (cw_timer > 0) cw_timer <= cw_timer - 1;
        else if (rotary_right_pos) cw_timer <= HOLD_TIME;

        if (ccw_timer > 0) ccw_timer <= ccw_timer - 1;
        else if (rotary_left_pos) ccw_timer <= HOLD_TIME;
    end
end

// �������
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        CW <= 1'b0;
        CCW <= 1'b0;
        Pressed <= 1'b0;
    end else begin
        CW <= cw_timer != 0;
        CCW <= ccw_timer != 0;
        Pressed <= !SW;
    end
end

endmodule

module RotationSensor (
    input clk,            // ʱ���ź�
    input rst_n,          // ��λ�ź�
    input  [2:0] SIABW,          // ��ת������SIA��SIB��SW����
    output [2:0] operation      // ˳ʱ�롢��ʱ�롢��ѹ���
);
//��ת������ʵ����
RotaryEncoder re_uut(
    .clk(clk),
    .rst_n(rst_n),
    .SIA(SIABW[2]),
    .SIB(SIABW[1]),
    .SW(SIABW[0]),
    .CW(operation[2]),
    .CCW(operation[1]),
    .Pressed(operation[0])
);
endmodule
