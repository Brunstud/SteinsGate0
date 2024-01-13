`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/10 14:12:58
// Design Name: 
// Module Name: jump_logic
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


module meet_logic(
    input clk,                  // 系统时钟
    input rst_n,                // 置零，低电平有效
    input next_s,               // 开始运算记号，高电平激发（频率为60Hz）
    input [2:0] operation,      // 操作信号：左转、右转、按钮，高电平有效
    
    output [2:0] character,     // 当前角色信息及角色状态：另一个角色状态、当前角色状态、当前角色
    output [26:0] offset,       // 世界线偏移量0-999999
    output [3:0] speed,         // 速度：15梯度，0为静止
    output [9:0] obstacle,      // 另一个角色位置：0则表示无
    output [3:0] obstimes,      // 另一个角色清晰度（0最清晰）
    output [9:0] progress,      // 当前时间进度0-1024
    output [8:0] offgress,      // 当前偏移进度
    
    output game_over,           // 游戏结束，高电平有效
    output game_win             // 游戏成功（1：成功，0：失败）
    );
parameter _MAX_OFFSET = 3355_4432; // 最大世界线偏移量
parameter _BAS_OFFSET = 1000_0000; // 基础世界线偏移量
parameter _PER_OFFSET = 0000_0512; // 偏移基量
parameter _DIAMETER = 21600;       // 世界直径6min，15bit
//游戏参数（频率为60Hz）
parameter _START_P = 1000;    // 初始时间点16s
parameter _MEET_DIST = 300;   // 相遇时间
parameter _MEET_OFF = 0020_0000;    // 相遇世界线

parameter _BAS_SPEED = 64;   // 速度单位量
parameter _BAS_TIME = 64;    // 时间流逝基准值
parameter _SPEED_LEVEL = 16; // 速度有16个等级
parameter _BACK_TIMES = 3;   // 世界线收束速率（未使用）

parameter _SCREEN_WIDTH = 1024; // 屏幕宽度
parameter _SCREEN_TIME = 2048;  // 一屏代表的时间
parameter _SCREEN_OFFSET = 0050_0000;    // 相遇时间线差基值
parameter _CHARA_XPOS = 512; // 角色水平位置
parameter _CHARA_WIDTH = 200; // 角色水平宽度
//状态标记量
reg over_flag;      // 游戏结束标记
reg win_flag;       // 游戏胜利标记
//游戏变量
reg CurChara;              // 当前角色
reg Chstate[1:0];          // 角色状态
reg [21:0] Time[1:0];      // 时间t（最大值32768 * 64）
reg [26:0] Offset[1:0];    // 角色偏移量s
reg [9:0] Speed[1:0];      // 角色行进速度v（基准级：64）
reg [9:0] Obstacle;        // 另一个人的位置
reg [3:0] Obstimes;        // 另一个角色清晰度（0最清晰） 
// 反应计时器
parameter _HOLD_TIME = 20;//检测间隔0.3s
reg [6:0] counter;
// 初始化
initial begin
    CurChara <= 0;
    Chstate[0] <= 0;
    Chstate[1] <= 0;
    Time[0] <= _START_P * _BAS_TIME;
    Time[1] <= (_DIAMETER - _START_P) * _BAS_TIME;
    Offset[0] <= 0;
    Offset[1] <= _BAS_OFFSET;
    Speed[0] <= 0;//_BAS_SPEED;
    Speed[1] <= 0;//_BAS_SPEED;
    Obstacle <= 0;
    Obstimes <= 0;
    win_flag <= 0;
    over_flag <= 0;
    counter <= 0;
end

//更新另一个角色相对位置
wire [9:0] realObsta;
wire [3:0] realObstm;
anotherChara #(_BAS_TIME, _SCREEN_WIDTH, _SCREEN_TIME, _SCREEN_OFFSET, _CHARA_XPOS, _CHARA_WIDTH)
            anch_uut(Time[CurChara], Time[~CurChara], Offset[CurChara], Offset[~CurChara], realObsta, realObstm);
// 切换人物操作（独立判断）
always @(posedge next_s or negedge rst_n) begin
    if (!rst_n) begin // 初始化
        CurChara <= 0;
        counter <= 0;
        Obstacle <= 0;
        Obstimes <= 0;
    end // end of rst_n
    else begin
         if (next_s) begin
            // 更新另一角色的显示
            Obstacle <= realObsta;
            Obstimes <= realObstm;
            // 切换人物
            if (counter != 0) begin
                counter <= counter - 1;
            end else begin
                if (operation[0]) begin
                    CurChara <= !CurChara;
                    counter <= _HOLD_TIME;
                end // end of operation
            end // end of counter
         end // end of next_s
    end // end of rst_n
end // end of always

//更新角色速度
wire [9:0] realSpeed[1:0];
calSpeed #(_MAX_OFFSET, 0, _BAS_SPEED, _SPEED_LEVEL) chara_speed(Offset[0], realSpeed[0]);
calSpeed #(_MAX_OFFSET, _BAS_OFFSET, _BAS_SPEED, _SPEED_LEVEL) chris_speed(Offset[1], realSpeed[1]);
// 单次运算
always @(posedge next_s or negedge rst_n) begin
    if (!rst_n) begin // 初始化
        Chstate[0] <= 0;
        Chstate[1] <= 0;
        Time[0] <= _START_P * _BAS_TIME;
        Time[1] <= (_DIAMETER - _START_P) * _BAS_TIME;
        Offset[0] <= 0;
        Offset[1] <= _BAS_OFFSET;
        Speed[0] <= 0;//_BAS_SPEED;
        Speed[1] <= 0;//_BAS_SPEED;
        win_flag <= 0;
        over_flag <= 0;
    end // end of rst_n
    else begin
        if (next_s && !over_flag) begin // 计算操作
            // 处理操作
            casex(operation[2:1])
                // 向右走
                2'bx1: begin
                    if (!CurChara) Chstate[0] <= 1'b0;  //伦太郎正行
                    else Chstate[1] <= 1'b1;            //红莉栖倒行
                end
                // 向左走
                2'b10: begin
                     if (!CurChara) Chstate[0] <= 1'b1;  //伦太郎倒行
                     else Chstate[1] <= 1'b0;            //红莉栖正行
                end
            endcase

            // 同步计算双主角参数
            // 更新时间
            if (Chstate[0]) begin // 伦太郎
                if (Time[0] > Speed[0]) Time[0] <= Time[0] - Speed[0];
                else Time[0] <= _DIAMETER * _BAS_TIME + Time[0] - Speed[0];
            end else begin
                if (Time[0] < _DIAMETER * _BAS_TIME)  Time[0] <= Time[0] + Speed[0];
                else Time[0] <= Speed[0];
            end
            if (!Chstate[1]) begin // 红莉栖
                 if (Time[1] > Speed[1]) Time[1] <= Time[1] - Speed[1];
                 else Time[1] <= _DIAMETER * _BAS_TIME;
            end else begin
                 if (Time[1] < _DIAMETER * _BAS_TIME)  Time[1] <= Time[1] + Speed[1];
                 else Time[1] <= Speed[1];
            end
            
            // 更新偏移量
            if (Chstate[0]) begin // 伦太郎
                if (Offset[0] < _MAX_OFFSET) Offset[0] <= Offset[0] + _PER_OFFSET * Speed[0] / _BAS_SPEED;
                else Offset[0] <= 0;
            end else begin
                Offset[0] <= Offset[0]; // 保持不变
            end
            if (Chstate[1]) begin // 红莉栖
                if (Offset[1] > _PER_OFFSET) Offset[1] <= Offset[1] - _PER_OFFSET * Speed[1] / _BAS_SPEED;
                else Offset[1] <= _MAX_OFFSET;
            end else begin
                Offset[1] <= Offset[1]; // 保持不变
            end
            
            // 更新角色速度
            Speed[0] <= realSpeed[0];
            Speed[1] <= realSpeed[1];
            
            // 判断游戏结束
            // 两人相遇，游戏胜利
            if (Time[0] <= Time[1] && Time[1] - Time[0] <= _MEET_DIST * _BAS_TIME &&
                (Offset[0] >= Offset[1] ? Offset[0] - Offset[1] : Offset[1] - Offset[0]) <= _MEET_OFF)
                begin  Chstate[0] <= 0; Chstate[1] <= 0;  //角色状态置零
                       Speed[0] <= 0; Speed[1] <= 0;      //角色速度置零
                       win_flag <= 1; over_flag <= 1; end //胜利标记
            // 彼此错过，游戏失败
            if (Time[0] <= Speed[0] || Time[1] >= _DIAMETER * _BAS_TIME ||
                Offset[1] > _BAS_OFFSET * _BAS_TIME || Offset[2] > _BAS_OFFSET * _BAS_TIME)
                 begin  Chstate[0] = 1; Chstate[1] = 1;     //角色状态置一
                        Speed[0] <= 0; Speed[1] <= 0;       //角色速度置零
                        win_flag <= 0; over_flag <= 1; end  //失败标记
        end // end of next_s
    end // end of ena
end // end of always

//输出赋值
assign character = {Chstate[~CurChara], Chstate[CurChara], CurChara};       // 角色信息
assign offset = Offset[CurChara];                       // 世界线偏移量0-99999999
assign speed = Speed[CurChara] / _BAS_SPEED;            // 速度：16梯度0-15
assign obstacle = Obstacle;                     // 障碍物位置
assign obstimes = Obstimes;                     // 障碍物大小
assign progress = Time[CurChara] / _BAS_TIME * _SCREEN_WIDTH / _DIAMETER;   //游戏进度
assign offgress = (Offset[CurChara] >> 12) * 60 / (_BAS_OFFSET >> 12);      //偏移进度
assign game_over = over_flag;           // 游戏结束，高电平有效
assign game_win = win_flag;             // 游戏成功，高电平有效

endmodule

module calSpeed(
    input[26:0] offset,
    output[9:0] speed
    );
parameter _MAX_OFFSET = 3355_4432; // 最大世界线偏移量
parameter _BAS_OFFSET = 1000_0000; // 基础世界线偏移量
parameter _BAS_SPEED = 64;   // 速度单位量
parameter _SPEED_LEVEL = 16; // 速度有16个等级

wire [26:0] off = (offset > _BAS_OFFSET) ? (offset - _BAS_OFFSET) % (_MAX_OFFSET >> 1) : (_BAS_OFFSET - offset) % (_MAX_OFFSET >> 1);
wire [5:0] ori_level = (off >> 8) * 2 * _SPEED_LEVEL / (_MAX_OFFSET >> 9); // 32个层级
assign speed = _BAS_SPEED * ((ori_level < _SPEED_LEVEL / 2) ? (1 + ori_level) :
                             (ori_level < _SPEED_LEVEL) ? (5 + ori_level / 2) :
                             (7 + ori_level / 4));

endmodule

module anotherChara(
    input [21:0] thisTime,
    input [21:0] thatTime,
    input [26:0] thisOffset,
    input [26:0] thatOffset,
    output [9:0] obsta,
    output [3:0] obstm
    );
parameter _BAS_TIME = 64;    // 时间流逝基准值
parameter _SCREEN_WIDTH = 1024; // 屏幕宽度
parameter _SCREEN_TIME = 2048;  // 一屏代表的时间
parameter _SCREEN_OFFSET = 0050_0000;   // 相遇时间线差基值
parameter _CHARA_XPOS = 512; // 角色水平位置
parameter _CHARA_WIDTH = 200; // 角色水平宽度

wire [15:0] thisT = thisTime[21:6];
wire [15:0] thatT = thatTime[21:6];
wire exist = (thisT >= thatT ? thisT - thatT < _SCREEN_TIME >> 1 : thatT - thisT < _SCREEN_TIME >> 1);
wire [5:0] times = (thisOffset >= thatOffset ? (thisOffset - thatOffset) >> 5 : (thatOffset - thisOffset) >> 5) / (_SCREEN_OFFSET >> 5);
assign obsta = !exist ? 10'b0 :
               thisT >= thatT ? _CHARA_XPOS - (thisT - thatT) * _SCREEN_WIDTH / _SCREEN_TIME :
                                _CHARA_XPOS + (thatT - thisT) * _SCREEN_WIDTH / _SCREEN_TIME;
assign obstm = times > 15 ? 4'b0 : 15 - times;
endmodule
