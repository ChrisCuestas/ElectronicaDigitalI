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
	input		wire			clk,
	input 	wire			enable,
	input 	wire			reset,
	input 	wire			set,
	input 	wire			add,
	input 	wire [1:0]	sw,
	output	wire [5:0]	lcd
    );

wire 	setTime;
wire	count;

wire [5:0] min;

wire [5:0] min1;
wire [5:0] sec1;
wire [5:0] min2;
wire [5:0] sec2;

control control0 (
	.enable(enable),
	.reset(reset),
	.set(set),
	.setTime(setTime),
	.count(count)
);

setTime setTime0 (
	.enable(enable),
	.add(add),
	.min(min)
);

countDown countDown0 (
	.clk(clk),
	.enable(count),
	.timeIn(min),
	.player1(sw[0]),
	.player2(sw[1]),
	.min1(min1),
	.sec1(sec1),
	.min2(min2),
	.sec2(sec2)
);

LCDcontrol LCDcontrol0(
	.clk(clk),
	.setTime(setTime),
	.timeIn(min),
	.countedTime({min1,sec1,min2,sec2}),
	.lcd(lcd)
);

endmodule
