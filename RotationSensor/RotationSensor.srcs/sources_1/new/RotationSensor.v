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
// Description: 旋转编码器
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RotaryEncoder (
    input clk,            // 时钟信号
    input rst_n,          // 复位信号
    input SIA,            // 旋转编码器SIA引脚
    input SIB,            // 旋转编码器SIB引脚
    input SW,             // 旋转编码器SW引脚
    output reg CW,        // 顺时针旋转检测输出
    output reg CCW,       // 逆时针旋转检测输出
    output reg Pressed    // 按压动作检测输出
);

parameter HOLD_TIME = 1000000;  // 保持信号的时间
//10ms计数器，用于消抖。
reg ok_10ms;
reg [31:0]cnt0;
always@(posedge clk,negedge rst_n)
begin
    if(!rst_n)begin
        cnt0 <= 0;
        ok_10ms <= 1'b0;
    end
    else begin
        if(cnt0 < 32'd49_9999)begin//10ms消抖 //我的编码器 此值设置为4999可用！！！！！！！！！！！！！
            cnt0 <= cnt0 + 1'b1;
            ok_10ms <= 1'b0;
        end
        else begin
            cnt0 <= 0;
            ok_10ms <= 1'b1;
        end
    end
end


//同步/消抖 A、B
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


//对消抖后的A进行上升沿，下降沿检测。
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


//对AB相编码器的行为进行描述
reg rotary_right;
reg rotary_left;
always@(posedge clk,negedge rst_n)begin
    if(!rst_n)begin
        rotary_right <= 1'b1;
        rotary_left <= 1'b1;
    end
    else begin
        //A的上升沿时候如果B为低电平，则旋转编码器向右转
        if(A_posedge && !B_Debounce)begin
            rotary_right <= 1'b1;
        end
        //A上升沿时候如果B为高电平，则旋转编码器向左转
        else if(A_posedge && B_Debounce)begin
            rotary_left <= 1'b1;
        end
        //A的下降沿B为高电平，则一次右转结束
        else if(A_negedge && B_Debounce)begin
            rotary_right <= 1'b0;
        end
        //A的下降沿B为低电平，则一次左转结束
        else if(A_negedge && !B_Debounce)begin
            rotary_left <= 1'b0;
        end
    end
end


//通过上面的描述，可以发现，
//"rotary_right"为上升沿的时候标志着一次右转
//"rotary_left" 为上升沿的时候标志着一次左转
//以下代码是对其进行上升沿检测
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

// 保持信号
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

// 设置输出
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
    input clk,            // 时钟信号
    input rst_n,          // 复位信号
    input  [2:0] SIABW,          // 旋转编码器SIA、SIB、SW引脚
    output [2:0] operation      // 顺时针、逆时针、按压检测
);
//旋转编码器实例化
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
