`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 09:40:04
// Design Name: 
// Module Name: Gate_logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 游戏处理中心逻辑
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gate_logic(
    input ena,                  // 使能型号（每次开始注意先初始化）
    input clk,                  // 系统时钟
    input rst_n,                // 置零，低电平有效
    input next_s,               // 开始运算记号，高电平激发（频率为60Hz）
    input [2:0] operation,      // 操作信号：左转、右转、按钮，高电平有效
    
    output [1:0] character,     // 角色信息：角色状态，角色选择
    output [26:0] offset,       // 世界线偏移量0-999999
    output [3:0] speed,         // 速度：16梯度
    output [12:0] obstacle,     // 障碍物位置：0位存是否有障碍物
    
    output game_over,           // 游戏结束，高电平有效
    output game_win             // 游戏成功（1：成功，0：失败）
    );
//游戏参数（频率为60Hz）
parameter _START_P = 600;    // 初始时间点
parameter _BETA = 4096;      // beta世界线角（基准值4096）
parameter _DEL_PHI = 1;      // phi角度增量（基准值4096）
parameter _BAS_PHI = 4096;   // 角度基准值
parameter _BAS_SPEED = 64;   // 速度单位量
parameter _BAS_TIME = 64;    // 时间流逝基准值
parameter _CHARA_XPOS = 218; // 角色水平位置
//状态标记量
reg dirc_beta;      // beta世界偏移方向，左为0，右为1
reg dirc_phi;       // phi行进方向标记，左为0，右为1
reg over_flag;      // 游戏结束标记
reg win_flag;       // 游戏胜利标记
//游戏变量
reg [1:0] Charac;     // 角色
reg [22:0] Time;      // 时间t（最大值131072 * 64）
reg signed [14:0] Phi;       // 角色偏移角phi（基准值4096，取值-16382~16381）,左
reg signed [23:0] Offset;    // 角色偏移量s（最大值±131072 * 64）
reg [22:0] Distance;  // 世界偏移量d（最大值131072 * 64）
reg [9:0] Speed;      // 角色行进速度v（基准级：64）
reg [12:0] Obstacle;  // 障碍物位置
//运算计数器

//单次运算
always @(posedge clk) begin
if (ena) begin
    if (!rst_n) begin // 初始化
        Charac <= 2'b00;
        Time <= _START_P;
        Phi <= 0;
        Offset <= 0;
        Distance <= _BETA * _START_P;
        Speed <= _BAS_SPEED;
        Obstacle <= 0;
        dirc_beta <= 0;
        dirc_phi <= 0;
        win_flag <= 0;
        over_flag <= 0;
    end // end of rst_n
    else
    if (next_s) begin // 计算操作
        // 处理操作
        casex(operation)
            3'bxx1: Charac[1] <= !Charac[1]; // 改变角色状态
            3'bx10: if (Charac[1]) begin     // 右转检查
                        if (0 == Phi) begin
                            dirc_phi = 1'b1;     // 向右偏转
                            Phi <= _DEL_PHI; // 初始化偏移角
                        end else if (dirc_phi) begin
                            Phi <= Phi + _DEL_PHI; // 远离中心世界线
                        end else begin
                            if (Phi > _DEL_PHI) Phi <= Phi - _DEL_PHI; // 向中心世界线偏移
                            else begin dirc_phi = !dirc_phi; Phi <= _DEL_PHI - Phi; end // 转到另一边
                        end
                    end
            3'b100: if (Charac[1]) begin      // 左转检查
                        if (0 == Phi) begin
                             dirc_phi = 1'b0;     // 向左偏转 
                             Phi <= _DEL_PHI; // 初始化偏移角
                        end else if (!dirc_phi) begin
                             Phi <= Phi + _DEL_PHI; // 远离中心世界线
                        end else begin
                             if (Phi > _DEL_PHI) Phi <= Phi - _DEL_PHI; // 向中心世界线偏移
                             else begin dirc_phi = !dirc_phi; Phi <= _DEL_PHI - Phi; end // 转到另一边
                        end
                    end
        endcase
        
        // 更新数据
        Time <= Time + Speed * _BAS_TIME / _BAS_SPEED; // 更新时间
        // 更新角色偏移值
        if (0 == Offset) begin 
            dirc_beta <= dirc_phi;
            Offset <= Phi * _BAS_TIME / _BAS_PHI;
        end else if (dirc_beta == dirc_phi) //行进方向相同
            Offset <= Offset + Phi * _BAS_TIME / _BAS_PHI;
        else if (Offset > Phi * _BAS_TIME / _BAS_PHI) //行进方向相反
            Offset <= Offset - Phi * _BAS_TIME / _BAS_PHI;
        Distance <= _BETA * _START_P;
        Speed <= _BAS_SPEED;
        Obstacle <= 0;
        
        // 判断游戏flag
        if (Offset >= Distance) begin win_flag = 1'b1; over_flag = 1'b1; end
        if (Obstacle[0] && Obstacle[12:1] <= _CHARA_XPOS) over_flag = 1'b1;
    end // end of next_s
end // end of ena
end // end of always
//输出赋值
assign character = Charac;                      // 角色信息
assign offset = Offset * 100000 / Distance;     // 世界线偏移量0-999999
assign speed = Speed / _BAS_SPEED;              // 速度：16梯度
assign obstacle = Obstacle;                     // 障碍物位置
assign game_over = over_flag;           // 游戏结束，高电平有效
assign game_win = win_flag;             // 游戏成功，高电平有效

endmodule
