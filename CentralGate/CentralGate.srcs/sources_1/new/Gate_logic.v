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
    output game_win,             // 游戏成功（1：成功，0：失败）
    
    output [14:0] phi,//用于测试
    output [23:0] off //用于测试
    );
parameter _MAX_OFFSET = 1000_0000; // 最大世界线偏移角
//游戏参数（频率为60Hz）
parameter _START_P = 600;    // 初始时间点
parameter _BETA = 4096;      // beta世界线角（基准值4096）
parameter _DEL_PHI = 100;      // phi角度增量（基准值4096）
parameter _BAS_PHI = 4096;   // 角度基准值
parameter _MAX_PHI = 16000;  // 最大phi
parameter _MIN_PHI = -16000; // 最小phi

parameter _BAS_SPEED = 64;   // 速度单位量
parameter _BAS_TIME = 64;    // 时间流逝基准值
parameter _SPEED_LEVEL = 16; // 速度有16个等级
parameter _CHARA_XPOS = 218; // 角色水平位置
//状态标记量
reg over_flag;      // 游戏结束标记
reg win_flag;       // 游戏胜利标记
//游戏变量
reg [1:0] Charac;     // 角色
reg [22:0] Time;      // 时间t（最大值131072 * 64）
reg signed [15:0] Phi;       // 角色偏移角phi（基准值4096，取值-16382~16381）,左
reg signed [23:0] Offset;    // 角色偏移量s（最大值±131072 * 64）,左
reg [22:0] Distance;  // 世界偏移量d（最大值131072 * 64）
reg [9:0] Speed;      // 角色行进速度v（基准级：64）
reg [12:0] Obstacle;  // 障碍物位置

// 单次运算
always @(posedge clk or posedge next_s or negedge rst_n) begin
if (ena) begin
    if (!rst_n) begin // 初始化
        Charac <= 2'b00;
        Time <= _START_P * _BAS_TIME;
        Phi <= 0;
        Offset <= 0;//_START_P * _BAS_TIME;
        Distance <= _BETA * _START_P * _BAS_TIME / _BAS_PHI;
        Speed <= _BAS_SPEED;
        Obstacle <= 0;
        win_flag <= 0;
        over_flag <= 0;
    end // end of rst_n
    else
    if (next_s) begin // 计算操作
        // 处理操作
        casex(operation)
            3'bxx1: Charac[1] <= 1;// ~Charac[1]; // 改变角色状态
            3'b1x0: if (Charac[1] && Phi < _MAX_PHI) begin      // 左转检查
                        Phi <= Phi + _DEL_PHI * (speed + 1); // 左转为正
                    end
            3'b010: if (Charac[1] && $signed(Phi) > $signed(_MIN_PHI)) begin     // 右转检查
                        Phi <= Phi - _DEL_PHI * (speed + 1); // 右转为负
                    end
        endcase
        
        // 当角色为正常态时，世界线回归
        if (!Charac[1]) begin
            if (Phi > Offset / Time * _BAS_PHI)
                Phi <= Phi - 2 * _DEL_PHI * (speed + 1);
            else
                Phi <= Phi + 2 * _DEL_PHI * (speed + 1);
        end
        
        // 更新数据
        Time <= Time + Speed * _BAS_TIME / _BAS_SPEED; // 更新时间
        Distance <= _BETA * Time / _BAS_TIME; // 更新世界线距离
        if (Phi[15]) begin // 带符号运算
            Offset <= Offset - ($signed(~Phi) * Speed * _BAS_TIME) / (_BAS_PHI * _BAS_SPEED);// 更新角色偏移值
        end else begin
            Offset <= Offset + (Phi * Speed * _BAS_TIME) / (_BAS_PHI * _BAS_SPEED);// 更新角色偏移值
        end
        Speed <= _BAS_SPEED * (_SPEED_LEVEL / 4) * (Phi[15] ? $signed(~Phi) : Phi) / _BAS_PHI + _BAS_SPEED;// 更新当前速率
        Obstacle <= 0;
        
        // 判断游戏flag
        if ((Offset[23] ? $signed(~Offset) : Offset) >= Distance) begin win_flag = 1'b1; over_flag = 1'b1; end
        if (Obstacle[0] && Obstacle[12:1] <= _CHARA_XPOS) begin over_flag = 1'b1; end
        
    end // end of next_s
end // end of ena
end // end of always

//输出赋值
assign character = Charac;                      // 角色信息
assign offset = (Offset[23] ? $signed(~Offset >> 10) : (Offset >> 10)) * _MAX_OFFSET / (Distance >> 10);     // 世界线偏移量0-99999999
assign speed = Speed / _BAS_SPEED - 1;          // 速度：16梯度0-15
assign obstacle = Obstacle;                     // 障碍物位置
assign game_over = over_flag;           // 游戏结束，高电平有效
assign game_win = win_flag;             // 游戏成功，高电平有效

//测试
assign phi = Phi;
assign off = Offset;

endmodule
