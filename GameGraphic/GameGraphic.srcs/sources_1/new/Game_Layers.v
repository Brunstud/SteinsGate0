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
// Description: ��Ϸͼ��
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BG_layer(
    input  vga_clk,                 // VGA����ʱ��
    input  disp_en,                 // ��ʾ��Ч�ź�
    input  [11:0]  pix_xpos,        // ���ص������
    input  [11:0]  pix_ypos,        // ���ص�������
    output reg  valid,              // �õ��Ƿ�������
    output reg  [11:0]  pix_data    // ���ص�����
    );
    parameter  H_DISP   =  1024;   // ˮƽ���ص���
    parameter  V_DISP   =  600;    // ��ֱ���ص���
            
    always @(posedge vga_clk) begin
         if (disp_en) begin
              if(pix_xpos >= 0  && pix_xpos < H_DISP && pix_ypos >= 0  && pix_ypos < V_DISP) 
                   begin
                       valid <= 1'b1;//��ͼ����Ч����
                       pix_data <= 12'h0ff;
                    end
               else begin
                    valid <= 1'b0;//��ͼ��͸�����ص�
                    pix_data <= 12'hfff;
               end
          end else begin
              valid <= 1'b0;
              pix_data <= 12'h000;
          end
    end

endmodule

module Satellbg_layer(
    input  vga_clk,                 // VGA����ʱ��
    input  disp_en,                 // ��ʾ��Ч�ź�
    input  [9:0] progress,          // ������
    input  [11:0]  pix_xpos,        // ���ص������
    input  [11:0]  pix_ypos,        // ���ص�������
    output reg  valid,              // �õ��Ƿ�������
    output reg  [11:0]  pix_data    // ���ص�����
    );
    parameter  H_DISP   =  1024;   // ˮƽ���ص���
    parameter  V_DISP   =  600;    // ��ֱ���ص���
    parameter  IMG_WIDTH = 100;
    parameter  IMG_HEIGHT = 100;
    parameter  BASEY = 400;   // ������
    parameter  START_PRO = 341; // ����֮һ��
    parameter  END_PRO = 682;   // ����֮����
    parameter  TIMES = 4;   // �Ŵ�4��
    reg [12:0] img_addr;
    wire [15:0] img_data;
    wire [1:0] choice = progress / START_PRO;
    wire [9:0] basex = (START_PRO - progress % START_PRO) * 3;
    always @(posedge vga_clk) begin
         if (disp_en) begin
              img_addr <= 12'b0; //�ļ�ָ�����
              if(basex && pix_xpos >= basex - IMG_WIDTH / 2 * TIMES  && pix_xpos < basex + IMG_WIDTH / 2 * TIMES  &&
                 pix_ypos >= BASEY - IMG_HEIGHT * TIMES && pix_ypos < BASEY) 
                   begin
                       //building2��fffΪĬ��͸��������
                       //satellite��0ffΪĬ��͸��������
                       //building1��0f0ΪĬ��͸��������
                       if (choice == 2'b00 && img_data[11:8] >= 4'hd && img_data[7:4] >= 4'hd && img_data[3:0] >= 4'hd ||
                           choice == 2'b01 && img_data[11:8] <= 4'h2 && img_data[7:4] >= 4'hd && img_data[3:0] >= 4'hd ||
                           choice == 2'b10 && img_data[11:8] <= 4'h2 && img_data[7:4] >= 4'hd && img_data[3:0] <= 4'h2 ||
                           choice == 2'b11)
                           valid <= 1'b0;//��ͼ��͸�����ص�
                       else
                           valid <= 1'b1;//��ͼ����Ч����
                       pix_data <= img_data[11:0];
                       img_addr <= (IMG_HEIGHT - (BASEY - pix_ypos) / TIMES) * IMG_WIDTH + 
                                   (pix_xpos + IMG_WIDTH / 2 * TIMES - basex) / TIMES;//��ɫ����һ�� 
                    end
               else begin
                    valid <= 1'b0;//��ͼ��͸�����ص�
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
         .ena(disp_en) // ���� ROM ������ݵ�����ģ����
         );
    building1_rom ROM1_inst (
         .clka(vga_clk),
         .addra(img_addr),
         .douta(img_build1),
         .ena(disp_en) // ���� ROM ������ݵ�����ģ����
         );
    building2_rom ROM2_inst (
         .clka(vga_clk),
         .addra(img_addr),
         .douta(img_build2),
         .ena(disp_en) // ���� ROM ������ݵ�����ģ����
         );

endmodule

