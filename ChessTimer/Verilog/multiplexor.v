`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
// 
// Create Date:    08/05/2018 
// Module Name:     multiplexor
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module multiplexor(
	input clk,
	input wire [4:0] min1,
	input wire [4:0] seg1,
	input wire [4:0] min2,
	input wire [4:0] seg2,
	output lcd
    );

wire clkOut;

divFrec #(100) divFrec2 (
	.enable(1'b1),
	.clkIn(clk),
	.clkOut(clkOut)
);

LCDmult LDCmult0 (
	.clk(clkOut),
	.min1(min1),
	.seg1(seg1),
	.min2(min2),
	.seg2(seg2),
	.lcd(lcd)
);

endmodule
