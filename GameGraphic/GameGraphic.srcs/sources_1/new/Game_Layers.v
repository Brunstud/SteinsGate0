`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 14:38:11
// Design Name: 
// Module Name: Game_Layers
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 游戏图层
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BG_layer(
    input  vga_clk,                 // VGA驱动时钟
    input  disp_en,                 // 显示有效信号
    input  [11:0]  pix_xpos,        // 像素点横坐标
    input  [11:0]  pix_ypos,        // 像素点纵坐标
    output reg  valid,              // 该点是否有像素
    output reg  [11:0]  pix_data    // 像素点数据
    );
    parameter  H_DISP   =  1024;   // 水平像素点数
    parameter  V_DISP   =  600;    // 竖直像素点数
            
    always @(posedge vga_clk) begin
         if (disp_en) begin
              if(pix_xpos >= 0  && pix_xpos < H_DISP && pix_ypos >= 0  && pix_ypos < V_DISP) 
                   begin
                       valid <= 1'b1;//该图层有效数据
                       pix_data <= 12'h0ff;
                    end
               else begin
                    valid <= 1'b0;//该图层透明像素点
                    pix_data <= 12'hfff;
               end
          end else begin
              valid <= 1'b0;
              pix_data <= 12'h000;
          end
    end

endmodule

module Satellbg_layer(
    input  vga_clk,                 // VGA驱动时钟
    input  disp_en,                 // 显示有效信号
    input  [9:0] progress,          // 进度条
    input  [11:0]  pix_xpos,        // 像素点横坐标
    input  [11:0]  pix_ypos,        // 像素点纵坐标
    output reg  valid,              // 该点是否有像素
    output reg  [11:0]  pix_data    // 像素点数据
    );
    parameter  H_DISP   =  1024;   // 水平像素点数
    parameter  V_DISP   =  600;    // 竖直像素点数
    parameter  IMG_WIDTH = 100;
    parameter  IMG_HEIGHT = 100;
    parameter  BASEY = 400;   // 纵坐标
    parameter  START_PRO = 341; // 三分之一点
    parameter  END_PRO = 682;   // 三分之二点
    parameter  TIMES = 4;   // 放大4倍
    reg [12:0] img_addr;
    wire [15:0] img_data;
    wire [1:0] choice = progress / START_PRO;
    wire [9:0] basex = (START_PRO - progress % START_PRO) * 3;
    always @(posedge vga_clk) begin
         if (disp_en) begin
              img_addr <= 12'b0; //文件指针归零
              if(basex && pix_xpos >= basex - IMG_WIDTH / 2 * TIMES  && pix_xpos < basex + IMG_WIDTH / 2 * TIMES  &&
                 pix_ypos >= BASEY - IMG_HEIGHT * TIMES && pix_ypos < BASEY) 
                   begin
                       //building2：fff为默认透明的区域
                       //satellite：0ff为默认透明的区域
                       //building1：0f0为默认透明的区域
                       if (choice == 2'b00 && img_data[11:8] >= 4'hd && img_data[7:4] >= 4'hd && img_data[3:0] >= 4'hd ||
                           choice == 2'b01 && img_data[11:8] <= 4'h2 && img_data[7:4] >= 4'hd && img_data[3:0] >= 4'hd ||
                           choice == 2'b10 && img_data[11:8] <= 4'h2 && img_data[7:4] >= 4'hd && img_data[3:0] <= 4'h2 ||
                           choice == 2'b11)
                           valid <= 1'b0;//该图层透明像素点
                       else
                           valid <= 1'b1;//该图层有效数据
                       pix_data <= img_data[11:0];
                       img_addr <= (IMG_HEIGHT - (BASEY - pix_ypos) / TIMES) * IMG_WIDTH + 
                                   (pix_xpos + IMG_WIDTH / 2 * TIMES - basex) / TIMES;//比色素早一步 
                    end
               else begin
                    valid <= 1'b0;//该图层透明像素点
                    pix_data <= 12'hfff;
               end
          end else begin
              valid <= 1'b0;
              pix_data <= 12'h000;
          end
    end
    
    wire [15:0] img_sate;
    wire [15:0] img_build1;
    wire [15:0] img_build2;
    assign img_data = choice == 2'b00 ? img_build2 :
                      choice == 2'b01 ? img_sate :
                      choice == 2'b10 ? img_build1 :
                      12'hfff;
    satellite1_rom ROM_inst (
         .clka(vga_clk),
         .addra(img_addr),
         .douta(img_sate),
         .ena(disp_en) // 连接 ROM 输出数据到您的模块中
         );
    building1_rom ROM1_inst (
         .clka(vga_clk),
         .addra(img_addr),
         .douta(img_build1),
         .ena(disp_en) // 连接 ROM 输出数据到您的模块中
         );
    building2_rom ROM2_inst (
         .clka(vga_clk),
         .addra(img_addr),
         .douta(img_build2),
         .ena(disp_en) // 连接 ROM 输出数据到您的模块中
         );

endmodule

module Road_layer(
    input  vga_clk,                 // VGA驱动时钟
    input  disp_en,                 // 显示有效信号
    input  forward,                 // 根据角色状态前进/后退
    input  [3:0] speed,             // 前进速度
    input  [11:0]  pix_xpos,        // 像素点横坐标
    input  [11:0]  pix_ypos,        // 像素点纵坐标
    output reg  valid,              // 该点是否有像素
    output reg  [11:0]  pix_data    // 像素点数据
    );
    parameter  H_DISP   =  1024;   // 水平像素点数
    parameter  V_DISP   =  600;    // 竖直像素点数
    parameter  IMG_WIDTH = 256;
    parameter  IMG_HEIGHT = 141;
    reg [15:0] img_addr;
    wire [15:0] img_data;
    //马路移动
    wire clk_50Hz;
    reg [7:0] counter = 0;
    divider_1M d1M(vga_clk, 1'b1, clk_50Hz);
    always @(posedge clk_50Hz) begin
        if (forward)
            counter <= counter - speed;//时间顺行
        else
            counter <= counter + speed;//时间回溯
    end
    //显示马路
    always @(posedge vga_clk) begin
         if (disp_en) begin
              img_addr <= 12'b0; //文件指针归零
              if(pix_xpos >= 0  && pix_xpos < H_DISP  && pix_ypos >= V_DISP - IMG_HEIGHT * 2  && pix_ypos < V_DISP) 
                   begin
                       //fff为默认透明的区域
                       if (pix_ypos <= V_DISP - IMG_HEIGHT * 5 / 3 && img_data[11:8] >= 4'he &&  img_data[7:4] >= 4'he && img_data[3:0] >= 4'he)
                            valid <= 1'b0;//该图层透明像素点
                       else
                            valid <= 1'b1;//该图层有效数据
                       pix_data <= img_data[11:0];
                       img_addr <= (pix_ypos - V_DISP + IMG_HEIGHT * 2) / 2 * IMG_WIDTH + ((pix_xpos - counter) % IMG_WIDTH);//比色素早一步 
                    end
               else begin
                    valid <= 1'b0;//该图层透明像素点
                    pix_data <= 12'hfff;
               end
          end else begin
              valid <= 1'b0;
              pix_data <= 12'h000;
          end
    end
    
    road1_rom ROM_inst (
         .clka(vga_clk),
         .addra(img_addr),
         .douta(img_data),
         .ena(disp_en), // 连接 ROM 输出数据到您的模块中
         .wea()
         );

endmodule

module Chara_layer(
    input  vga_clk,                 // VGA驱动时钟
    input  disp_en,                 // 显示有效信号
    input  [3:0] chara,             // 选择角色
    input  [9:0] obstacle,          // 另一个角色
    input  [3:0] obstimes,          // 另一个角色的清晰度
    input  [9:0] progress,          // 游戏进度
    input  [8:0] offgress,          // 偏移进度
    input  [11:0]  pix_xpos,        // 像素点横坐标
    input  [11:0]  pix_ypos,        // 像素点纵坐标
    output valid,              // 该点是否有像素
    output [11:0]  pix_data    // 像素点数据
    );
    parameter  H_DISP   =  1024;   // 水平像素点数
    parameter  V_DISP   =  600;    // 竖直像素点数
    parameter  IMG_WIDTH = 200;
    parameter  IMG_HEIGHT = 200;
    parameter  SHRINK   =  10;     // 线性缩小倍数 
    parameter  POSX = 512;         // 当前角色横坐标
    parameter  POSY = 230;         // 当前角色纵坐标
    parameter  SHARP = 16;         // 清晰度
    //读取图片信息
    wire [15:0] img_addr [1:0];    // 分别读两个角色的地址，0：伦太郎，1：红莉栖
    reg [15:0] ch_addr [1:0];      // 分别读两个角色的地址，0：当前角色，1：另一个角色红莉栖
    assign img_addr[0] = ch_addr[chara[0]];
    assign img_addr[1] = ch_addr[~chara[0]];
    wire [15:0] ch_data [1:0];     // 分别读两个角色的数据，0：当前角色，1：另一个角色
    //内部图层：0为当前角色，1为另一个角色
    reg [1:0] chvalid;
    reg [11:0] ch_pix_data [1:0];
    assign valid = chvalid[1] || chvalid[0];
    assign pix_data = chvalid[0] ? ch_pix_data[0] :
                      chvalid[1] ? ch_pix_data[1] :
                      12'hfff;//默认白色

    // 当前角色图层（包括进度条）
    always @(posedge vga_clk) begin
         if (disp_en) begin
              ch_addr[0] <= 12'b0; //文件指针归零
              // 显示进度条
              if(progress && 
                 (!chara[0] && pix_xpos < progress + IMG_WIDTH / 2 / SHRINK ||
                  chara[0] && pix_xpos > progress - IMG_WIDTH / 2 / SHRINK) &&
                  pix_ypos >= V_DISP - offgress - IMG_HEIGHT / SHRINK && pix_ypos < V_DISP - offgress) 
                   begin
                   if (!chara[0] && pix_xpos < progress - IMG_WIDTH / 2 / SHRINK ||
                       chara[0] && pix_xpos > progress + IMG_WIDTH / 2 / SHRINK) begin
                         chvalid[0] <= 1'b1;
                         ch_pix_data[0] <= 12'h0ff;//蓝条
                   end else begin
                       //0ff亦显示
                       chvalid[0] <= 1'b1;//该图层有效数据
                       ch_pix_data[0] <= ch_data[0][11:0];
                       ch_addr[0] <= (IMG_HEIGHT - (V_DISP - offgress - pix_ypos) * SHRINK) * IMG_WIDTH + 
                                     (pix_xpos + IMG_WIDTH / 2 / SHRINK - progress) * SHRINK;
                   end
              end
              else begin
                  // 显示当前角色
                  if(pix_xpos >= POSX - IMG_WIDTH / 2  && pix_xpos < POSX + IMG_WIDTH / 2  && pix_ypos >= POSY  && pix_ypos < POSY + IMG_HEIGHT)
                       begin
                           //0ff为默认透明的区域
                           if (ch_data[0][11:8] <= 4'h2 && ch_data[0][7:4] >= 4'hd && ch_data[0][3:0] >= 4'hd)
                               chvalid[0] <= 1'b0;//该图层透明像素点
                           else
                               chvalid[0] <= 1'b1;//该图层有效数据
                           ch_pix_data[0] <= ch_data[0][11:0];
                           ch_addr[0] <= (pix_ypos - POSY) * IMG_WIDTH + (pix_xpos - POSX + IMG_WIDTH / 2); 
                        end
                   else begin
                        chvalid[0] <= 1'b0;
                        ch_pix_data[0] <= 12'hfff;
                   end // end of this character
              end // end of progress
          end else begin
              chvalid[0] <= 1'b0;
              ch_pix_data[0] <= 12'h000;
          end // end of disp_en
    end // end of always
    
    // 另一个角色图层
    always @(posedge vga_clk) begin
        if (disp_en) begin
            ch_addr[1] <= 12'b0; //文件指针归零
            // 显示另一个角色
            if (obstacle && obstimes &&
                pix_xpos >= obstacle - IMG_WIDTH / 2  && pix_xpos < obstacle + IMG_WIDTH / 2  && pix_ypos >= POSY  && pix_ypos < POSY + IMG_HEIGHT) 
                begin
                    //0ff为默认透明的区域
                    if (ch_data[1][11:8] <= 4'h2 && ch_data[1][7:4] >= 4'hd && ch_data[1][3:0] >= 4'hd ||
                        (pix_xpos + pix_ypos) % SHARP > obstimes)//模糊效果
                        chvalid[1] <= 1'b0;//该图层透明像素点
                    else
                        chvalid[1] <= 1'b1;//该图层有效数据
                    ch_pix_data[1] <= ch_data[1][11:0];
                    ch_addr[1] <= (pix_ypos - POSY) * IMG_WIDTH + (pix_xpos - obstacle + IMG_WIDTH / 2); 
                end
            else begin
                // 透明像素点
                chvalid[1] <= 1'b0;//该图层透明像素点
                ch_pix_data[1] <= 12'hfff;;
            end // end of other character
        end else begin
            chvalid[1] <= 1'b0;
            ch_pix_data[1] <= 12'h000;
        end // end of disp_en
    end // end of always
    
    wire [15:0] img_chara1;
    wire [15:0] img_chara2;
    wire [15:0] img_chris1;
    wire [15:0] img_chris2;
    //当前角色数据
    assign ch_data[0] = (!chara[0] ? 
                         (chara[1] ? img_chara2 : img_chara1) : //当前角色状态
                         (chara[1] ? img_chris2 : img_chris1)); //当前角色状态
    //另一个角色数据
    assign ch_data[1] = (chara[0] ? 
                         (chara[2] ? img_chara2 : img_chara1) : //另一角色状态
                         (chara[2] ? img_chris2 : img_chris1)); //另一角色状态
    //实例化ROM
    chara1_rom ROM1_inst (
         .clka(vga_clk),
         .addra(img_addr[0]),
         .douta(img_chara1),
         .ena(disp_en), // 连接 ROM 输出数据到您的模块中
         .wea()
         );
    chara2_rom ROM2_inst (
         .clka(vga_clk),
         .addra(img_addr[0]),
         .douta(img_chara2),
         .ena(disp_en)  // 连接 ROM 输出数据到您的模块中
         );
    chris1_rom ROM3_inst (
         .clka(vga_clk),
         .addra(img_addr[1]),
         .douta(img_chris1),
         .ena(disp_en)  // 连接 ROM 输出数据到您的模块中
         );
    chris2_rom ROM4_inst (
         .clka(vga_clk),
         .addra(img_addr[1]),
         .douta(img_chris2),
         .ena(disp_en)  // 连接 ROM 输出数据到您的模块中
         );

endmodule

/*module Satellite_layer(
    input  vga_clk,                 // VGA驱动时钟
    input  disp_en,                 // 显示有效信号
    input  [9:0]basex,                   // 障碍物位置
    input  [7:0]times,                   // 障碍物大小
    input  [11:0]  pix_xpos,        // 像素点横坐标
    input  [11:0]  pix_ypos,        // 像素点纵坐标
    output reg  valid,              // 该点是否有像素
    output reg  [11:0]  pix_data    // 像素点数据
    );
    parameter  H_DISP   =  1024;   // 水平像素点数
    parameter  V_DISP   =  600;    // 竖直像素点数
    parameter  IMG_WIDTH = 200;
    parameter  IMG_HEIGHT = 200;
    parameter  BASEX = 900;   // 横坐标
    parameter  BASEY = 430;   // 纵坐标
    parameter  TIMES = 160;   // 基数200
    reg [15:0] img_addr;
    wire [15:0] img_data;
            
    always @(posedge vga_clk) begin
         if (disp_en) begin
              img_addr <= 12'b0; //文件指针归零
              if(basex && pix_xpos >= basex - IMG_WIDTH / 2 * times / 200  && pix_xpos < basex + IMG_WIDTH / 2 * times / 200  &&
                 pix_ypos >= BASEY - IMG_HEIGHT * times / 200 + 1 && pix_ypos < BASEY) 
                   begin
                       //0ff为默认透明的区域
                       if (img_data[11:8] <= 4'h2 && img_data[7:4] >= 4'hd && img_data[3:0] >= 4'hd)
                           valid <= 1'b0;//该图层透明像素点
                       else
                           valid <= 1'b1;//该图层有效数据
                       pix_data <= img_data[11:0];
                       img_addr <= (IMG_HEIGHT - (BASEY - pix_ypos + 1) * 200 / times) * IMG_WIDTH + 
                                   (pix_xpos + IMG_WIDTH / 2 * times / 200 - basex) * 200 / times;//比色素早一步 
                    end
               else begin
                    valid <= 1'b0;//该图层透明像素点
                    pix_data <= 12'hfff;
               end
          end else begin
              valid <= 1'b0;
              pix_data <= 12'h000;
          end
    end
    
    satellite1_rom ROM_inst (
         .clka(vga_clk),
         .addra(img_addr),
         .douta(img_data),
         .ena(disp_en) // 连接 ROM 输出数据到您的模块中
         );

endmodule*/

/*module Progress_layer(
    input  vga_clk,                 // VGA驱动时钟
    input  disp_en,                 // 显示有效信号
    input  [1:0] chara,             // 当前角色
    input  [9:0] progress,          // 游戏进度
    input  [8:0] offgress,          // 偏移进度
    input  [11:0]  pix_xpos,        // 像素点横坐标
    input  [11:0]  pix_ypos,        // 像素点纵坐标
    output reg  valid,              // 该点是否有像素
    output reg  [11:0]  pix_data    // 像素点数据
    );
    parameter  H_DISP   =  1024;   // 水平像素点数
    parameter  V_DISP   =  600;    // 竖直像素点数
    parameter  IMG_WIDTH = 200;
    parameter  IMG_HEIGHT = 200;
    parameter  SHRINK   =  10;     // 线性缩小倍数 
    reg [15:0] img_addr;
    wire [15:0] img_data;
            
    always @(posedge vga_clk) begin
         if (disp_en) begin
              img_addr <= 12'b0; //文件指针归零
              if(progress && pix_xpos < progress + IMG_WIDTH / 2 / SHRINK &&
                 pix_ypos >= V_DISP - offgress - IMG_HEIGHT / SHRINK && pix_ypos < V_DISP - offgress) 
                   begin
                       if (!chara[0] && pix_xpos < progress - IMG_WIDTH / 2 / SHRINK ||
                           chara[0] && pix_xpos > progress + IMG_WIDTH / 2 / SHRINK) begin
                            valid <= 1'b1;
                            pix_data <= 12'h0ff;//蓝条
                       end else begin
                            //0ff亦显示
                            valid <= 1'b1;//该图层有效数据
                            pix_data <= img_data[11:0];
                            img_addr <= (IMG_HEIGHT - (V_DISP - offgress - pix_ypos) * SHRINK) * IMG_WIDTH + 
                                        (pix_xpos + IMG_WIDTH / 2 / SHRINK - progress) * SHRINK;
                       end
                    end
               else begin
                    valid <= 1'b0;//该图层透明像素点
                    pix_data <= 12'hfff;
               end
          end else begin
              valid <= 1'b0;
              pix_data <= 12'h000;
          end
    end
    
    wire [15:0] img_chara1;
    wire [15:0] img_chara2;
    wire [15:0] img_chris1;
    wire [15:0] img_chris2;
    assign img_data = (!chara[0] ? 
                       (chara[1] ? img_chara2 : img_chara1) : 
                       (chara[1] ? img_chris2 : img_chris1));
    chara1_rom ROM1_inst (
          .clka(vga_clk),
          .addra(img_addr),
          .douta(img_chara1),
          .ena(disp_en && !chara), // 连接 ROM 输出数据到您的模块中
          .wea()
          );
    chara2_rom ROM2_inst (
          .clka(vga_clk),
          .addra(img_addr),
          .douta(img_chara2),
          .ena(disp_en && chara)  // 连接 ROM 输出数据到您的模块中
          );
    chris1_rom ROM3_inst (
          .clka(vga_clk),
          .addra(img_addr),
          .douta(img_chris1),
          .ena(disp_en && chara)  // 连接 ROM 输出数据到您的模块中
          );
    chris2_rom ROM4_inst (
          .clka(vga_clk),
          .addra(img_addr),
          .douta(img_chris2),
          .ena(disp_en && chara)  // 连接 ROM 输出数据到您的模块中
          );

endmodule*/
