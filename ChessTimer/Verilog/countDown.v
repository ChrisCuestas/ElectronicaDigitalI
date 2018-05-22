`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas Ibanez 
// 
// Create Date:    08/05/2018 
// Module Name:    countDown 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module countDown(
	input clk,
	input wire enable,
	input wire [5:0] timeIn,
	input wire [1:0] player,
	output wire [5:0] min1,
	output wire [5:0] sec1,
	output wire [5:0] min2,
	output wire [5:0] sec2
    );

wire clkOut;

wire enable1;
wire enable2;
wire reset1;
wire reset2;

divFrec divFrec0 (
	.clkIn(clk),
	.clkOut1(clkOut)
);

timersControl timersControl0 (
	.enable(enable),
	.player(player),
	.enable1(enable1),
	.enable2(enable2),
	.reset1(reset1),
	.reset2(reset2)
);

counter counter1 (
	.clk(clkOut),
	.enable(enable1),
	.reset(reset1),
	.TIME(timeIn),
	.min(min1),
	.sec(sec1)
);

counter counter2 (
	.clk(clkOut),
	.enable(enable2),
	.reset(reset2),
	.TIME(timeIn),
	.min(min2),
	.sec(sec2)
);

endmodule
