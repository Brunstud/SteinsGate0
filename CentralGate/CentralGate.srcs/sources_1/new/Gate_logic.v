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


/*module Gate_logic1(
    input ena,                  // 使能型号（每次开始注意先初始化）
    input clk,                  // 系统时钟
    input rst_n,                // 置零，低电平有效
    input next_s,               // 开始运算记号，高电平激发（频率为60Hz）
    input [2:0] operation,      // 操作信号：左转、右转、按钮，高电平有效
    
    output [1:0] character,     // 角色信息：角色状态，角色选择
    output [26:0] offset,       // 世界线偏移量0-999999
    output [3:0] speed,         // 速度：16梯度
    output [9:0] obstacle,     // 障碍物位置：0位存是否有障碍物
    output [7:0] obstimes,     // 障碍物位置
    
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
parameter _CHARA_XPOS = 512; // 角色水平位置
parameter _CHARA_WIDTH = 200; // 角色水平宽度
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
reg [9:0] Obstacle;  // 障碍物位置
reg [7:0] Obstimes;  // 障碍物大小

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
            default: Charac[1] <= 0;
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
assign speed = Speed / _BAS_SPEED;          // 速度：16梯度0-15
assign obstacle = Obstacle;                     // 障碍物位置
assign game_over = over_flag;           // 游戏结束，高电平有效
assign game_win = win_flag;             // 游戏成功，高电平有效

//测试
assign phi = Phi;
assign off = Offset;

endmodule*/


module Gate_logic2(
    input clk,                  // 系统时钟
    input rst_n,                // 置零，低电平有效
    input next_s,               // 开始运算记号，高电平激发（频率为60Hz）
    input [2:0] operation,      // 操作信号：左转、右转、按钮，高电平有效
    
    output character,           // 角色信息：角色状态，角色选择
    output [26:0] offset,       // 世界线偏移量0-999999
    output [3:0] speed,         // 速度：15梯度
    output [9:0] obstacle,     // 障碍物位置：0则表示无障碍物
    output [7:0] obstimes,     // 障碍物位置
    output [9:0] progress,      // 当前时间进度0-1024
    output [8:0] offgress,      // 当前偏移进度
    
    output game_over,           // 游戏结束，高电平有效
    output game_win,             // 游戏成功（1：成功，0：失败）
    
    output [14:0] phi,//用于测试
    output [23:0] off //用于测试
    );
parameter _MAX_OFFSET = 1000_0000; // 最大世界线偏移角
parameter _DIAMETER = 21600;       // 世界直径6min，15bit
parameter _DISTINATION = 18000;    // 世界终点5min
//游戏参数（频率为60Hz）
parameter _START_P = 1000;    // 初始时间点10s
parameter _DEL_PHI = 1;      // phi角度增量（基准值256）
parameter _BAS_PHI = 1024;    // 角度基准值256，10bit
parameter _MAX_PHI = 16000;   // 最大phi，15bit
parameter _MIN_PHI = -16000;  // 最小phi，15bit

parameter _BAS_SPEED = 64;   // 速度单位量
parameter _BAS_TIME = 64;    // 时间流逝基准值
parameter _SPEED_LEVEL = 16; // 速度有16个等级
parameter _BACK_TIMES = 3;   // 世界线收束速率

parameter _SCREEN_WIDTH = 1024; // 屏幕宽度
parameter _CHARA_XPOS = 512; // 角色水平位置
parameter _CHARA_WIDTH = 200; // 角色水平宽度
parameter _OBST_WID = 2048;   // 障碍物之间的水平距离
parameter _OBST_HEI = 2048;   // 障碍物之间的竖直距离
parameter _OBST_BAS = 200;    // 障碍物基准宽度
//状态标记量
reg over_flag;      // 游戏结束标记
reg win_flag;       // 游戏胜利标记
//游戏变量
reg Charac;           // 角色状态
reg [21:0] Time;      // 时间t（最大值32768 * 64）
reg signed [14:0] Phi;       // 角色偏移角phi（基准值1024，取值-16384~16383）,左
reg signed [21:0] Offset;    // 角色偏移量s（最大值±32768 * 64）,左
reg [20:0] Distance;  // 世界偏移量d（最大值32768 * 64）
reg [9:0] Speed;      // 角色行进速度v（基准级：64）
reg [9:0] Obstacle;   // 障碍物位置1-1023
reg [7:0] Obstimes;   // 障碍物大小50-255

// 实时更新世界偏移量
wire [20:0] Dist;  // 世界偏移量d（最大值32768 * 64）
calDistance #(_DIAMETER, _BAS_TIME) dis_uut(Time, Dist);
//assign Distance = Time;
//计算障碍物位置
wire [9:0] Obsta;   // 障碍物位置1-1023
wire [7:0] Obstm;   // 障碍物大小50-255
setObstacle #(_BAS_PHI, _BAS_TIME, _SCREEN_WIDTH, _CHARA_XPOS, _OBST_WID, _OBST_HEI, _OBST_BAS)
            obst_uut(Time, Offset, Phi, Obsta, Obstm);

