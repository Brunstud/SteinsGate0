`timescale 1ns / 1ps
module VGA_driver (
    input wire clk,       // 输入时钟信号
    input wire rst_n,     // 复位信号（低有效）
    output reg hsync,     // 水平同步信号
    output reg vsync,     // 垂直同步信号
    output reg [3:0] red, // 红色分量
    output reg [3:0] green, // 绿色分量
    output reg [3:0] blue   // 蓝色分量
);

    // VGA 参数
    parameter H_DISPLAY = 1024; // 水平分辨率
    parameter H_SYNC_CYC = 96; // 水平同步脉冲周期
    parameter H_FRONT_PORCH = 48; // 水平前廊周期
    parameter H_BACK_PORCH = 16; // 水平后廊周期

    parameter V_DISPLAY = 768; // 垂直分辨率
    parameter V_SYNC_CYC = 2; // 垂直同步脉冲周期
    parameter V_FRONT_PORCH = 11; // 垂直前廊周期
    parameter V_BACK_PORCH = 31; // 垂直后廊周期

    reg [10:0] h_count = 0; // 水平计数器
    reg [10:0] v_count = 0; // 垂直计数器

    always @(posedge clk) begin
        // 水平计数器递增
        if (h_count == H_DISPLAY + H_SYNC_CYC + H_FRONT_PORCH + H_BACK_PORCH - 1)
            h_count <= 0;
        else
            h_count <= h_count + 1;

        // 垂直计数器递增
        if (v_count == V_DISPLAY + V_SYNC_CYC + V_FRONT_PORCH + V_BACK_PORCH - 1) begin
            v_count <= 0;
            h_count <= 0; // 重置水平计数器
        end
        else if (h_count == H_DISPLAY + H_SYNC_CYC + H_FRONT_PORCH + H_BACK_PORCH - 1)
            v_count <= v_count + 1;
    end
    
    //复位信号
    always @(negedge rst_n) begin
            if (~rst_n) begin
                // 在复位时重置计数器和同步信号
                h_count <= 0;
                v_count <= 0;
                hsync <= 1;
                vsync <= 1;
                red <= 0;
                green <= 0;
                blue <= 0;
            end
        end

    // 生成水平同步和垂直同步信号
    always @* begin
        if (h_count >= H_DISPLAY + H_SYNC_CYC + H_FRONT_PORCH && h_count < H_DISPLAY + H_SYNC_CYC + H_FRONT_PORCH + H_BACK_PORCH)
            hsync = 0; // 水平后廊时段
        else
            hsync = 1;

        if (v_count >= V_DISPLAY + V_SYNC_CYC + V_FRONT_PORCH && v_count < V_DISPLAY + V_SYNC_CYC + V_FRONT_PORCH + V_BACK_PORCH)
            vsync = 0; // 垂直后廊时段
        else
            vsync = 1;
    end

    // 示例中RGB输出为固定值
    always @* begin
        if (hsync == 0 || vsync == 0) begin
            red = 4'b1111; // 举例：红色分量为最大值
            green = 4'b0000; // 举例：绿色分量为最小值
            blue = 4'b0000; // 举例：蓝色分量为最小值
        end
        else begin
            red = 4'b0000; // 举例：红色分量为最小值
            green = 4'b1111; // 举例：绿色分量为最大值
            blue = 4'b0000; // 举例：蓝色分量为最小值
        end
    end

endmodule