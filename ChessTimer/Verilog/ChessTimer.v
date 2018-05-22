`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas Ibanez
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
	output wire				LCD_RS,
	output wire				LCD_RW,
	output wire				LCD_E,
	output wire	[7:0]		LCD_DB
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
	.enable(setTime),
	.add(add),
	.min(min)
);

countDown countDown0 (
	.clk(clk),
	.enable(count),
	.timeIn(min),
	.player(sw),
	.min1(min1),
	.sec1(sec1),
	.min2(min2),
	.sec2(sec2)
);

visualizador visualizador0(
	.clk(clk),
	.setTime(setTime),
	.timeIn(min),
	.countedTime({min1,sec1,min2,sec2}),
	.LCD_RS(LCD_RS),
	.LCD_RW(LCD_RW),
	.LCD_E(LCD_E),
	.LCD_DB(LCD_DB)
);

endmodule
