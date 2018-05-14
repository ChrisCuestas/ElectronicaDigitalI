`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
// 
// Create Date:    08/05/2018 
// Module Name:    ChessTimer 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module ChessTimer(
	input clk,
	input 	wire		enable,
	input 	wire		reset,
	input 	wire		set,
	input 	wire		min,
	input 	wire		sw0,
	input 	wire		sw1,
	output wire	[5:0]	lcd
    );

wire [5:0] min1;
wire [5:0] seg1;
wire [5:0] min2;
wire [5:0] seg2;

countSet countSet1 (
	.clk(clk),
	.enable(enable),
	.reset(reset),
	.set(set),
	.min(min),
	.sw0(sw0),
	.sw1(sw1),
	.min1(min1),
	.seg1(seg1),
	.min2(min2),
	.seg2(seg2)
);

multiplexor multiplexor1 (
	.clk(clk),
	.min1(min1),
	.seg1(seg1),
	.min2(min2),
	.seg2(seg2),
	.lcd(lcd)
);

endmodule
