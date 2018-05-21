////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: ChessTimer_synthesis.v
// /___/   /\     Timestamp: Mon May 21 11:47:24 2018
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim ChessTimer.ngc ChessTimer_synthesis.v 
// Device	: xc7a100t-3-csg324
// Input file	: ChessTimer.ngc
// Output file	: /home/chriscuestas/Documentos/ChessTimer/netgen/synthesis/ChessTimer_synthesis.v
// # of Modules	: 1
// Design Name	: ChessTimer
// Xilinx        : /media/chriscuestas/Data/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ChessTimer (
  clk, enable, reset, set, add, sw, lcd
);
  input clk;
  input enable;
  input reset;
  input set;
  input add;
  input [1 : 0] sw;
  output [5 : 0] lcd;
  wire clk_IBUF_0;
  wire enable_IBUF_1;
  wire reset_IBUF_2;
  wire set_IBUF_3;
  wire add_IBUF_4;
  wire lcd_5_OBUF_5;
  wire lcd_4_OBUF_6;
  wire lcd_3_OBUF_7;
  wire lcd_2_OBUF_8;
  wire lcd_1_OBUF_9;
  wire lcd_0_OBUF_10;
  wire setTime;
  wire N0;
  wire N1;
  wire \NLW_LCDcontrol0_lcd<7>_UNCONNECTED ;
  wire \NLW_LCDcontrol0_lcd<6>_UNCONNECTED ;
  wire NLW_control0_count_UNCONNECTED;
  wire \NLW_countDown0/divFrec0_clkOut_UNCONNECTED ;
  wire [5 : 0] min;
  wire [5 : 0] sec;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  LCDcontrol   LCDcontrol0 (
    .clk(clk_IBUF_0),
    .setTime(setTime),
    .timeIn({min[5], min[4], min[3], min[2], min[1], min[0], sec[5], sec[4], sec[3], sec[2], sec[1], sec[0]}),
    .countedTime({N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0, N0}),
    .lcd({\NLW_LCDcontrol0_lcd<7>_UNCONNECTED , \NLW_LCDcontrol0_lcd<6>_UNCONNECTED , lcd_5_OBUF_5, lcd_4_OBUF_6, lcd_3_OBUF_7, lcd_2_OBUF_8, 
lcd_1_OBUF_9, lcd_0_OBUF_10})
  );
  control   control0 (
    .enable(enable_IBUF_1),
    .reset(reset_IBUF_2),
    .set(set_IBUF_3),
    .setTime(setTime),
    .count(NLW_control0_count_UNCONNECTED)
  );
  setTime   setTime0 (
    .enable(enable_IBUF_1),
    .add(add_IBUF_4),
    .min({min[5], min[4], min[3], min[2], min[1], min[0]}),
    .sec({sec[5], sec[4], sec[3], sec[2], sec[1], sec[0]})
  );
  divFrec   \countDown0/divFrec0  (
    .enable(N1),
    .clkIn(clk_IBUF_0),
    .clkOut(\NLW_countDown0/divFrec0_clkOut_UNCONNECTED )
  );
  IBUF   clk_IBUF (
    .I(clk),
    .O(clk_IBUF_0)
  );
  IBUF   enable_IBUF (
    .I(enable),
    .O(enable_IBUF_1)
  );
  IBUF   reset_IBUF (
    .I(reset),
    .O(reset_IBUF_2)
  );
  IBUF   set_IBUF (
    .I(set),
    .O(set_IBUF_3)
  );
  IBUF   add_IBUF (
    .I(add),
    .O(add_IBUF_4)
  );
  OBUF   lcd_5_OBUF (
    .I(lcd_5_OBUF_5),
    .O(lcd[5])
  );
  OBUF   lcd_4_OBUF (
    .I(lcd_4_OBUF_6),
    .O(lcd[4])
  );
  OBUF   lcd_3_OBUF (
    .I(lcd_3_OBUF_7),
    .O(lcd[3])
  );
  OBUF   lcd_2_OBUF (
    .I(lcd_2_OBUF_8),
    .O(lcd[2])
  );
  OBUF   lcd_1_OBUF (
    .I(lcd_1_OBUF_9),
    .O(lcd[1])
  );
  OBUF   lcd_0_OBUF (
    .I(lcd_0_OBUF_10),
    .O(lcd[0])
  );
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