// 初始化
initial begin
    Charac = 0;
    Time = _START_P * _BAS_TIME;
    Phi = 0;
    Offset = 0;
    Distance = 0;
    Speed = _BAS_SPEED;
    Obstacle <= 0;
    Obstimes <= 0;
    win_flag <= 0;
    over_flag <= 0;
end

// 单次运算
always @(posedge next_s or negedge rst_n) begin
    if (!rst_n) begin // 初始化
        Charac <= 0;
        Time <= _START_P * _BAS_TIME;
        Phi <= 0;
        Offset <= 0;//_START_P * _BAS_TIME;
        Speed <= _BAS_SPEED;
        win_flag <= 0;
        over_flag <= 0;
    end // end of rst_n
    else begin
        if (next_s && !over_flag) begin // 计算操作
            // 处理操作
            if (operation[0])
                Charac <= 1'b1;
            else
                Charac <= 1'b0;
            casex(operation[2:1])
                2'b1x: if (Charac && Phi < _MAX_PHI) begin      // 左转检查
                            Phi <= Phi + _DEL_PHI * speed; // 左转为正
                       end
                2'b01: if (Charac && $signed(Phi) > $signed(_MIN_PHI)) begin  // 右转检查
                            Phi <= Phi - _DEL_PHI * speed; // 右转为负
                        end
            endcase
        
            // 当角色为正常态时，世界线回归
            if (!Charac) begin
                if ($signed(Phi) > 0)
                //if ($signed(Phi) + $signed(_DIAMETER * _BAS_TIME - Time) / $signed(Offset) > 0)
                //if ($signed(Phi) * (Offset[21] ? $signed(~Offset) : Offset) > $signed(_DIAMETER * _BAS_TIME / 2 - Time))
                    Phi <= Phi - _BACK_TIMES * _DEL_PHI * speed;
                else
                    Phi <= Phi + _BACK_TIMES * _DEL_PHI * speed;
            end
        
            // 更新数据
            if (!Charac)
                Time <= Time + Speed * _BAS_TIME / _BAS_SPEED; // 更新时间
            else begin
                if (Time <= Speed * _BAS_TIME / _BAS_SPEED)
                    Time <= _DIAMETER * _BAS_TIME;
                else
                    Time <= Time - Speed * _BAS_TIME / _BAS_SPEED; // 更新时间
            end
            // 更新偏移量
            if (Phi[14]) begin // 带符号运算
                Offset <= Offset - ($signed(~Phi) * Speed * _BAS_TIME) / (_BAS_PHI * _BAS_SPEED);// 更新角色偏移值
            end else begin
                Offset <= Offset + (Phi * Speed * _BAS_TIME) / (_BAS_PHI * _BAS_SPEED);// 更新角色偏移值
            end
            // 更新速度
            if ((Phi[14] ? $signed(~Phi) : Phi) <= _BAS_PHI)
                Speed <= _BAS_SPEED * 5 * (Phi[12] ? $signed(~Phi) : Phi) / _BAS_PHI + _BAS_SPEED;// 更新当前速率
            else begin
                if ((Phi[14] ? $signed(~Phi) : Phi) / _BAS_PHI <= 8)
                    Speed <= ((Phi[14] ? $signed(~Phi) : Phi) / _BAS_PHI + 4) * _BAS_SPEED;// 更新当前速率
                else begin
                    if ((Phi[14] ? $signed(~Phi) : Phi) / _BAS_PHI <= 16)
                         Speed <= ((Phi[14] ? $signed(~Phi) : Phi) / _BAS_PHI / 2 + 8) * _BAS_SPEED;// 更新当前速率
                end
            end
            // 更新世界距离及障碍物
            Distance <= Dist;
            Obstacle <= Obsta;
            Obstimes <= Obstm;
        
            // 判断游戏flag
            if (offset >= _MAX_OFFSET && Time >= _DISTINATION * _BAS_TIME && Time <= (_DISTINATION + 1024) * _BAS_TIME) begin win_flag = 1'b1; over_flag = 1'b1; end
            //if (offset < _MAX_OFFSET && Time >= _DISTINATION * _BAS_TIME && Time <= (_DISTINATION + 1024) * _BAS_TIME
            //   || Obstacle && Obstimes > 100 && Obstacle + Obstimes / 2 >= _CHARA_XPOS - _CHARA_WIDTH / 2 && Obstacle - Obstimes / 2 <= _CHARA_XPOS + _CHARA_WIDTH / 2)
            //   begin win_flag = 1'b0; over_flag = 1'b1; end
        
        end // end of next_s
    end // end of ena
end // end of always

