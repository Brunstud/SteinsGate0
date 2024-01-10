// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Jan 10 20:41:17 2024
// Host        : LAPTOP-AB75201K running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/satellite1_rom/satellite1_rom_sim_netlist.v
// Design      : satellite1_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "satellite1_rom,blk_mem_gen_v8_3_3,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_3_3,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module satellite1_rom
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [13:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [13:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [13:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [13:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "14" *) 
  (* C_ADDRB_WIDTH = "14" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "7" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.264701 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "satellite1_rom.mem" *) 
  (* C_INIT_FILE_NAME = "satellite1_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16384" *) 
  (* C_READ_DEPTH_B = "16384" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "16384" *) 
  (* C_WRITE_DEPTH_B = "16384" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  satellite1_rom_blk_mem_gen_v8_3_3 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[13:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[13:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* ORIG_REF_NAME = "bindec" *) 
module satellite1_rom_bindec
   (ena_array,
    ena,
    addra);
  output [2:0]ena_array;
  input ena;
  input [1:0]addra;

  wire [1:0]addra;
  wire ena;
  wire [2:0]ena_array;

  LUT3 #(
    .INIT(8'h02)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1 
       (.I0(ena),
        .I1(addra[0]),
        .I2(addra[1]),
        .O(ena_array[0]));
  LUT3 #(
    .INIT(8'h40)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__0 
       (.I0(addra[1]),
        .I1(addra[0]),
        .I2(ena),
        .O(ena_array[1]));
  LUT3 #(
    .INIT(8'h40)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__1 
       (.I0(addra[0]),
        .I1(ena),
        .I2(addra[1]),
        .O(ena_array[2]));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module satellite1_rom_blk_mem_gen_generic_cstr
   (douta,
    addra,
    ena,
    clka);
  output [15:0]douta;
  input [13:0]addra;
  input ena;
  input clka;

  wire [13:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire [2:0]ena_array;
  wire \ramloop[4].ram.r_n_0 ;
  wire \ramloop[4].ram.r_n_1 ;
  wire \ramloop[4].ram.r_n_2 ;
  wire \ramloop[4].ram.r_n_3 ;
  wire \ramloop[4].ram.r_n_4 ;
  wire \ramloop[4].ram.r_n_5 ;
  wire \ramloop[4].ram.r_n_6 ;
  wire \ramloop[4].ram.r_n_7 ;
  wire \ramloop[4].ram.r_n_8 ;
  wire \ramloop[5].ram.r_n_0 ;
  wire \ramloop[5].ram.r_n_1 ;
  wire \ramloop[5].ram.r_n_2 ;
  wire \ramloop[5].ram.r_n_3 ;
  wire \ramloop[5].ram.r_n_4 ;
  wire \ramloop[5].ram.r_n_5 ;
  wire \ramloop[5].ram.r_n_6 ;
  wire \ramloop[5].ram.r_n_7 ;
  wire \ramloop[5].ram.r_n_8 ;
  wire \ramloop[6].ram.r_n_0 ;
  wire \ramloop[6].ram.r_n_1 ;
  wire \ramloop[6].ram.r_n_2 ;
  wire \ramloop[6].ram.r_n_3 ;
  wire \ramloop[6].ram.r_n_4 ;
  wire \ramloop[6].ram.r_n_5 ;
  wire \ramloop[6].ram.r_n_6 ;
  wire \ramloop[6].ram.r_n_7 ;
  wire \ramloop[6].ram.r_n_8 ;
  wire \ramloop[7].ram.r_n_0 ;
  wire \ramloop[7].ram.r_n_1 ;
  wire \ramloop[7].ram.r_n_2 ;
  wire \ramloop[7].ram.r_n_3 ;
  wire \ramloop[7].ram.r_n_4 ;
  wire \ramloop[7].ram.r_n_5 ;
  wire \ramloop[7].ram.r_n_6 ;
  wire \ramloop[7].ram.r_n_7 ;
  wire \ramloop[7].ram.r_n_8 ;

  satellite1_rom_bindec \bindec_a.bindec_inst_a 
       (.addra(addra[13:12]),
        .ena(ena),
        .ena_array(ena_array));
  satellite1_rom_blk_mem_gen_mux \has_mux_a.A 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 (\ramloop[5].ram.r_n_8 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 (\ramloop[6].ram.r_n_8 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 (\ramloop[4].ram.r_n_8 ),
        .DOADO({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .DOPADOP(\ramloop[7].ram.r_n_8 ),
        .addra(addra[13:12]),
        .clka(clka),
        .douta(douta[15:7]),
        .ena(ena));
  satellite1_rom_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta[0]),
        .ena(ena));
  satellite1_rom_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta[2:1]),
        .ena(ena));
  satellite1_rom_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta[4:3]),
        .ena(ena));
  satellite1_rom_blk_mem_gen_prim_width__parameterized2 \ramloop[3].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta[6:5]),
        .ena(ena));
  satellite1_rom_blk_mem_gen_prim_width__parameterized3 \ramloop[4].ram.r 
       (.addra(addra[11:0]),
        .clka(clka),
        .\douta[14] ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .\douta[15] (\ramloop[4].ram.r_n_8 ),
        .ena(ena),
        .ena_array(ena_array[0]));
  satellite1_rom_blk_mem_gen_prim_width__parameterized4 \ramloop[5].ram.r 
       (.addra(addra[11:0]),
        .clka(clka),
        .\douta[14] ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .\douta[15] (\ramloop[5].ram.r_n_8 ),
        .ena(ena),
        .ena_array(ena_array[1]));
  satellite1_rom_blk_mem_gen_prim_width__parameterized5 \ramloop[6].ram.r 
       (.addra(addra[11:0]),
        .clka(clka),
        .\douta[14] ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .\douta[15] (\ramloop[6].ram.r_n_8 ),
        .ena(ena),
        .ena_array(ena_array[2]));
  satellite1_rom_blk_mem_gen_prim_width__parameterized6 \ramloop[7].ram.r 
       (.DOADO({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .DOPADOP(\ramloop[7].ram.r_n_8 ),
        .addra(addra),
        .clka(clka),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_mux" *) 
module satellite1_rom_blk_mem_gen_mux
   (douta,
    ena,
    addra,
    clka,
    DOADO,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    DOPADOP,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 );
  output [8:0]douta;
  input ena;
  input [1:0]addra;
  input clka;
  input [7:0]DOADO;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input [0:0]DOPADOP;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 ;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 ;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 ;
  wire [7:0]DOADO;
  wire [0:0]DOPADOP;
  wire [1:0]addra;
  wire clka;
  wire [8:0]douta;
  wire ena;
  wire [1:0]sel_pipe;
  wire [1:0]sel_pipe_d1;

  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \douta[10]_INST_0 
       (.I0(DOADO[3]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [3]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [3]),
        .I3(sel_pipe_d1[1]),
        .I4(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [3]),
        .I5(sel_pipe_d1[0]),
        .O(douta[3]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \douta[11]_INST_0 
       (.I0(DOADO[4]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [4]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [4]),
        .I3(sel_pipe_d1[1]),
        .I4(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [4]),
        .I5(sel_pipe_d1[0]),
        .O(douta[4]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \douta[12]_INST_0 
       (.I0(DOADO[5]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [5]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [5]),
        .I3(sel_pipe_d1[1]),
        .I4(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [5]),
        .I5(sel_pipe_d1[0]),
        .O(douta[5]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \douta[13]_INST_0 
       (.I0(DOADO[6]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [6]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [6]),
        .I3(sel_pipe_d1[1]),
        .I4(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [6]),
        .I5(sel_pipe_d1[0]),
        .O(douta[6]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \douta[14]_INST_0 
       (.I0(DOADO[7]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [7]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [7]),
        .I3(sel_pipe_d1[1]),
        .I4(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [7]),
        .I5(sel_pipe_d1[0]),
        .O(douta[7]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \douta[15]_INST_0 
       (.I0(DOPADOP),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_3 ),
        .I3(sel_pipe_d1[1]),
        .I4(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_4 ),
        .I5(sel_pipe_d1[0]),
        .O(douta[8]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \douta[7]_INST_0 
       (.I0(DOADO[0]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [0]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [0]),
        .I3(sel_pipe_d1[1]),
        .I4(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [0]),
        .I5(sel_pipe_d1[0]),
        .O(douta[0]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \douta[8]_INST_0 
       (.I0(DOADO[1]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [1]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [1]),
        .I3(sel_pipe_d1[1]),
        .I4(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [1]),
        .I5(sel_pipe_d1[0]),
        .O(douta[1]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \douta[9]_INST_0 
       (.I0(DOADO[2]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram [2]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 [2]),
        .I3(sel_pipe_d1[1]),
        .I4(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 [2]),
        .I5(sel_pipe_d1[0]),
        .O(douta[2]));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_norm_sel2.has_mem_regs.WITHOUT_ECC_PIPE.ce_pri.sel_pipe_d1_reg[0] 
       (.C(clka),
        .CE(ena),
        .D(sel_pipe[0]),
        .Q(sel_pipe_d1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_norm_sel2.has_mem_regs.WITHOUT_ECC_PIPE.ce_pri.sel_pipe_d1_reg[1] 
       (.C(clka),
        .CE(ena),
        .D(sel_pipe[1]),
        .Q(sel_pipe_d1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] 
       (.C(clka),
        .CE(ena),
        .D(addra[0]),
        .Q(sel_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[1] 
       (.C(clka),
        .CE(ena),
        .D(addra[1]),
        .Q(sel_pipe[1]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module satellite1_rom_blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra);
  output [0:0]douta;
  input clka;
  input ena;
  input [13:0]addra;

  wire [13:0]addra;
  wire clka;
  wire [0:0]douta;
  wire ena;

  satellite1_rom_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module satellite1_rom_blk_mem_gen_prim_width__parameterized0
   (douta,
    clka,
    ena,
    addra);
  output [1:0]douta;
  input clka;
  input ena;
  input [13:0]addra;

  wire [13:0]addra;
  wire clka;
  wire [1:0]douta;
  wire ena;

  satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized0 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module satellite1_rom_blk_mem_gen_prim_width__parameterized1
   (douta,
    clka,
    ena,
    addra);
  output [1:0]douta;
  input clka;
  input ena;
  input [13:0]addra;

  wire [13:0]addra;
  wire clka;
  wire [1:0]douta;
  wire ena;

  satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized1 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module satellite1_rom_blk_mem_gen_prim_width__parameterized2
   (douta,
    clka,
    ena,
    addra);
  output [1:0]douta;
  input clka;
  input ena;
  input [13:0]addra;

  wire [13:0]addra;
  wire clka;
  wire [1:0]douta;
  wire ena;

  satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized2 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module satellite1_rom_blk_mem_gen_prim_width__parameterized3
   (\douta[14] ,
    \douta[15] ,
    clka,
    ena_array,
    ena,
    addra);
  output [7:0]\douta[14] ;
  output [0:0]\douta[15] ;
  input clka;
  input [0:0]ena_array;
  input ena;
  input [11:0]addra;

  wire [11:0]addra;
  wire clka;
  wire [7:0]\douta[14] ;
  wire [0:0]\douta[15] ;
  wire ena;
  wire [0:0]ena_array;

  satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized3 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .\douta[14] (\douta[14] ),
        .\douta[15] (\douta[15] ),
        .ena(ena),
        .ena_array(ena_array));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module satellite1_rom_blk_mem_gen_prim_width__parameterized4
   (\douta[14] ,
    \douta[15] ,
    clka,
    ena_array,
    ena,
    addra);
  output [7:0]\douta[14] ;
  output [0:0]\douta[15] ;
  input clka;
  input [0:0]ena_array;
  input ena;
  input [11:0]addra;

  wire [11:0]addra;
  wire clka;
  wire [7:0]\douta[14] ;
  wire [0:0]\douta[15] ;
  wire ena;
  wire [0:0]ena_array;

  satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized4 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .\douta[14] (\douta[14] ),
        .\douta[15] (\douta[15] ),
        .ena(ena),
        .ena_array(ena_array));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module satellite1_rom_blk_mem_gen_prim_width__parameterized5
   (\douta[14] ,
    \douta[15] ,
    clka,
    ena_array,
    ena,
    addra);
  output [7:0]\douta[14] ;
  output [0:0]\douta[15] ;
  input clka;
  input [0:0]ena_array;
  input ena;
  input [11:0]addra;

  wire [11:0]addra;
  wire clka;
  wire [7:0]\douta[14] ;
  wire [0:0]\douta[15] ;
  wire ena;
  wire [0:0]ena_array;

  satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized5 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .\douta[14] (\douta[14] ),
        .\douta[15] (\douta[15] ),
        .ena(ena),
        .ena_array(ena_array));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module satellite1_rom_blk_mem_gen_prim_width__parameterized6
   (DOADO,
    DOPADOP,
    clka,
    ena,
    addra);
  output [7:0]DOADO;
  output [0:0]DOPADOP;
  input clka;
  input ena;
  input [13:0]addra;

  wire [7:0]DOADO;
  wire [0:0]DOPADOP;
  wire [13:0]addra;
  wire clka;
  wire ena;

  satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized6 \prim_init.ram 
       (.DOADO(DOADO),
        .DOPADOP(DOPADOP),
        .addra(addra),
        .clka(clka),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module satellite1_rom_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra);
  output [0:0]douta;
  input clka;
  input ena;
  input [13:0]addra;

  wire [13:0]addra;
  wire clka;
  wire [0:0]douta;
  wire ena;
  wire [15:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_01(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_02(256'hFFDFFFF74F7FFDFFFFFFFFFFFFFE7FFFF9F9FF9FFFFFFFFFFFFFFFFFFFFFDFFF),
    .INIT_03(256'hCDFFFFFFFFFFFFFFCFFFFF1A7737FFFFFFFFFFFFFDFFFF5AA19E7FFFFFFFFFFF),
    .INIT_04(256'hFFFFF9FFFE7DB1775DFFFFFFFFFFFFB7FFFFE90D8B7FFFFFFFFFFFFF7FFF6295),
    .INIT_05(256'h14690BEFFFFFFFFFFFFFFFF60D94A1ACBFFFFFFFFFFF8FFFF54C9882E7FFFFFF),
    .INIT_06(256'hFFFFFFFF3FFFA763F180A3FFFFFFFFFFFBFFC8579C1034BFFFFFFFFFFF5FFEFA),
    .INIT_07(256'h20E6614CBEADFFFFFFFFFE4E3956F85E2EE9EFFFFFFFFFEAFFC7F958E929DFFF),
    .INIT_08(256'h7FFFFFFFFFFBFF40DE8AEED823FFFFFFFFFC7F77B5E58E4B09BFFFFFFFFFE1F7),
    .INIT_09(256'h4FECC548461642FFFFFFFFFFC8FC9A272EC274B1FFFFFFFFFC7FC786A439E98A),
    .INIT_0A(256'h8ACFFFFFDFFFF8A7B87FB9A6E28EBFFFFFFFFFB47F00E730A7300BFFFFFFFFFE),
    .INIT_0B(256'hFCCFA40BDB63E0CE17FFFFC7FFFF54400ED8CC86BB7FFFFC7FFFF2D0163FB6E9),
    .INIT_0C(256'h68ACF67FFFFFFFFF1AF45026F06E6D23FFFFFFFFF49C8B96D9BE1C813FFFFFFF),
    .INIT_0D(256'hFFFFA6F91583EFEEB6D43FFFFFFFF9E7089CAF2A932483FFFFFFFFA06A8B4853),
    .INIT_0E(256'h001F2A76BFFFFF99FF8BC30E23753828297FFFFFFFFE9E24601FF52113A3FFFF),
    .INIT_0F(256'hFFFD0FF75430962008B54F47FFFFCD7F19BCD0381680C5647FFFF9EFF5FAB367),
    .INIT_10(256'h39540A888FE3FFFFF61FF425F728B8275F90BFFFFFD79F064DE6A8FD3CBA48FF),
    .INIT_11(256'h7FFFE64C903A714EF908B8B36DFFFFEE0ACE4C0C1B45353C66FFFFFDBE2FAEA0),
    .INIT_12(256'hC16A451CC21FB77FFFD8E1380889598E7047FA1FFFFCE047D20A0F8A6708BC25),
    .INIT_13(256'h991FFF5A2B2299DF82AD72140389FFFDD0452806505DB293C5E7CFFFF742F701),
    .INIT_14(256'h5CC58C1F5D4A02333FFF082180E629C6DA78403823FFFFC0296EBD829B46C2D1),
    .INIT_15(256'h1297EFFFFE28BA8364797B76AC5AF2FFFFCDB8FC5D03B3CEB91CC3DFFFF8C22D),
    .INIT_16(256'h4336CA1C40A33ECF193FFFFF3CA9613AD2FE18F35D4BFFFFFDB96A91DBA75C8A),
    .INIT_17(256'h30E65DDFFFFFFE5D30B27F1F50D2A0FEBFFFFFE00C00432950E47A8B37FFFFF9),
    .INIT_18(256'hF9FC4D8BB3DB24E4DCF8FFFFFFFF5C25B82B70F10425FFFFFFFFEEB399E47601),
    .INIT_19(256'h5E464179F9F5FFFFFD52E74B837A2288BE9FEFFFDFC624722CB780C4DEF7FFFF),
    .INIT_1A(256'hB7FFFE5BE5898228E36008FFEA7FFFEDF31877D0C6733C9F9B1FFFFFEE62B4A9),
    .INIT_1B(256'h505244D4C78DE1FFFFFEF5576E13CE57D6101FCFFFFFF6B1CF8916C27E4BF9FC),
    .INIT_1C(256'h87FFFFFEE4F4E054187FA65965FFFFFFFCDDBA160240AE3046FFFFFFFFE7C003),
    .INIT_1D(256'h80009706897B0163FFF3F4E70A698500584DA8734FFFFFD6E79F1B3440D44609),
    .INIT_1E(256'hB0A734D7FF8ABAB510109345CE34031E7FF22293C218601BA5F6221DFF3F425B),
    .INIT_1F(256'h58FC8DB889AAE74489997FFFF988C982BEB5E4330E9CB4FFFD6C5844C32A3922),
    .INIT_20(256'h311BB08AE0FFEBDFC0F0D03683AEBDDE433FFFFFC1666BF0893D94AFB18FFFFF),
    .INIT_21(256'hFFADDCC146A06677C98B96B1FFFC9D36C6A6E293B4CED03DCFFE7EF78BE14BD2),
    .INIT_22(256'h34A70D09F87B036FCF14F1D0A0C170D4E4B3FF5FF8F4AB2AA0960B3EC6C01776),
    .INIT_23(256'h960FF004986D00583C9D72FF88043F7D7D90E44E40AB20C17EDC74F311DB15F0),
    .INIT_24(256'hFF27603163739EFFFFF80B13C71C29B2326DE9117FFFEF4562BAA43E51D5015A),
    .INIT_25(256'hFBFFFFFFFFFF18A3EF9187C8FE7FFFFFFFF5FBFF9F6339CFAFF207FFFF9E29E0),
    .INIT_26(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1AAE7F),
    .INIT_27(256'h000000000000000000000000000000000000000000000000000000000000FFFF),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:1],douta}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .REGCEAREGCE(ena),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized0
   (douta,
    clka,
    ena,
    addra);
  output [1:0]douta;
  input clka;
  input ena;
  input [13:0]addra;

  wire [13:0]addra;
  wire clka;
  wire [1:0]douta;
  wire ena;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_01(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_02(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_03(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_04(256'hFFD6FE0BFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBFFFFFFFFFFFFF0FFFFFFF),
    .INIT_05(256'hFFFFFFBFFFFFFFEF81FE1FFFFF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFC7FFFFFFF),
    .INIT_06(256'hFFFFFFFFFFFFFFFFFFFBFFFFFFFF9F83FC7AFFFF2FFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_07(256'hC76FBFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFFFFF0D003C8FABBD7FFFFFFFFF),
    .INIT_08(256'hFFFFFFC661FE0BF5BBC6FFFFFFFFFFFFFFFFFFFFFFFFFFF2FFFFFFFFF907DFB2),
    .INIT_09(256'hFFFFFFFFFFF3BFFFFFFF9B72AB0056401087FFFFFFFFFFFFFFFFFFFFFFFFF2FF),
    .INIT_0A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFE669F7A70E7900C2D0FFFFFFFFFFFFFF),
    .INIT_0B(256'hCBAC0FC8009FE58FFFFFFFFFFFFFFFFFFFFFFFEBFFFFFF15D98BBB0FD800972C),
    .INIT_0C(256'hFF9BFFFFFB11B9CBFB352800E4D27FFFFFFFFFFFFFFFFFFFFFFFDFFFFFFD7D7A),
    .INIT_0D(256'hFFFFFFFFFFFFFFFF85FFFFD2EA05C0FA04AB0025142BFFFFFFFFFFFFFFFFFFFF),
    .INIT_0E(256'h3CF90643FEFFFFFFFFFFFFFFFFFFFF5AFFFFC31D2A661DDABE03352A4BFFFFFF),
    .INIT_0F(256'h18573E8EEB05727FFE0007F6FFFFFFFFFFFFFFFFFFFD1AFFBFC688BA7EFEC7F0),
    .INIT_10(256'hFFFFFFFE7FFFEE1C0EF921EF2BDF63FA9561CEFFFFFFFFFFFFFFFFFFFF0AFF5D),
    .INIT_11(256'h4FFFFFFFFFFFFFFFFFFFFA7FFFFD4D239190F7F1BB88EE6AA34FFFFFFFFFFFFF),
    .INIT_12(256'h9FB34E40A09A644FFFFFFFFFFFFFFFFFFFFB7FFFFF147FA4DC3DE92FA2EB9A64),
    .INIT_13(256'h42FFFD60BB1BC01EAF1958091AA4BFFFFFFFFFFFFFFFFFFFF66BFFFD24B8BE94),
    .INIT_14(256'hFFFFFFFFFFFFFF42BFFAC0807C0976AE8387E16AA4AFFFFFFFFFFFFFFFFFFFFF),
    .INIT_15(256'h5ED16D3FFFFFFFFFFFFFFFFFFFEC0137D2007253599EAB12D2A81509AFFFFFFF),
    .INIT_16(256'h351539931311DC472BB93FFFFFFFFFF9FFFFFFFE98CB3B4A081143FA43E54448),
    .INIT_17(256'hFFFC0B67F7E0B5804E6C66810464E8DBB9BFFFFFFFFFFEFFFFFFFC50875E7815),
    .INIT_18(256'hFFFFFFFFFFFFFFFFFB866A6285DED55B6F9D8441272BEFB92FFFFFFFFFFFFFFF),
    .INIT_19(256'h53D0034BAAA53FFFFFFFFFFFFFFFFFFB9505591E59456AD154B94009BF9EB91F),
    .INIT_1A(256'h9ABBA7D07B6A9104B00FF55A5A3FFFFFFFFFFFFFFFFFF7A1AA697B79607EAA74),
    .INIT_1B(256'hFFFFFFFFE792FF47BA84406EAAA405E40EFF59090FFFFFFFFFFFFFFFFFF7E8BC),
    .INIT_1C(256'hBEB50FFFFFFFFFFFFFFFFFD3D0FD1BBAC2001AAA68356ACEFFBE511FFFFFFFFF),
    .INIT_1D(256'h11EBA98C01B6FEBEB51FFFFFFFFFFFF6FFFFD032F802BEBC0602EADAED0BABFF),
    .INIT_1E(256'h3407E85E9ED072406EEA78301AADFEA57FFFFFFFFFF2D0BFFFB41BF8A1ADB014),
    .INIT_1F(256'hFFFFFFF6952FFFB48F02F4684984B82D0B4B6D05AAA9A8FFFFFFFFFFF413BFFF),
    .INIT_20(256'h12F4145502FFFFFFFFFFE1F11FFF693E1C3FA51AD17931AD11C81016A961FFFF),
    .INIT_21(256'h29BDAB4F403156A6C114019FFFFFFFFFFF84CC47FF583E21EC588686FF916854),
    .INIT_22(256'h14E0BDD153FAB94A6E644200D14AC06EFEAA9FFFFFFFFFFD221352FEAABCF19F),
    .INIT_23(256'h8BFFFFFFFF85F945C47C67A52EA8865B5A0853415A4515FEFE0BFFFFFFFFE171),
    .INIT_24(256'h40000D5555525507FFFFFFFD132165252B467138B2269BA6A180001A15555554),
    .INIT_25(256'h914C9BE4F9AE45064038695555541FFFFFFFE448475CAD2B442857798966B982),
    .INIT_26(256'h1614C539935133D59BB892C62910199064055654547FFFFFFF85F7115EDF9270),
    .INIT_27(256'h018806FFFFFFE44151F4E6D0C4DBF963C19B5E885516594000546151FFFFFFFD),
    .INIT_28(256'h13D9605559690504225BFFFFFF75E5954E9E43D950F0710E7ADA669815660401),
    .INIT_29(256'h4C9D619B814D4448B4059551A4241C86FFFFFFFFC3ED757B5164DD0437D0AA5C),
    .INIT_2A(256'hFFFFFB045E97C09EA8D05C051249611910695540502D1BFFFFFFFFF8465DAC07),
    .INIT_2B(256'h69551095BFFFFFFFFFFDD1CE5080F9AAE029458BB7C46D85165541407D6FFFFF),
    .INIT_2C(256'h8BAC17A092A90055540740BFFFFFFFFFFFF4E1D020A268F2DE57A96D95E4E151),
    .INIT_2D(256'h1160371AA15707617811E656AA4005000FC42FFFFFFFFFFFFE79403E9AB59305),
    .INIT_2E(256'hBFFFFFFFFFFFF34758AF2561ED0224F0074AEAAAA910011C182FFFFFFFFFFFE5),
    .INIT_2F(256'hA5A6A69A18BF9BFFFFFFFFFFFFFCC08BC1E2E07404970150C39AA9AAA643FD2B),
    .INIT_30(256'h83D3CB189D418DBD5A9A646D9F9FFFFFFFFFFFFFFFB0FD0FA2F428161A13D027),
    .INIT_31(256'hFFFFFFCBB922506709A93814074A5B9A595475C03FFFFFFFFFFFFFFFA3E58C01),
    .INIT_32(256'hF5FFFFFFF1FFFFFFEBFFFD0D5E305A04A7C041542906AAAAA2F5F8FFFFFFFFFF),
    .INIT_33(256'h86C390000A002FF9FFD7FF62FFFFFFFFFFFEF3C72B0D0522406C4CA40016AA4B),
    .INIT_34(256'h1FE369568A2DC2404290006800FAF9FFFFF257FFFFFFFFFFFE7CD75619154B00),
    .INIT_35(256'hC1FFFFFFFFFBFEFA03854E5DB398020AAA50A0128AFA1FFF91BBFFFFFFFFFBFF),
    .INIT_36(256'hAE8E17FBCFFD716FFFFFFFFFFFFDB961451F96A11609296BE59151A76A1FFF8F),
    .INIT_37(256'hCA809C4390001955080CB3FFFD2FFFFFFFFFFFFBFEB0A140172CD081D1A405AA),
    .INIT_38(256'hFF8597FFDC6055394241C28010640001A550BFFFFFFFFFFFFFFFE03FF697D454),
    .INIT_39(256'h552FFFFFFFFFFFFE1AA24854C015446500CA9001A0000AAA908BFFFFFFFFFFFF),
    .INIT_3A(256'h5AAA9A4AA1AAAA9731BFFFFFFFFFF8AB6C1F9030041150086ABE468041AAAA95),
    .INIT_3B(256'h61C541C06033A0016AA96A5D2FA9A253AFFFFFFFFFD2B6EB0FA95900608491E4),
    .INIT_3C(256'hFFFFFFD7447EB1EF134101470E80406000A99CFD4B65553FFFFFFFFFBAE0FAC7),
    .INIT_3D(256'h8D67D5405D4BFDFFFFFFF6DFDF7C2904541200CA4001D00197B35F555554C7FF),
    .INIT_3E(256'h1C956A9A051E5F74F5ED152553FFFFFFFFFC4794DF02D8740C0726A506400793),
    .INIT_3F(256'hC67F4C2718C90CA36A556AB9657DE2D931174152FFFFFFFFFE117D38C4F13903),
    .INIT_40(256'h00AFBFFFFFFFFFE09F5600043043FDAAA5A551996BCA6100480013FFFFFFFFFF),
    .INIT_41(256'h09BECC7510520000FFBFFFFFFF7FF825A4917A12DC0AA59B40026BAF2D4404D0),
    .INIT_42(256'hA50D0B59B6A01426A63594412400279FFFFFFFFF0FFE09E91649080226696C00),
    .INIT_43(256'hFFFFF6FEE3AE14EF021302EA92A59E84D7511455003DAFFFFAFFFFC2FF82BE40),
    .INIT_44(256'hD0190F41F9F84BFFFFFAFEFDE1A400C90D4305869676634A75491A4AE0BFFFF6),
    .INIT_45(256'h14860497F859D200056D57DE88BFFFFFFB9F6776A64322C50D021405134E19C5),
    .INIT_46(256'hC4B26254DE240003CA1D55216635405651970F56FFB7FFFFCC48816853C8941C),
    .INIT_47(256'h01E25BFFFFFFFC5BE5BD57E26802DE3801FFD4B78591841A5514018BEBFFAFC1),
    .INIT_48(256'h12840105416B05545FFFFFFFFF42941D4CA97E4B16F256657617954555C45810),
    .INIT_49(256'hAAA0E7731457C50EC00155F6AFF2FF5FFFFFFFFFFBE7ABD3E2A027B20B581946),
    .INIT_4A(256'hFFFFFF97FFF7D7F7B1FF3C7F7EAFE1FAF3FFFEBBFAFFFFFFFFFFFFFB4FF6AE96),
    .INIT_4B(256'hFFFFFFFFFFFFFFFFFFFFFFFFA7D7F5BFFFFF3C9FA9FFF88FFFFE7EFFFFFFFFFF),
    .INIT_4C(256'hFFFFFF69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFFFFFFFFFFFE3CFF27DFFAFFF),
    .INIT_4D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_4E(256'h00000000000000000000000000000000000000000000000000000000FFFFFFFF),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:2],douta}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(ena),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized1
   (douta,
    clka,
    ena,
    addra);
  output [1:0]douta;
  input clka;
  input ena;
  input [13:0]addra;

  wire [13:0]addra;
  wire clka;
  wire [1:0]douta;
  wire ena;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_01(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_02(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_03(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_04(256'hFFFFFD87FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57FFFFFF),
    .INIT_05(256'hFFFFF6FFFFFFFF7FE1FC3FFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFD7FFFFFFF),
    .INIT_06(256'hFFFFFFFFFFFFFFFFFFF4FFFFFFFF4709D097D7FD7FFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_07(256'hBE22FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFFFFFFFCD03C9A02A5FFFFFFFFFFF),
    .INIT_08(256'hFFFFFFD087F759F6089F7FFFFFFFFFFFFFFFFFFFFFFFFFFC7FFFFFFF7E003FA4),
    .INIT_09(256'hFFFFFFFFFFDCFFFFFFFD0EAF5C777A57E1D7FFFFFFFFFFFFFFFFFFFFFFFFD47F),
    .INIT_0A(256'h1FFFFFFFFFFFFFFFFFFFFFFFD2FFFFFF7E340D54FF63FFAF357FFFFFFFFFFFFF),
    .INIT_0B(256'h177D5FF1D78BFD3FFFFFFFFFFFFFFFFFFFFFFF70FFFFFDE0B0BF567FFBD72DFD),
    .INIT_0C(256'hFF70FFFFF67472BFD4CFEBFF23FE8FFFFFFFFFFFFFFFFFFFFFFF58FFFFFDA250),
    .INIT_0D(256'hFFFFFFFFFFFFFFFFF1FFFFD828D0BD005FF2F5C2780FFFFFFFFFFFFFFFFFFFFF),
    .INIT_0E(256'h41822A07FDFFFFFFFFFFFFFFFFFFFDF3FFFFCA0AF888F59FF2F4680027FFFFFF),
    .INIT_0F(256'h0BE2781BDFFDCE88AA0829F6FFFFFFFFFFFFFFFFFFFDD1FD5F8A12780BFF3FFE),
    .INIT_10(256'hFFFFFFF4C1FF7E8302B68FFFCC3D048A2883DBFFFFFFFFFFFFFFFFFFFCFBFFFD),
    .INIT_11(256'h3FFFFFFFFFFFFFFFFFFFFC63FFFD2A063E2FFE0FF7E9A0A0085FFFFFFFFFFFFF),
    .INIT_12(256'hBFF45DBE80008857FFFFFFFFFFFFFFFFFFFEC3FFF6AA2A0D8149F17F68820088),
    .INIT_13(256'hE9FFFDA08A67A3DD76D2D50822887FFFFFFFFFFFFFFFFFFFDE61FFF60A81AFAB),
    .INIT_14(256'hFFFFFFFFFFFFD8E2FFF400B04100C55F36FE8A00009FFFFFFFFFFFFFFFFFFFD2),
    .INIT_15(256'hD8A0A0FFFFFFFFFFF7FFFFFFFFF3462FD00020C25099DFC79CF008289FFFFFFF),
    .INIT_16(256'h0428F48E5C7EBBD8CA8A7FFFFFFFFFF57FFFFFFFD30DA06A2A0F80F29CFDD959),
    .INIT_17(256'hFFF7DE27EAA08512221F2096758701A8023FFFFFFFFFF57FFFFFFFD52F4C28A5),
    .INIT_18(256'hFFFFFFFFFFFFFFFFFC9E2A0A8A302800078A3B5FC04080021FFFFFFFFFFFFFFF),
    .INIT_19(256'h261FFCA0A8282FFFFFFFFFFFFFFFFFFE3E03D808D8082A8700A9F75A80A2081F),
    .INIT_1A(256'hAA822EA000A202292DFA0820800FFFFFFFFFFFFFFFFFD63EA8FA0A420088A820),
    .INIT_1B(256'hFFFFFFFFD61A7F42A0950022202280A17A28A0209FFFFFFFFFFFFFFFFFDC9AFD),
    .INIT_1C(256'h88A83FFFFFFFFFFFFFFFFFFCB3FDAAA03C000022824880B2020A809FFFFFFFFF),
    .INIT_1D(256'hC2AAA2BF28A80A08883FFFFFFFFFD7DFFFFFF76BF63400A808002022BA800880),
    .INIT_1E(256'h4D67DA7AA0808CF00A002FEAA822A8AA3FFFFFFFFFDFDFFFFF456BD0962A0029),
    .INIT_1F(256'hFFFFFFF6BDFFFF25275EE5A30ABD080AFA08522220AA203FFFFFFFFFFD5E7FFF),
    .INIT_20(256'hAEAA0022ABFFFFFFFFFFDC8FF7FF2F0D9B4E2A009F8C00802297A0880280FFFF),
    .INIT_21(256'h4A202A5A00A82080B6A8880BFFFFFFFFFD7DB9F7FF8F1C1C99C21A1C0222A808),
    .INIT_22(256'hFD37F7AE7006E7F022A9742008A0B0202028AFFFFFFFFFF5FC565DFD06B0BC79),
    .INIT_23(256'h0BFFFFFFFD5DA29FBDD742EB2EB55020A07A808A220A2A0A288FFFFFFFFFFDC8),
    .INIT_24(256'h00000A0020202A2FFFFFFFF7F6FCA7E576D8EC8F1F4C02A8802000A2A02A2822),
    .INIT_25(256'h50030E3502AA0000A020288002003FFFFFFFFFF1540B83D2D0F0A7A597AA0880),
    .INIT_26(256'hFEFF1FC2D470C0D82CC3D4D2A2020A0800280280087FFFFFFD77AEF7201AF2C0),
    .INIT_27(256'h802A03FFFFFF7FF0F72F88B53A883A14FBF97A8208880A0000220202FFFFFFF7),
    .INIT_28(256'hF40A2A2AA80002830C2FFFFFFFCD2A35D21A9620843ED2FA65BE08808828A200),
    .INIT_29(256'h01A2C2B7029D1F59EA088A228000001B5FFFFFFF7E38A5E07E2F2810F6E2B6BF),
    .INIT_2A(256'hFFFFF65D803C9D2A23E21F0AA7EB6F5A0008AAA00015E7FFFFFFFFD95EA1A17E),
    .INIT_2B(256'h88A2AA3E7DFFFFFFFFFDBF3055970220C27DA28B423DC928822A8A88FF1DFFFF),
    .INIT_2C(256'hD0BCB487BE20820AAA0761DFFFFFFFFFFF8F023D4DAAAAE0C3EA2D7297AD2082),
    .INIT_2D(256'hDE076AE002D50A7CF02500522AA8A0AA22822FFFFFFFFFFF4288B7600028D3C3),
    .INIT_2E(256'hDFFFFFFFFFFFFCFE092AC0C2BC007FE2287A2A80228AA0D81A2FFFFFFFFFFFF8),
    .INIT_2F(256'h2A08282822B6EFFFFFFFFFFFFFFD9DA83420EAB4281FC22AB480A2088800FEF9),
    .INIT_30(256'h70E78035F00030020020083BAABFFFFFFFFFFFFFFD8FA2F280E2DF280FC8002C),
    .INIT_31(256'hFFD7FFF0200C42FBC16A7AFD085088A0A2A0FBD0FFFFFFFFFFFFFFFF6C803BE2),
    .INIT_32(256'hD3FDD7FFFDFFFFFFF7FFFA7088C3FD01F8D0B7C368008820A2F9F27FFFFFFFFF),
    .INIT_33(256'h2ABE2028200A2FDBFFD7FF62FFFFFFFFFFF6840A43FE2A7F40215B88080A8001),
    .INIT_34(256'hC08847D52A0F2000BCA8222A0AB5D3FFD7DE02FFFFFFFFFFFD2B8A4DDC001F02),
    .INIT_35(256'h977FFFFFFFFD77C8AA57D14ABC720272888A280055D3FFFFE8AA7FFFFFFFFDF7),
    .INIT_36(256'hA2A9475957FF0FFFFFFFFFFFFF7DDA2075F2F0725423E0082AA801DFF367FF82),
    .INIT_37(256'hBD000B7E2020AA20020BE8F7FDD7FFFFFFFFFFFDFF7E227F7EF1C2BD0728202A),
    .INIT_38(256'hFFF5A7F682B5DFCF0208BC0088A80A000820FFFFFFFFFFFFFFFFF77FFE829D5F),
    .INIT_39(256'h807FFFFFFFFFFFFFFD62DF821F7DD7E002322AAA882828820237FFFFFFFFFFFF),
    .INIT_3A(256'h202020A8A080AA8AEFFFFFFFFFFFF7DFD80221CDD7F856296080A22020280282),
    .INIT_3B(256'h2D835F808F46002882A22AA9E02205563FFFFF5FFF777CF60821417762952D08),
    .INIT_3C(256'h7FFFFF7F490D42A2AED70280F000020A8AA29D8972DFFD67FFFF5FFF65D83588),
    .INIT_3D(256'h720037557201F77FFFFFD7A88BF8A23635C002B0820822028274207577F527FD),
    .INIT_3E(256'hA1088AA2A8009FC20A01FDE00A75FFFFFFF55823FE82B00F7802C8A00A820807),
    .INIT_3F(256'hD4803F86AB1A512E808A88880AFD0209CD7E82827FFFFFFFFF5C807710206BFC),
    .INIT_40(256'h201F5FFFFFFFFFF7220FEBE3C8B402008AA20A21D4008DF77A0205FFFFFFFFFF),
    .INIT_41(256'h0A9F5A8875D48081FD55FFFFFD5FF5C2A17C8040A9F00A0200088F722035DDA8),
    .INIT_42(256'h62230228282882005DC08B5542008FF7F5FFFFFDFFFD720A5F0A2BC040882A08),
    .INIT_43(256'hFFFFDDF7FE20AFBA060E08C0282823FF288D7D8A827D9F57FFFFFF5DD7D40ABF),
    .INIT_44(256'hA8209F8BFFFF27FFFFD5FFF7A089F70090014A0802AD54A88FFAA001547F7F69),
    .INIT_45(256'h0A180B5C28A0B68288D00FF3521F7DFFF49F76E2AAF4E2988300A002FCDA223D),
    .INIT_46(256'h170CA20F2A0000D8D80977E20A40000248AFC2A27F45FF5F2BF2BE8ABEBA2008),
    .INIT_47(256'h822555FFFF5D5222AA08CA00A801CB40158AA200AA88B02A82A0A0357FFF7FF8),
    .INIT_48(256'h058820822A2A57557FFFFFFFF57E2002299AA2828D8E0AEB6A02622200122282),
    .INIT_49(256'h555555E4DDBEB7D21755FD55D7F5FFFFFFFFFFD555FCA882AE87C0AC728969E0),
    .INIT_4A(256'hFFFFFFFFFFDFFFFE87FFC15F5FD7FFFDD5FF7FDD557FFFFFFFFFD7FDF9FF7FF5),
    .INIT_4B(256'hFFDFFFFFFFFFFFFFFFFFFFFF67DDDD5FFDFFC957C97FD735FFFD6BFFFFFFFFFF),
    .INIT_4C(256'hFFFFFFCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1FDC09FD7FFF),
    .INIT_4D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_4E(256'h00000000000000000000000000000000000000000000000000000000FFFFFFFF),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:2],douta}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(ena),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized2
   (douta,
    clka,
    ena,
    addra);
  output [1:0]douta;
  input clka;
  input ena;
  input [13:0]addra;

  wire [13:0]addra;
  wire clka;
  wire [1:0]douta;
  wire ena;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_01(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_02(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_03(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_04(256'hFFD6FF4BFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBFFFFFFFFFFFFF5FFFFFFF),
    .INIT_05(256'hFFFFFFBFFFFFFFEF91FF1FFFFF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFC7FFFFFFF),
    .INIT_06(256'hFFFFFFFFFFFFFFFFFFF8FFFFFFFFAFC3F07AFFFF2FFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_07(256'hC4AFBFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFFFFF1E003C80ABBD7FFFFFFFFF),
    .INIT_08(256'hFFFFFFDA89FE5BF6FBC6FFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFFFFFFF9081F87),
    .INIT_09(256'hFFFFFFFFFFF0BFFFFFFFE8C2F8405B541197FFFFFFFFFFFFFFFFFFFFFFFFF7FF),
    .INIT_0A(256'h3FFFFFFFFFFFFFFFFFFFFFFFF3BFFFFFE7A847F84EBD00D664FFFFFFFFFFFFFF),
    .INIT_0B(256'h1BFD5FCD00F3FACFFFFFFFFFFFFFFFFFFFFFFFECFFFFFF3EDFDBFC4FDC00EB7D),
    .INIT_0C(256'hFFDCFFFFF8FAB3DBF8452D003DE17FFFFFFFFFFFFFFFFFFFFFFFECFFFFFDDA71),
    .INIT_0D(256'hFFFFFFFFFFFFFFFF8AFFFFE5631FD0FF55AC003E542BFFFFFFFFFFFFFFFFFFFF),
    .INIT_0E(256'h70CD4683FEFFFFFFFFFFFFFFFFFFFF5EFFFFD12A21672E2AF3003A6B8BFFFFFF),
    .INIT_0F(256'h1ED87112FF1642CFFE5047F6FFFFFFFFFFFFFFFFFFFD2EFFBF08F1BD83FE17F1),
    .INIT_10(256'hFFFFFFFE43FFEE2648FB75FF3B1F83FA9561CEFFFFFFFFFFFFFFFFFFFF0AFF5E),
    .INIT_11(256'h4FFFFFFFFFFFFFFFFFFFFBB3FFFE813CD224F705BF9CE45AA34FFFFFFFFFFFFF),
    .INIT_12(256'h9FF49E44B1EA654FFFFFFFFFFFFFFFFFFFFB43FFFF2895F5610DEE6FE7E21A64),
    .INIT_13(256'h52FFFDB02CABD05FFF2D6D191964BFFFFFFFFFFFFFFFFFFFF6ABFFFD7427FEE5),
    .INIT_14(256'hFFFFFFFFFFFFFC42BFFB00E0D0164BFEC798E16AA4AFFFFFFFFFFFFFFFFFFFF3),
    .INIT_15(256'h6ED56D3FFFFFFFFFFFFFFFFFFFEC4147D440A4E494AFFF2626AC5549AFFFFFFF),
    .INIT_16(256'h1D1A3B636461DC572BB93FFFFFFFFFF9FFFFFFFEACCB3C5E083F44FD84FA9499),
    .INIT_17(256'hFFFC1BA7F770B53484ACFA95596428DBB9BFFFFFFFFFFEFFFFFFFC65875A9815),
    .INIT_18(256'hFFFFFFFFFFFFFFFFF896AAB3C9109266FF9DC595247BEFB92FFFFFFFFFFFFFFF),
    .INIT_19(256'h5720034BAAA53FFFFFFFFFFFFFFFFFF895495F276B857465A9BA5458439EB91F),
    .INIT_1A(256'h9F11E760A5D29544F10FF55A5A3FFFFFFFFFFFFFFFFFFBA1AB5EDC8D40540BB9),
    .INIT_1B(256'hFFFFFFFFEBA2FF49DD96C07844E81DE84EFF5A090FFFFFFFFFFFFFFFFFF4F8BD),
    .INIT_1C(256'h7EA60FFFFFFFFFFFFFFFFFD7D0FD0CEC44001145BC086ECEFFBE551FFFFFFFFF),
    .INIT_1D(256'h114CF19C01A6FEBEB65FFFFFFFFFFFF6FFFFD472F805D7440A05446AEE4BABFF),
    .INIT_1E(256'h0547E8AF2920434080F0B8301AADBEA57FFFFFFFFFF2E4BFFF895BFCB73A2429),
    .INIT_1F(256'hFFFFFFF7966FFFB98F12F9F28E84C835098BB105AAA9A8FFFFFFFFFFF560BFFF),
    .INIT_20(256'h12F4555502FFFFFFFFFFF2C65FFF693E2C4F1935D1B966F715DC1516A961FFFF),
    .INIT_21(256'h32164B5880419436F115119FFFFFFFFFFF98CD9BFF683E323100384733117065),
    .INIT_22(256'h1424BD11530EB980B89C4401524D05AEFEAA9FFFFFFFFFFE6767A6FFEEB0F5DF),
    .INIT_23(256'h9BFFFFFFFF9AF955C57CABA53EA9D5E2E8001081908555FEFE1BFFFFFFFFE681),
    .INIT_24(256'h5400116A9A965547FFFFFFFD6721692A6B46710CB2776C79D48500131A955554),
    .INIT_25(256'hE141AF29D1C48556400C6A6A99691FFFFFFFE5889B5DA27B44285B7E9D876E52),
    .INIT_26(256'h6614D509979133E599BCA7CC721455908406AA69A47FFFFFFF9AF71593EC9271),
    .INIT_27(256'h020406FFFFFFE5855534E6D404D839B4C19B9F1C661655400058B191FFFFFFFD),
    .INIT_28(256'h64E1B0955569090A225BFFFFFF4A259542DE571D5530705EBB1E97AC25560402),
    .INIT_29(256'h5D9D71AFC15E5599B556A59464281186FFFFFFFFC32D797891641D183BD0FE5C),
    .INIT_2A(256'hFFFFFB5553D7D1DEA8D06C05174EA16955AA5540A02D1BFFFFFFFFF89651A047),
    .INIT_2B(256'h6A591095FFFFFFFFFFFDD10E958439AFF43E498BC8057E851A9551407D6FFFFF),
    .INIT_2C(256'hD8AC2CB492E91455545740BFFFFFFFFFFFC4251130A268F3E397EAB1A5E42155),
    .INIT_2D(256'h2164371EF1AB04F178162A5A9A4005000FC42FFFFFFFFFFFF249447FAEB6970A),
    .INIT_2E(256'hBFFFFFFFFFFFF34758EF2561FD0778F0048A2A6AA910011D182FFFFFFFFFFFE6),
    .INIT_2F(256'hA5A6A69A18BF9BFFFFFFFFFFFFFCD188C6E2E07805EB0190D49AA9AAA643FD2B),
    .INIT_30(256'hC4D7CF1EE241D2BD5A9A646D9F9FFFFFFFFFFFFFFF80F103A3F43C162F23D024),
    .INIT_31(256'hFFFFFFCBB97390A70FE97869049A6B9A595475C03FFFFFFFFFFFFFFFA0F58C01),
    .INIT_32(256'hF9FFFFFFF1FFFFFFEBFFFD015E006B09E7D04A696906BAAAA2F5FCFFFFFFFFFF),
    .INIT_33(256'hC21790000A002FF9FFD7FF62FFFFFFFFFFFEC0C77F1D05B6806291A40016AA8B),
    .INIT_34(256'h20E0BEAB8A3E03405290046800FAFDFFFFF257FFFFFFFFFFFEBCE79B6E259F40),
    .INIT_35(256'h15FFFFFFFFFBFEFB03DA9399B0DC064ABA50A0128AFE1FFF91BFFFFFFFFFFBFF),
    .INIT_36(256'hAE8E17FBCFFD816FFFFFFFFFFFFDB962DA60D6E16B0D696BE59151A76E1FFF9F),
    .INIT_37(256'hDB80AD8790001955581CB3FFFD2FFFFFFFFFFFFBFEB0B1956B71D08621E406AA),
    .INIT_38(256'hFF9A97FC1075660D4241D28010640001B564BFFFFFFFFFFFFFFFE43FF697E5A9),
    .INIT_39(256'h552FFFFFFFFFFFFE6FE1586414565965000A9001A0000BAAA48BFFFFFFFFFFFF),
    .INIT_3A(256'h5BEA9A4BA5AAAA9401BFFFFFFFFFF9BFBC23D1451952A409AABE468041AAAA95),
    .INIT_3B(256'hA2C591C06147A0016AA96A5E2F99B7A4EFFFFFFFFFD6F6FF0FEEAE45A09992E4),
    .INIT_3C(256'hFFFFFFDB447FF1E013550147128040A000A9ADC28F79567FFFFFFFFF8FE0FFC4),
    .INIT_3D(256'hC1671995915BFDFFFFFFF60FDFBC2D18591200CA4002D001A7F440AA9959C7FF),
    .INIT_3E(256'h11E56A9A052E5F48F132562553FFFFFFFFFD97D4EF02E8445C0826A906400797),
    .INIT_3F(256'h9B7F9D3B181951E36A556AB9B57E32DA42574152FFFFFFFFFE627D7C14327907),
    .INIT_40(256'h00AFBFFFFFFFFFE5DF570008004401AAA5A551DAB8CA6655880053FFFFFFFFFF),
    .INIT_41(256'h09BFCC7655620004FFBFFFFFFFBFF979A5D14F521D0AA5AF80036BE31D9955D0),
    .INIT_42(256'hE5014F59F6A0142BFB05A4967400279FFFFFFFFF1FFE5DF966894803766AAC00),
    .INIT_43(256'hFFFFF6FEE0EE14EF162742EA92A5939813525455003DAFFFFAFFFFD2FF97BE54),
    .INIT_44(256'hD0190F41F9F84BFFFFFAFEBD25A5040D11434596967BB44A45481A4AE1BFFFF6),
    .INIT_45(256'h149644E8F85AD200166D67D288BFFFFFFBAF5745A64462D501021405244E1915),
    .INIT_46(256'hD9C3625412341013DA1E99616635405662971F56FF87FFFFCD48916850D8D51C),
    .INIT_47(256'h01E65BFFFFFFFC5B25FD17336802EF78060FD4848551895A5514018BEBFFAFC2),
    .INIT_48(256'h1784051581AB05555FFFFFFFFF82942D4CA9724F16C256657617D54555C45814),
    .INIT_49(256'hFFF5EB442457CA13140656FBAFF6FF5FFFFFFFFFFBE4A8D432B524C34F595E4A),
    .INIT_4A(256'hFFFFFF97FFF7D7F7B1FF007F7EAFE1FBF7FFFEBBFAFFFFFFFFFFFFFB4FF6EE96),
    .INIT_4B(256'hFFFFFFFFFFFFFFFFFFFFFFFFA7D7F5BFFFFF3D9FA9FFF8CFFFFE7EFFFFFFFFFF),
    .INIT_4C(256'hFFFFFF79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFFFFFFFFFFFE3CBF2BDFFAFFF),
    .INIT_4D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_4E(256'h00000000000000000000000000000000000000000000000000000000FFFFFFFF),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:2],douta}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(ena),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized3
   (\douta[14] ,
    \douta[15] ,
    clka,
    ena_array,
    ena,
    addra);
  output [7:0]\douta[14] ;
  output [0:0]\douta[15] ;
  input clka;
  input [0:0]ena_array;
  input ena;
  input [11:0]addra;

  wire [11:0]addra;
  wire clka;
  wire [7:0]\douta[14] ;
  wire [0:0]\douta[15] ;
  wire ena;
  wire [0:0]ena_array;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_01(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_02(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_03(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_04(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_05(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_06(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_07(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_08(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_09(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_0A(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_0B(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_0C(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_0D(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_0E(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_0F(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_10(256'h010101010101010101010101010101010D0B0101010101010101010101010101),
    .INIT_11(256'h0101010101010101010101010101010101010103030101010101010101010101),
    .INIT_12(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_13(256'h01010101010B0B01010101091812030101010101010101010103010101010101),
    .INIT_14(256'h0101010101010101010101010101010B07010101010101010101010101010101),
    .INIT_15(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_16(256'h0B181005010103140A0101010101010101010101070901010101010101010101),
    .INIT_17(256'h01010101010101010101010C0301010101010101010101010101010101010101),
    .INIT_18(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_19(256'h0101070A08010101010101010101010109010101010101010101010101010101),
    .INIT_1A(256'h0101010101010313010101010101010101010101010101010F120101140A0801),
    .INIT_1B(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_1C(256'h0C0613130A080804050101070501010101010101010101010101010101010101),
    .INIT_1D(256'h0101091201010101010101010101010101010101090E010D1000080707081213),
    .INIT_1E(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_1F(256'h14191D1D140E0402010101010101010101010101010101010101010101010101),
    .INIT_20(256'h010101010101010101010101010101010101010E06040C17191D1F1F0E191B12),
    .INIT_21(256'h0101010101010101010101010101010101010101010101010101010101010D0C),
    .INIT_22(256'h121012100C070101010101010101010101010101010101010101010101010101),
    .INIT_23(256'h01010101010101010101010101070C0E10191D191F1F1D1B19190E1D1F1F1712),
    .INIT_24(256'h0101010101010101010101010101010101010101010101010101111607010101),
    .INIT_25(256'h150E0A1111090101010101010101010101010101010101010101010101010101),
    .INIT_26(256'h01010101010101030E141D171817171D1D1D1B13191513151719121013131313),
    .INIT_27(256'h01010101010101010101010101010101010101010101151B0701010101010101),
    .INIT_28(256'h1F1F190901010101010101010101010101010101010101010101010101010101),
    .INIT_29(256'h01010110161B1B191B15171D1D1D1B171B151D1B191414151313131110101B1F),
    .INIT_2A(256'h0101010101010101010101010101010101071914010101010101010101010101),
    .INIT_2B(256'h0B01010101010101010101010101010101010101010101010101010101010101),
    .INIT_2C(256'h1019121614191D1F1D1D1F1919151F1F1F1B14111313111110161D1D1B1F1F1F),
    .INIT_2D(256'h010101010101010101010101010F16130101010101010101010101010B181610),
    .INIT_2E(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_2F(256'h17171B1F1D1F1F1919171F1F1F191213131311111216191F1F1F1F1B14010101),
    .INIT_30(256'h0101010101010101011718110101010101010101010101051A1D1F12171D171B),
    .INIT_31(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_32(256'h1F1D1B171B1319191512161511131311131816191F1F15060C08010101010101),
    .INIT_33(256'h010101010519160D0101010101010101010105191F1F1D0E191F171614191D1F),
    .INIT_34(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_35(256'h1917191B1B1B1415111313111112161217150800060A01010101010101010101),
    .INIT_36(256'h0F19120D01010101010101010109141F19121D12131714161419171310121010),
    .INIT_37(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_38(256'h1F1F171413131111111012140A0A0A0C0A080101010101010101010101010101),
    .INIT_39(256'h010101010101010105100C1B080E1F10151D191D0A0A0C10151B1F1917191B1D),
    .INIT_3A(256'h010101010101010101010101010101010101010101010101010101011717160B),
    .INIT_3B(256'h170C11110E0F0E0C0C08080A0A0A010101010101010101010101010101010101),
    .INIT_3C(256'h0701010111080E1B121F1510191F141B0C13171F1F1F1F1B151B191F1F1F1710),
    .INIT_3D(256'h0101010101010101010101010101010101010101010101011717160701010101),
    .INIT_3E(256'h0E0E0C0A060806060A0804010101070801010101010101010101010101010101),
    .INIT_3F(256'h0C0A161F1F0C101B151F171D1717171B1F1F1F1F171B19191915171216110E0E),
    .INIT_40(256'h010101010101010101010101010101010101010217151003010101010D09010B),
    .INIT_41(256'h0606060608060801010B0A010101010101010101010101010101010101010101),
    .INIT_42(256'h0A061D1B121F1B1610101B191F1F1F1F17121D1013191F1D1217110E0E0C0C08),
    .INIT_43(256'h010101010101010101010101010101081915130101010101010101080E0E171B),
    .INIT_44(256'h0606080409070101010101010101010101010101010101010101010101010101),
    .INIT_45(256'h12191512170E19171F1F1912151317191B1F1D1F1B12120D0C0C1D1506060808),
    .INIT_46(256'h0101010101010101010103121914110101010101010101031208150A04141F1B),
    .INIT_47(256'h0A05010101010101010101010101010101010101010101010101010101010101),
    .INIT_48(256'h1F101519151512171F1B1019171B1F1F1D0E0E120C08171F1D06060606080608),
    .INIT_49(256'h0101010101010B1415170B0101010101010101100C0E1008101F1F1D14101919),
    .INIT_4A(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_4B(256'h0E191F1F1F1F171319171F1B0C13170C100C0008140A06060606080401050101),
    .INIT_4C(256'h01010F101510080101010101010101080C100C08191F1F1F18141F1D18140C1B),
    .INIT_4D(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_4E(256'h1D1F1D12151B120C191B1F17040A0C0400060806060608080101010101010101),
    .INIT_4F(256'h150C12010101010101010101141200041B1F16151D121B1F1610081519191F1D),
    .INIT_50(256'h0101010101010101010101010101010101010101010101010101010101011110),
    .INIT_51(256'h0E1317141F1B1F15100C060A0808080808080606060301010101010101010101),
    .INIT_52(256'h090101010101010C17020004161F04001D1B1715060C1B0E19151B1F1D1F1F1B),
    .INIT_53(256'h01010101010101010101010101010101010101010101010101091213170A0C12),
    .INIT_54(256'h151D190C1D1D0C040808080606060A0806030101010101010101010101010101),
    .INIT_55(256'h01050A17060006040E1F0C131F0C0C1719191D170E1B121D1F1F1F1F1708131B),
    .INIT_56(256'h0101010101010101010101010101010101010101010D12131508010614110501),
    .INIT_57(256'h1B1B0E060C060606080A0A0A0301010101010101010101010101010101010101),
    .INIT_58(256'h0006120406161F1F0C060C171F1D121F10151B151F1F1B1D1F19060F19170C17),
    .INIT_59(256'h01010101010101010101010101010101011312130E0C01010A0A120B0514160C),
    .INIT_5A(256'h0F080A0C0A0A080C05010101010101010101010101010101010101010101070D),
    .INIT_5B(256'h04191D0A060C1012171F19161F0E1512171B1B15171D17060C1712151915060A),
    .INIT_5C(256'h01010101010101010101010F071317150C0C0301050A0106161F0C00040E1515),
    .INIT_5D(256'h080A080C04010101010101010101010101010101010101010101030901010101),
    .INIT_5E(256'h0C0A1B1B10191F1518160C0E0E19190819191D17060815171308080D0C080A0C),
    .INIT_5F(256'h01010101010101130B13190E0A120101010606041F120004100E1517171D0806),
    .INIT_60(256'h0601010101010101010101010101010101010101010101010101010101010101),
    .INIT_61(256'h14121D1F100A120C0E150A191D19191B170A020F170E080A0C080C0A0A0A0808),
    .INIT_62(256'h010105171015150C0E10080C0C0A0C181202120E111511151D0A060C0A101F1F),
    .INIT_63(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_64(256'h0E0E0E0A0C100E1B1B19171517170C020611110C0A080A0A080C080406050101),
    .INIT_65(256'h0C1515080E120E0905050E1602101F1013190E120E040A0A0A141F1D1B121719),
    .INIT_66(256'h0101010101010101010101010101010101010101010101010101010101010B19),
    .INIT_67(256'h08081310151B15151515130C0602080C0A0A0A08080806040804010101010101),
    .INIT_68(256'h0E040C1209051812121B181915151208081504040C1D1F1B1B1B12100C140C08),
    .INIT_69(256'h010101010101010101010101010101010101010101010101010111140C17130C),
    .INIT_6A(256'h0E12171513130E0C0C0A06040406080806060A08080401010101010101010101),
    .INIT_6B(256'h0C121214191B191D0E10150E1B0C00040E1F1F1F181D1B120C08060808060611),
    .INIT_6C(256'h01010101010101010101010101010101010101010101171510190C1009010105),
    .INIT_6D(256'h13110C0A0A0C0C0A0606080804060A060A070101010101010101010101010101),
    .INIT_6E(256'h141D141D1013131D1000000208161F1D1D1D1F19120E0C06080A14080C0C0C13),
    .INIT_6F(256'h0101010101010101010101010101010101051B100C170A0E010101010D080C1B),
    .INIT_70(256'h0A0A0A0C080A0C0A080606060C05010101010101010101010101010101010101),
    .INIT_71(256'h1B11191700000204020A191D1D1D1D1F14140E061513141908060A0A0E110C0A),
    .INIT_72(256'h010101010101010101010101010B1B0E10130C0B0101010B0E061019141F1419),
    .INIT_73(256'h060A0A08080A06080C0101010101010101010101010101010101010101010101),
    .INIT_74(256'h00020E0A00020A1D1F1D1F191B12100E101D10120E02080A0A0A0A0C0C0A0A0A),
    .INIT_75(256'h0101010101010101010F171315100A01010107100415171B141D1B141F171904),
    .INIT_76(256'h080A060C08010101010101010101010101010101010101010101010101010B03),
    .INIT_77(256'h1106060E1D1D181B1616190E0E191F1704080804080A08080A0A0C08080A0A08),
    .INIT_78(256'h0101010101131717150E06010101120A0E1D151419141F12191F060000100E13),
    .INIT_79(256'h04010101010101010101010101010101010101010101110101131F1301010101),
    .INIT_7A(256'h101B1B191012191910121D151510060806060808080A0A060A0C0C080808080A),
    .INIT_7B(256'h05171515150A0301010D1606191D10101B121D1B1B0C00000C15110E15150404),
    .INIT_7C(256'h0101010101010101010101010101010101011719111F171D1101010101010101),
    .INIT_7D(256'h1717101F0E06100E1B1D130A06080806080808080A0A08080A0A080804010101),
    .INIT_7E(256'h0E0401010519170C1F1219171414191F0C0016101013151110130A0202141D0C),
    .INIT_7F(256'h0101010101010101010101010101091E1219191D1F0901010101010102141715),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[14] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\douta[15] }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(ena),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized4
   (\douta[14] ,
    \douta[15] ,
    clka,
    ena_array,
    ena,
    addra);
  output [7:0]\douta[14] ;
  output [0:0]\douta[15] ;
  input clka;
  input [0:0]ena_array;
  input ena;
  input [11:0]addra;

  wire [11:0]addra;
  wire clka;
  wire [7:0]\douta[14] ;
  wire [0:0]\douta[15] ;
  wire ena;
  wire [0:0]ena_array;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0408080C12171F13040A0A080606060608080808080606040101010101010101),
    .INIT_01(256'h101B121519131F12151B120E04121D1F12111117100C1706081D080E14121D14),
    .INIT_02(256'h0101010101010101010917101213191D1D1D030101010103080E191506020109),
    .INIT_03(256'h080A150C0A0A0808080A08060608080804080801010101010101010101010101),
    .INIT_04(256'h151B17171517150A191F121B1D111312110E0F10190C000A0C1619040A0C0A08),
    .INIT_05(256'h01010101111F1F1510110E1B1D1F1701010101090E0A191306010514041B150C),
    .INIT_06(256'h0E0A0D080606080808080606080A020101010101010101010101010101010101),
    .INIT_07(256'h131019121B1F1B101D1B100E13130A170E0002000A1B06080C0A0A1919120A0C),
    .INIT_08(256'h1F1F190E131511101D1B1F0D0101010D140A1B10020113080C1F190A1B19141F),
    .INIT_09(256'h0A0A0A0808080A080C0601010101010101010101010101010101010101010517),
    .INIT_0A(256'h10181F19121F160F130F171B020202041B08060E0C06141F1917060A0E0C0A06),
    .INIT_0B(256'h1315150F131F1B1D050101111708130A01090C0C13131D0E1B121B191B151517),
    .INIT_0C(256'h0A0A0C08060801010101010101010101010101010101010101091B1F1D130808),
    .INIT_0D(256'h16121F170D151D06020602170E00060A0C0C191B0E040A0A080A0A080A0A0C08),
    .INIT_0E(256'h0C17191D1B010115170A0C0403120A1702121F0E0E1B1B171B170A1912121B1F),
    .INIT_0F(256'h0A10060101010101010101010101010101010101111F1F1B120E0A0A0A151513),
    .INIT_10(256'h161D0A020804080800020204080C1B14060A0C0A0A0A0A0A0808080606080606),
    .INIT_11(256'h1F0F011415110A001316150604151F130C1F151917121710190E141B1F16121D),
    .INIT_12(256'h010101010101010101010101010103171F1F190E1117110A0A0C1513130E1D1B),
    .INIT_13(256'h06080A02020202020008190A080C0C0A0A0A0A0A0C0A080C080A0A0A0C080101),
    .INIT_14(256'h150F0606191D0A02080A1D1D08101B190E171B1710170C161B1F16121F0C0008),
    .INIT_15(256'h010101010101010101091B1F1D150A131513150E0A080E170E0A131D1B1F080E),
    .INIT_16(256'h0604040202171006080C0C0C0A0A0A0A0A0A0C0A080C0A0C0801010101010101),
    .INIT_17(256'h1D1B06080404151D0E0A1F12131919171019150C161B1F1D0C020804080A0406),
    .INIT_18(256'h010101010F1F1F1D100E1312131313150A0A150E0C150C171D1B060A130A0406),
    .INIT_19(256'h0C15080402060A0A0C0C0C0C080E0C060C0A0C08010101010101010101010101),
    .INIT_1A(256'h06081D1F1D0E1015191915121F1310150C161910020A0A080A04060606080602),
    .INIT_1B(256'h1F1F1B0E0F1515131013131313150C081713110C1D1904060F0C000E1F1D0C06),
    .INIT_1C(256'h02020204080A0A060E10080A0A080A0401010101010101010101010101010315),
    .INIT_1D(256'h1F1708191917101D1B171012170A1608080E0C0C060604060606060606060200),
    .INIT_1E(256'h1515131311101315100A0A0C0E13130D151506060C040E13131F0E04081B1713),
    .INIT_1F(256'h0600020E150A04060A0C080101010101010101010101010101091B1F1D170808),
    .INIT_20(256'h1B101B1D13171D0C0E170A14120C1004080C080604060606060404040200040C),
    .INIT_21(256'h1313130C0C130E0E0813130C0F080A0606081706151F1706171F00061B1D120E),
    .INIT_22(256'h0C040102080A0101010101010101010101010101071F1F1D130A080A0C151313),
    .INIT_23(256'h151917130C0E170A101606060C080A0C060406060606080600040E0A0000101F),
    .INIT_24(256'h15151108080C130F11080C0604190804191F1B121F0A0006121F1D0E0C191F15),
    .INIT_25(256'h0101010101010101010101010101010101131D0E0F150E080A0E151315100C0F),
    .INIT_26(256'h190E0A0C080A0C0E0C0C080A0C0A060404060400040E0C0004040D0E02030601),
    .INIT_27(256'h08060C150E060A081B10000A101D1D1F100000080C171F1B0817191717170E15),
    .INIT_28(256'h01010101010101010101010101010E131313150C0A0A11150E0C11131313150E),
    .INIT_29(256'h0A0A080A0C0C0C0A080A0A0A080602020E0A00040A0301010306030101010101),
    .INIT_2A(256'h0A0A06171F0A0604061D1F1500000A08040C171F1904101B1910131513190C08),
    .INIT_2B(256'h010101010101010101010314151313130A0815100C15150E101313130E0C100C),
    .INIT_2C(256'h080A0C0C0A0A080A0A0A060C0C02060C01010101080101010101010101010101),
    .INIT_2D(256'h1D100602131F1F1B08040C060802101F1F130C1713131715170C121708060C08),
    .INIT_2E(256'h0101010101010107161311131117100A151313130E11130F13120A080A060C0E),
    .INIT_2F(256'h0A0C0C0A080A0C08040C0C060401010601010101010101010101010101010101),
    .INIT_30(256'h1F0A131F1D0C060E0A0A1D1B1B1F150A10191517100E15110F0802080A0A080A),
    .INIT_31(256'h010101010C151113130C060A1115111311101111100E060C0A0A0C061F120210),
    .INIT_32(256'h0A0A0A0608080101030604030101010101010101010101010101010101010101),
    .INIT_33(256'h1F170A0D0A1D1F04041D1F130E1015130E17110A0C0A06040408080808080A0A),
    .INIT_34(256'h0110150E080F0C080A111311110E100E0C0C100C0C10060C1D170A1F15000C1D),
    .INIT_35(256'h0A08040404080406100801010101010101010101010101010101010101010101),
    .INIT_36(256'h191F0C00040A191F130C0E0C1715080A0806080A060204040608080806060406),
    .INIT_37(256'h11151108080A13110F0E0E0E0F0A100C0E10020A1D1B1B1D02000A171F1F1506),
    .INIT_38(256'h0A0506080A04010101010101010101010101010101010101010101010105100A),
    .INIT_39(256'h02040A151F170C0C130A0A0A0608080808080606040404060604040403030206),
    .INIT_3A(256'h08080A0F100E0E100F0C0808190C040A121F1F0800000612191F1D171F120004),
    .INIT_3B(256'h010101010101010101010101010101010101010101010101010105141511130E),
    .INIT_3C(256'h101B19150C060808080808060606080808080606040406020101010603010601),
    .INIT_3D(256'h0E0F110A0E0A000A1F0E0802081F1B0000040A0610191F1F1500020606080404),
    .INIT_3E(256'h01010101010101010101010101010101010101010101010B141111130C060E13),
    .INIT_3F(256'h0A0C080608080608080806060806080606040408060101040108030101010101),
    .INIT_40(256'h0E0A00101F140602151F1F17020A0806040E1F1F170A040A0E060000000C1D15),
    .INIT_41(256'h01010101010101010101010101010101010101010E1311110C1013080F110F10),
    .INIT_42(256'h0606080608060606060606040401040306080402040301010101010101010101),
    .INIT_43(256'h1D1704131F08171F14040A0A02191F1B1F1F1308040000060E1B150A0A0E0E08),
    .INIT_44(256'h010101010101010101010101010101010310110D101006060A110C131906040C),
    .INIT_45(256'h06060806060606080101060101050C0C03010101010101010101010101010101),
    .INIT_46(256'h1500101F1F0E0806151F0C041B1F1F17040008151D190A0A08080C0C0A080808),
    .INIT_47(256'h010101010101010101010101010510100C0C0A08060C0F0C1D0600061D1D0C1F),
    .INIT_48(256'h0A0A0C06010108030101080C0101010101010101010101010101010101010101),
    .INIT_49(256'h1F1F080E1F1900000A171D1D1B0C0E1B190C0C060002060A0C0C0A0A0A0A0A08),
    .INIT_4A(256'h010101010101010101010C100D0F0F080A080C08191300171B1F1B1D02000C19),
    .INIT_4B(256'h01010C0301010101010101010101010101010303010101010101010101010101),
    .INIT_4C(256'h1B020000060E131D1D19171B0E0A0800020204020406080A0C0A0A08080A0401),
    .INIT_4D(256'h010101010101010C100D0D111204080E1B120E1F191B1F080004080C1D1F1B1D),
    .INIT_4E(256'h01010101010505010101010103080C0201010101010101010101010101010101),
    .INIT_4F(256'h0E04060E17191B100A0800020204040200060A08020202060A02010101010E03),
    .INIT_50(256'h010101030E0E0C11120A0A101D0A1B1F1B1B1F0C000C06060C191F1F08000004),
    .INIT_51(256'h01010101010105080A060A040101010101010101010101010101010101010101),
    .INIT_52(256'h081B150A0C08040002040404060A0A0202020408020101010101100501010101),
    .INIT_53(256'h050E0D11120A04131B101F1F1F1B1D1D0C040A0800101F1F1306001006000000),
    .INIT_54(256'h010606060A12180C010101010101010101010101010101010101010101010101),
    .INIT_55(256'h0C0C0C08060602060A0A020204040A020307010101010E010505010101010101),
    .INIT_56(256'h060404101F191D1D1D19171F1B060A060A1F17151F1B10040000080E19170A0A),
    .INIT_57(256'h19130B0101010101010101010101010101010101010101010101010101080E0C),
    .INIT_58(256'h0C0A08080C080406060A08010103030101010E01050C010101010101020E1214),
    .INIT_59(256'h1F191B1D191D15171F1906081D1D000A191D1D100004121B190C0A06060A0C0E),
    .INIT_5A(256'h01010101010101010101010101010101010101010101010703010A0C080E000A),
    .INIT_5B(256'h0C0C0C0C0C0800030708030101010E0101070101010101031617110B03010101),
    .INIT_5C(256'h171D1D101B1F13151F0600040E171B1D150C151B0E0C08000004060A0A0A0A0A),
    .INIT_5D(256'h010101010101010101010101010101010101010307010B080A12000A1D1B191B),
    .INIT_5E(256'h0606080A0A0A0803030A10060101010101010105090101010101010101010101),
    .INIT_5F(256'h101B1D1F0C0002000A0C121B1D171B100A0800020204020204080A0806080606),
    .INIT_60(256'h010101010101010101051B1101010101010111140C0A0812141D19191D1D1F19),
    .INIT_61(256'h0A0C0C0C0A140C0C010101010101010101010101010101010101010101010101),
    .INIT_62(256'h0600000C06000408121B150A0A000002040602020A0C08020202040602040608),
    .INIT_63(256'h01010101051B1F1F1000010101010119190613020A1F19171B1B1B1F17151F1B),
    .INIT_64(256'h0A0E0A0808070301010101010101010101010101010101010101010101010101),
    .INIT_65(256'h0000000415170A0A0A080604040202080C0A02020206060000060C0C0C0A0A0A),
    .INIT_66(256'h1B1F1F1D1D100404010F0707120C080215191B17191B1B1D1B191B1B1B0E0606),
    .INIT_67(256'h0C0E0A0609070101010101010101010101010101010101010101010101010105),
    .INIT_68(256'h1B0C0A0A0A0E0C0A0604060C0A040004060604060A0C0C0A0A0A0A0C0C080808),
    .INIT_69(256'h1D1F1004020E170A1208021B1B151B1917191D1B191B060C1D1D170400040E19),
    .INIT_6A(256'h1D1B130D05010101010101010101010101010101010101010101051B1F1D1F1F),
    .INIT_6B(256'h06080A0C0C0A0A0A0A080A0A08060A0C0C0C06080C0808080A0C0C0C0A060A19),
    .INIT_6C(256'h02041412100E101D1F0A0E1D1915191B1D0E00040E191D190A08171B0E0A0600),
    .INIT_6D(256'h180101010101010101010101010101010101010101071B1F1D1F190C1F1F1F0E),
    .INIT_6E(256'h080A0C0C0C0C0A08080C0C0A08081019170E0E0E0A0808080A0E191F1B1B1D1D),
    .INIT_6F(256'h0C10171F1200061B1D17171B120000000A0C171B191319120A0A000002060406),
    .INIT_70(256'h01010101010101010101010101010101031D1F1D1F1B06000E1F1F1F10000815),
    .INIT_71(256'h060204040A0C0A080C191F191215171B1B1710121B1F1D1B1B1B1B1D1D0C0101),
    .INIT_72(256'h040A19101B1919190400000A0A020810171B130A08000002060200040A0C0604),
    .INIT_73(256'h010101010101010101010101010F1F1F1704080D040E1F1F1F0E000A120E1517),
    .INIT_74(256'h0C0A06121F1F1715040415151D1F1D1D1B1B1B1B1B1B1B170C0E050101010101),
    .INIT_75(256'h061B1D191508040C0000000612170A0A080400040200040A0E0A00040404040A),
    .INIT_76(256'h01010101010101010101111F17040A0A0C06101F1D1F1000060E100A001B1D04),
    .INIT_77(256'h1D17150802060610151B1D1B1B1919191B191308040A0C010101010301010101),
    .INIT_78(256'h1919120200020A15170C080A0C0C0A080202080C0A0002040404080E0806171F),
    .INIT_79(256'h01010101010101131F19060A100802151F1D1F100600040E121F0C0008131B17),
    .INIT_7A(256'h0808020A1510151B191B1B1B150C060606040C08010101010101010101010101),
    .INIT_7B(256'h040815190E080806080A0C0C0C080A0C04040806040A0E0806171F1F19150C00),
    .INIT_7C(256'h01010101171F170A080A0A04151F1F15131504021712000A19120E1B17171912),
    .INIT_7D(256'h1913171B191B19100804040806040C0A01010101010101010101010101010101),
    .INIT_7E(256'h080A0A0A08080808080C0C0A0C0E0C060A0C0808191F1F19150E000C0804101D),
    .INIT_7F(256'h01191F12040A0A0808191F19020C1B0E040A0E1915190E0819191519120E1710),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[14] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\douta[15] }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(ena),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized5
   (\douta[14] ,
    \douta[15] ,
    clka,
    ena_array,
    ena,
    addra);
  output [7:0]\douta[14] ;
  output [0:0]\douta[15] ;
  input clka;
  input [0:0]ena_array;
  input ena;
  input [11:0]addra;

  wire [11:0]addra;
  wire clka;
  wire [7:0]\douta[14] ;
  wire [0:0]\douta[15] ;
  wire ena;
  wire [0:0]ena_array;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h1B150C06020202040A0C07010101010101010101010101010101010101010101),
    .INIT_01(256'h0A0A06080E0C0608060604080C080A1B1F1D1B151002060A080C1B1B19191719),
    .INIT_02(256'h10060A0E0804191F1704061515060C17171504000A171915151515080A0A0A0A),
    .INIT_03(256'h0404040A0C050101050101010101010101010101010101010101010101031B1F),
    .INIT_04(256'h0A0202040202060E080A1D1F1F1B151400040C020C1B1B191919191710080404),
    .INIT_05(256'h080806191F1D170608130E101906000C170A101917170C080A080A080A080E12),
    .INIT_06(256'h0101010305010101010101010101010101010101090301010101051D1F100808),
    .INIT_07(256'h02020C080C1D1F1F1D1514060A0A040A191B19191B1B150A0602020402060E09),
    .INIT_08(256'h191D1B1F0A000E0A06040E171902000E170E060A080A0C08080C100400020402),
    .INIT_09(256'h010101010101010101010101010101010F1F0701010101071F1F10040A0A0808),
    .INIT_0A(256'h1D1F1D1D151506020E0A08171B19191B170E0806020202020C0C050101030101),
    .INIT_0B(256'h1F0C06080006151B06000E1206080C060E12080A0A0C040004080604020A080E),
    .INIT_0C(256'h0101010101010101010101010111190701010101091F1D0E060A0A080A1B1B17),
    .INIT_0D(256'h1508020A0208171D191B1911080606060402080C090101050A03010101010101),
    .INIT_0E(256'h0006190C020A19120602020A1F0A0A0A0A08060A0A0C08060A08111F1D1B1D17),
    .INIT_0F(256'h01010101010101010101030301010101010B1F1B0E060A0E04081B17121D0E10),
    .INIT_10(256'h08151B1B1B150C0404060606060C0C050101050E030101010101010101080A03),
    .INIT_11(256'h041913080800001F170206080C06080A0A06060A08101D1F1D1F17150A060A04),
    .INIT_12(256'h01010101010105090301010101010D1D190C0808080608191717191513001006),
    .INIT_13(256'h10080404040606080C0901010A0C0E0301010305010101070E0E030101010101),
    .INIT_14(256'h0600131B0000000C0408080002020608151D19131913140C00080A0815191917),
    .INIT_15(256'h0101030C14110F050101010E1D1908040A08040E1B1717151B0E000E12170808),
    .INIT_16(256'h04060A0A030106080C0E03010105090301070C100A0101010101010101010101),
    .INIT_17(256'h00060A060817080C060208171F1B1D130E120C0006040C101219130A06040204),
    .INIT_18(256'h0612161719130E040C1B170804080E06081B1715101B0E06100A080602061200),
    .INIT_19(256'h070C0C0C0C0A030109100A060C0E0E0801010101050903010101010101010101),
    .INIT_1A(256'h1F1B100C0208101B1D191B1B190E0406020A0A0E150E06060604020406060808),
    .INIT_1B(256'h10191D1B10151710080C040C06081B17150A170E040E0600000600001519060E),
    .INIT_1C(256'h08080A060C0A080A0C0A0A060805030101030101010101010303010101030A0C),
    .INIT_1D(256'h0415191B15151212120808060A1508130C040606060604080C150A080C0A0A0C),
    .INIT_1E(256'h170E0A0C10120E0415060A14150E02120A0C0E00020000191F0C121F17100A00),
    .INIT_1F(256'h0C0A0C0C06080501030303010101010101010101010101010101040E0A080C12),
    .INIT_20(256'h1710080E0006080E1F0A060806020404040606080E11080808080A0C0C0C0E0E),
    .INIT_21(256'h0A0612130C1B0A08080E130E0C0210140606191D1417170E0806060A190E0C19),
    .INIT_22(256'h0705010101010101010101010101010101010101030707080C100C04040C120C),
    .INIT_23(256'h0406171F10040A0606080C0C0A0C0E0C0E0C0A0C1014120A0909090707070709),
    .INIT_24(256'h1D1A1D1412141F1F170C081716191D16191510100C0C141D170E161F1F0A100E),
    .INIT_25(256'h01010101010101010101010101010101010103010105071312141219160E0C1D),
    .INIT_26(256'h151B17110F0D0D1111110F09090B030305090701010107030101010105050101),
    .INIT_27(256'h0D0D09090B0D07070B070507131F1D1D150D0B0B161511100E0F171B191F1D16),
    .INIT_28(256'h01010101010101010101010101010101070D0E09090B0307090309090D0B070F),
    .INIT_29(256'h0501030101010101010101050903010101010303010101010101010101010101),
    .INIT_2A(256'h04040501010101010B0F070709050101090301010103010103090F090707070B),
    .INIT_2B(256'h0101010101010101010101010509050101010101010503010103030101010506),
    .INIT_2C(256'h01010101010101070F0E06010101010101010101010101010101010101010101),
    .INIT_2D(256'h01010101010101010710100F09030101010C100D070101010101051112070101),
    .INIT_2E(256'h0101010101010101010101010101010103120701010705010101050501010101),
    .INIT_2F(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_30(256'h010101010101030A0C0501010101050C12140A01010101010101010101010101),
    .INIT_31(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_32(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_33(256'h0101010101010101010101010108060101010101010101010101010101010101),
    .INIT_34(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_35(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_36(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_37(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_38(256'h0000000000000000000000000000000001010101010101010101010101010101),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\douta[14] }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\douta[15] }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(ena),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module satellite1_rom_blk_mem_gen_prim_wrapper_init__parameterized6
   (DOADO,
    DOPADOP,
    clka,
    ena,
    addra);
  output [7:0]DOADO;
  output [0:0]DOPADOP;
  input clka;
  input ena;
  input [13:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1_n_0 ;
  wire [7:0]DOADO;
  wire [0:0]DOPADOP;
  wire [13:0]addra;
  wire clka;
  wire ena;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],DOADO}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],DOPADOP}),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1_n_0 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(ena),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'h80)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(ena),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module satellite1_rom_blk_mem_gen_top
   (douta,
    addra,
    ena,
    clka);
  output [15:0]douta;
  input [13:0]addra;
  input ena;
  input clka;

  wire [13:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  satellite1_rom_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* C_ADDRA_WIDTH = "14" *) (* C_ADDRB_WIDTH = "14" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "7" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.264701 mW" *) 
(* C_FAMILY = "artix7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "satellite1_rom.mem" *) 
(* C_INIT_FILE_NAME = "satellite1_rom.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "16384" *) (* C_READ_DEPTH_B = "16384" *) (* C_READ_WIDTH_A = "16" *) 
(* C_READ_WIDTH_B = "16" *) (* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) 
(* C_RST_PRIORITY_A = "CE" *) (* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) 
(* C_USE_BRAM_BLOCK = "0" *) (* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) 
(* C_USE_DEFAULT_DATA = "0" *) (* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) 
(* C_USE_URAM = "0" *) (* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) 
(* C_WRITE_DEPTH_A = "16384" *) (* C_WRITE_DEPTH_B = "16384" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
(* C_WRITE_MODE_B = "WRITE_FIRST" *) (* C_WRITE_WIDTH_A = "16" *) (* C_WRITE_WIDTH_B = "16" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "blk_mem_gen_v8_3_3" *) (* downgradeipidentifiedwarnings = "yes" *) 
module satellite1_rom_blk_mem_gen_v8_3_3
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [13:0]addra;
  input [15:0]dina;
  output [15:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [13:0]addrb;
  input [15:0]dinb;
  output [15:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [13:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [15:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [15:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [13:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [13:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  assign dbiterr = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[13] = \<const0> ;
  assign rdaddrecc[12] = \<const0> ;
  assign rdaddrecc[11] = \<const0> ;
  assign rdaddrecc[10] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[13] = \<const0> ;
  assign s_axi_rdaddrecc[12] = \<const0> ;
  assign s_axi_rdaddrecc[11] = \<const0> ;
  assign s_axi_rdaddrecc[10] = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  satellite1_rom_blk_mem_gen_v8_3_3_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_3_3_synth" *) 
module satellite1_rom_blk_mem_gen_v8_3_3_synth
   (douta,
    addra,
    ena,
    clka);
  output [15:0]douta;
  input [13:0]addra;
  input ena;
  input clka;

  wire [13:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;

  satellite1_rom_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