module Road_layer(
    input  vga_clk,                 // VGA����ʱ��
    input  disp_en,                 // ��ʾ��Ч�ź�
    input  forward,                 // ���ݽ�ɫ״̬ǰ��/����
    input  [3:0] speed,             // ǰ���ٶ�
    input  [11:0]  pix_xpos,        // ���ص������
    input  [11:0]  pix_ypos,        // ���ص�������
    output reg  valid,              // �õ��Ƿ�������
    output reg  [11:0]  pix_data    // ���ص�����
    );
    parameter  H_DISP   =  1024;   // ˮƽ���ص���
    parameter  V_DISP   =  600;    // ��ֱ���ص���
    parameter  IMG_WIDTH = 256;
    parameter  IMG_HEIGHT = 141;
    reg [15:0] img_addr;
    wire [15:0] img_data;
    //��·�ƶ�
    wire clk_50Hz;
    reg [7:0] counter = 0;
    divider_1M d1M(vga_clk, 1'b1, clk_50Hz);
    always @(posedge clk_50Hz) begin
        if (forward)
            counter <= counter - speed;//ʱ��˳��
        else
            counter <= counter + speed;//ʱ�����
    end
    //��ʾ��·
    always @(posedge vga_clk) begin
         if (disp_en) begin
              img_addr <= 12'b0; //�ļ�ָ�����
              if(pix_xpos >= 0  && pix_xpos < H_DISP  && pix_ypos >= V_DISP - IMG_HEIGHT * 2  && pix_ypos < V_DISP) 
                   begin
                       //fffΪĬ��͸��������
                       if (pix_ypos <= V_DISP - IMG_HEIGHT * 5 / 3 && img_data[11:8] >= 4'he &&  img_data[7:4] >= 4'he && img_data[3:0] >= 4'he)
                            valid <= 1'b0;//��ͼ��͸�����ص�
                       else
                            valid <= 1'b1;//��ͼ����Ч����
                       pix_data <= img_data[11:0];
                       img_addr <= (pix_ypos - V_DISP + IMG_HEIGHT * 2) / 2 * IMG_WIDTH + ((pix_xpos - counter) % IMG_WIDTH);//��ɫ����һ�� 
                    end
               else begin
                    valid <= 1'b0;//��ͼ��͸�����ص�
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
         .ena(disp_en), // ���� ROM ������ݵ�����ģ����
         .wea()
         );

endmodule

module Chara_layer(
    input  vga_clk,                 // VGA����ʱ��
    input  disp_en,                 // ��ʾ��Ч�ź�
    input  [3:0] chara,             // ѡ���ɫ
    input  [9:0] obstacle,          // ��һ����ɫ
    input  [3:0] obstimes,          // ��һ����ɫ��������
    input  [9:0] progress,          // ��Ϸ����
    input  [8:0] offgress,          // ƫ�ƽ���
    input  [11:0]  pix_xpos,        // ���ص������
    input  [11:0]  pix_ypos,        // ���ص�������
    output valid,              // �õ��Ƿ�������
    output [11:0]  pix_data    // ���ص�����
    );
    parameter  H_DISP   =  1024;   // ˮƽ���ص���
    parameter  V_DISP   =  600;    // ��ֱ���ص���
    parameter  IMG_WIDTH = 200;
    parameter  IMG_HEIGHT = 200;
    parameter  SHRINK   =  10;     // ������С���� 
    parameter  POSX = 512;         // ��ǰ��ɫ������
    parameter  POSY = 230;         // ��ǰ��ɫ������
    parameter  SHARP = 16;         // ������
    //��ȡͼƬ��Ϣ
    wire [15:0] img_addr [1:0];    // �ֱ��������ɫ�ĵ�ַ��0����̫�ɣ�1��������
    reg [15:0] ch_addr [1:0];      // �ֱ��������ɫ�ĵ�ַ��0����ǰ��ɫ��1����һ����ɫ������
    assign img_addr[0] = ch_addr[chara[0]];
    assign img_addr[1] = ch_addr[~chara[0]];
    wire [15:0] ch_data [1:0];     // �ֱ��������ɫ�����ݣ�0����ǰ��ɫ��1����һ����ɫ
    //�ڲ�ͼ�㣺0Ϊ��ǰ��ɫ��1Ϊ��һ����ɫ
    reg [1:0] chvalid;
    reg [11:0] ch_pix_data [1:0];
    assign valid = chvalid[1] || chvalid[0];
    assign pix_data = chvalid[0] ? ch_pix_data[0] :
                      chvalid[1] ? ch_pix_data[1] :
                      12'hfff;//Ĭ�ϰ�ɫ

    // ��ǰ��ɫͼ�㣨������������
    always @(posedge vga_clk) begin
         if (disp_en) begin
              ch_addr[0] <= 12'b0; //�ļ�ָ�����
              // ��ʾ������
              if(progress && 
                 (!chara[0] && pix_xpos < progress + IMG_WIDTH / 2 / SHRINK ||
                  chara[0] && pix_xpos > progress - IMG_WIDTH / 2 / SHRINK) &&
                  pix_ypos >= V_DISP - offgress - IMG_HEIGHT / SHRINK && pix_ypos < V_DISP - offgress) 
                   begin
                   if (!chara[0] && pix_xpos < progress - IMG_WIDTH / 2 / SHRINK ||
                       chara[0] && pix_xpos > progress + IMG_WIDTH / 2 / SHRINK) begin
                         chvalid[0] <= 1'b1;
                         ch_pix_data[0] <= 12'h0ff;//����
                   end else begin
                       //0ff����ʾ
                       chvalid[0] <= 1'b1;//��ͼ����Ч����
                       ch_pix_data[0] <= ch_data[0][11:0];
                       ch_addr[0] <= (IMG_HEIGHT - (V_DISP - offgress - pix_ypos) * SHRINK) * IMG_WIDTH + 
                                     (pix_xpos + IMG_WIDTH / 2 / SHRINK - progress) * SHRINK;
                   end
              end
              else begin
                  // ��ʾ��ǰ��ɫ
                  if(pix_xpos >= POSX - IMG_WIDTH / 2  && pix_xpos < POSX + IMG_WIDTH / 2  && pix_ypos >= POSY  && pix_ypos < POSY + IMG_HEIGHT)
                       begin
                           //0ffΪĬ��͸��������
                           if (ch_data[0][11:8] <= 4'h2 && ch_data[0][7:4] >= 4'hd && ch_data[0][3:0] >= 4'hd)
                               chvalid[0] <= 1'b0;//��ͼ��͸�����ص�
                           else
                               chvalid[0] <= 1'b1;//��ͼ����Ч����
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
    
    // ��һ����ɫͼ��
    always @(posedge vga_clk) begin
        if (disp_en) begin
            ch_addr[1] <= 12'b0; //�ļ�ָ�����
            // ��ʾ��һ����ɫ
            if (obstacle && obstimes &&
                pix_xpos >= obstacle - IMG_WIDTH / 2  && pix_xpos < obstacle + IMG_WIDTH / 2  && pix_ypos >= POSY  && pix_ypos < POSY + IMG_HEIGHT) 
                begin
                    //0ffΪĬ��͸��������
                    if (ch_data[1][11:8] <= 4'h2 && ch_data[1][7:4] >= 4'hd && ch_data[1][3:0] >= 4'hd ||
                        (pix_xpos + pix_ypos) % SHARP > obstimes)//ģ��Ч��
                        chvalid[1] <= 1'b0;//��ͼ��͸�����ص�
                    else
                        chvalid[1] <= 1'b1;//��ͼ����Ч����
                    ch_pix_data[1] <= ch_data[1][11:0];
                    ch_addr[1] <= (pix_ypos - POSY) * IMG_WIDTH + (pix_xpos - obstacle + IMG_WIDTH / 2); 
                end
            else begin
                // ͸�����ص�
                chvalid[1] <= 1'b0;//��ͼ��͸�����ص�
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
    //��ǰ��ɫ����
    assign ch_data[0] = (!chara[0] ? 
                         (chara[1] ? img_chara2 : img_chara1) : //��ǰ��ɫ״̬
                         (chara[1] ? img_chris2 : img_chris1)); //��ǰ��ɫ״̬
    //��һ����ɫ����
    assign ch_data[1] = (chara[0] ? 
                         (chara[2] ? img_chara2 : img_chara1) : //��һ��ɫ״̬
                         (chara[2] ? img_chris2 : img_chris1)); //��һ��ɫ״̬
    //ʵ����ROM
    chara1_rom ROM1_inst (
         .clka(vga_clk),
         .addra(img_addr[0]),
         .douta(img_chara1),
         .ena(disp_en), // ���� ROM ������ݵ�����ģ����
         .wea()
         );
    chara2_rom ROM2_inst (
         .clka(vga_clk),
         .addra(img_addr[0]),
         .douta(img_chara2),
         .ena(disp_en)  // ���� ROM ������ݵ�����ģ����
         );
    chris1_rom ROM3_inst (
         .clka(vga_clk),
         .addra(img_addr[1]),
         .douta(img_chris1),
         .ena(disp_en)  // ���� ROM ������ݵ�����ģ����
         );
    chris2_rom ROM4_inst (
         .clka(vga_clk),
         .addra(img_addr[1]),
         .douta(img_chris2),
         .ena(disp_en)  // ���� ROM ������ݵ�����ģ����
         );

endmodule

/*module Satellite_layer(
    input  vga_clk,                 // VGA����ʱ��
    input  disp_en,                 // ��ʾ��Ч�ź�
    input  [9:0]basex,                   // �ϰ���λ��
    input  [7:0]times,                   // �ϰ����С
    input  [11:0]  pix_xpos,        // ���ص������
    input  [11:0]  pix_ypos,        // ���ص�������
    output reg  valid,              // �õ��Ƿ�������
    output reg  [11:0]  pix_data    // ���ص�����
    );
    parameter  H_DISP   =  1024;   // ˮƽ���ص���
    parameter  V_DISP   =  600;    // ��ֱ���ص���
    parameter  IMG_WIDTH = 200;
    parameter  IMG_HEIGHT = 200;
    parameter  BASEX = 900;   // ������
    parameter  BASEY = 430;   // ������
    parameter  TIMES = 160;   // ����200
    reg [15:0] img_addr;
    wire [15:0] img_data;
            
    always @(posedge vga_clk) begin
         if (disp_en) begin
              img_addr <= 12'b0; //�ļ�ָ�����
              if(basex && pix_xpos >= basex - IMG_WIDTH / 2 * times / 200  && pix_xpos < basex + IMG_WIDTH / 2 * times / 200  &&
                 pix_ypos >= BASEY - IMG_HEIGHT * times / 200 + 1 && pix_ypos < BASEY) 
                   begin
                       //0ffΪĬ��͸��������
                       if (img_data[11:8] <= 4'h2 && img_data[7:4] >= 4'hd && img_data[3:0] >= 4'hd)
                           valid <= 1'b0;//��ͼ��͸�����ص�
                       else
                           valid <= 1'b1;//��ͼ����Ч����
                       pix_data <= img_data[11:0];
                       img_addr <= (IMG_HEIGHT - (BASEY - pix_ypos + 1) * 200 / times) * IMG_WIDTH + 
                                   (pix_xpos + IMG_WIDTH / 2 * times / 200 - basex) * 200 / times;//��ɫ����һ�� 
                    end
               else begin
                    valid <= 1'b0;//��ͼ��͸�����ص�
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
         .ena(disp_en) // ���� ROM ������ݵ�����ģ����
         );

endmodule*/

/*module Progress_layer(
    input  vga_clk,                 // VGA����ʱ��
    input  disp_en,                 // ��ʾ��Ч�ź�
    input  [1:0] chara,             // ��ǰ��ɫ
    input  [9:0] progress,          // ��Ϸ����
    input  [8:0] offgress,          // ƫ�ƽ���
    input  [11:0]  pix_xpos,        // ���ص������
    input  [11:0]  pix_ypos,        // ���ص�������
    output reg  valid,              // �õ��Ƿ�������
    output reg  [11:0]  pix_data    // ���ص�����
    );
    parameter  H_DISP   =  1024;   // ˮƽ���ص���
    parameter  V_DISP   =  600;    // ��ֱ���ص���
    parameter  IMG_WIDTH = 200;
    parameter  IMG_HEIGHT = 200;
    parameter  SHRINK   =  10;     // ������С���� 
    reg [15:0] img_addr;
    wire [15:0] img_data;
            
    always @(posedge vga_clk) begin
         if (disp_en) begin
              img_addr <= 12'b0; //�ļ�ָ�����
              if(progress && pix_xpos < progress + IMG_WIDTH / 2 / SHRINK &&
                 pix_ypos >= V_DISP - offgress - IMG_HEIGHT / SHRINK && pix_ypos < V_DISP - offgress) 
                   begin
                       if (!chara[0] && pix_xpos < progress - IMG_WIDTH / 2 / SHRINK ||
                           chara[0] && pix_xpos > progress + IMG_WIDTH / 2 / SHRINK) begin
                            valid <= 1'b1;
                            pix_data <= 12'h0ff;//����
                       end else begin
                            //0ff����ʾ
                            valid <= 1'b1;//��ͼ����Ч����
                            pix_data <= img_data[11:0];
                            img_addr <= (IMG_HEIGHT - (V_DISP - offgress - pix_ypos) * SHRINK) * IMG_WIDTH + 
                                        (pix_xpos + IMG_WIDTH / 2 / SHRINK - progress) * SHRINK;
                       end
                    end
               else begin
                    valid <= 1'b0;//��ͼ��͸�����ص�
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
          .ena(disp_en && !chara), // ���� ROM ������ݵ�����ģ����
          .wea()
          );
    chara2_rom ROM2_inst (
          .clka(vga_clk),
          .addra(img_addr),
          .douta(img_chara2),
          .ena(disp_en && chara)  // ���� ROM ������ݵ�����ģ����
          );
    chris1_rom ROM3_inst (
          .clka(vga_clk),
          .addra(img_addr),
          .douta(img_chris1),
          .ena(disp_en && chara)  // ���� ROM ������ݵ�����ģ����
          );
    chris2_rom ROM4_inst (
          .clka(vga_clk),
          .addra(img_addr),
          .douta(img_chris2),
          .ena(disp_en && chara)  // ���� ROM ������ݵ�����ģ����
          );

endmodule*/