//输出赋值
assign character = Charac;                      // 角色信息
assign offset = (Offset[21] ? $signed(~Offset >> 10) : (Offset >> 10)) * _MAX_OFFSET / (Distance >> 10);     // 世界线偏移量0-99999999
assign speed = Speed / _BAS_SPEED;          // 速度：16梯度0-15
assign obstacle = Obstacle;                     // 障碍物位置
assign obstimes = Obstimes;                     // 障碍物大小
assign progress = Time / _BAS_TIME * _SCREEN_WIDTH / _DIAMETER;   //游戏进度
assign offgress = (Offset[21] ? $signed(~Offset >> 10) : (Offset >> 10)) * 60 / (Distance >> 10); //偏移进度
assign game_over = over_flag;           // 游戏结束，高电平有效
assign game_win = win_flag;             // 游戏成功，高电平有效

//测试
assign phi = Phi;
assign off = Offset;

endmodule

//模型二：圆球模型，计算世界线距离
module calDistance(
    input [20:0] Time,      // 行进距离
    output [20:0] Distance  // 世界线距离
    );
    parameter _DIAMETER = 21600,    // 世界直径6min，15bit
                _BAS_TIME = 64;      // 时间流逝基准值
    //assign Distance = Time;
    // 计算斜边平方和直角边平方
    wire [20:0] radius = _DIAMETER * _BAS_TIME / 2;
    wire [20:0] side = (Time > radius) ? (Time - radius) : (radius - Time);
    wire [41:0] side_sq = side * side;
    wire [41:0] radius_sq = radius * radius;
           
    // 确保斜边的长度大于直角边的长度
    assign Distance = (radius > side) ? sqrt(radius_sq - side_sq) : 20'd0;
      
    // 实现简单的平方根函数（示例，可能需要根据实际需求调整）
        /*function [20:0] sqrt;
            input [41:0] x;
            begin
                sqrt = x[20:0]; // 简化示例，实际中可能需要更复杂的计算
            end
        endfunction*/
    // 实现牛顿-拉弗森平方根函数
        function [20:0] sqrt;
            input [41:0] x;
            reg [20:0] result;
            reg [20:0] next_result;
            reg [3:0] times;
            begin
                result = x[20:0]; // 初始估计
                next_result = 0;
                times = 0;
    
                // 进行多次迭代以提高精度
                while (times < 10) begin
                    if (result != 0) begin
                        next_result = result;
                        // 牛顿-拉弗森迭代法
                        result = (result + x / result) >> 1;
                    end
                    else begin
                        result = 1; // 避免除以零
                    end
                    times = times + 1;
                end
                sqrt = result;
            end
        endfunction
endmodule

//方格障碍物
module setObstacle(
    input [20:0] Time,      // 行进距离
    input [21:0] Offset,    // 偏移距离
    input [14:0] Phi,       // 偏移角
    output [9:0] Obstacle,   // 障碍物位置
    output [7:0] Obstimes    // 障碍物大小
    );
    parameter _BAS_PHI = 256,      // 角度基准值256，8bit
                _BAS_TIME = 64,     // 时间流逝基准值
                _SCREEN_WIDTH = 1024, // 屏幕宽度
                _CHARA_XPOS = 512,  // 角色水平位置
                _OBST_WID = 2048,   // 障碍物之间的水平距离
                _OBST_HEI = 2048,   // 障碍物之间的竖直距离
                _OBST_BAS = 250;    // 障碍物基准宽度
    //assign Obstacle = 0;
    //assign Obstimes = 0;
    // 限制在小方格中
    wire dir_x = ((Time / _BAS_TIME) % _OBST_WID) < _OBST_WID >> 1;
    wire [20:0] relTime = dir_x ? ((_OBST_WID >> 1) - (Time / _BAS_TIME) % (_OBST_WID >> 1)) : ((Time / _BAS_TIME) % (_OBST_WID >> 1));
    wire [20:0] absOff = Offset[21] ? ~Offset / _BAS_TIME : Offset / _BAS_TIME;
    wire dir_y = (absOff % _OBST_HEI) < (_OBST_HEI >> 1);
    wire [20:0] relOff = dir_x ? ((_OBST_HEI >> 1) - absOff % (_OBST_HEI >> 1)) : (absOff % (_OBST_HEI >> 1));
    //角方向
    wire dir = Phi[12] && Offset[21] || ~Phi[12] && ~Offset[21];
    wire [13:0] absPhi = Phi[14] ? ~Phi : Phi;
    // 计算障碍物位置及大小
    wire insight = dir_x && dir_y && dir || ~dir_x && ~dir_y && dir ||
                     dir_x && ~dir_y && ~dir || ~dir_x && dir_y && ~dir;
    assign Obstacle = (insight && relTime< _SCREEN_WIDTH) ?
                      (dir_x ? (_CHARA_XPOS + relTime / 2) : (_CHARA_XPOS - relTime / 2))
                      : 10'd0; 
    wire [9:0] abs = (relTime * absPhi / _BAS_PHI > relOff) ? (relTime * absPhi / _BAS_PHI - relOff) : (relOff - relTime * absPhi / _BAS_PHI);
    assign Obstimes = (insight && (abs < _OBST_BAS - 50)) ? (_OBST_BAS - abs) : 8'd0; 
endmodule