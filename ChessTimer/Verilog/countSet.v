`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
// 
// Create Date:    08/05/2018 
// Module Name:     countSet
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module countSet(
	input wire enable,
	input wire sw0,
	input wire sw1,
	input clk,
	input wire set,
	input wire min,
	output wire [4:0] min1,
	output wire [4:0] seg1,
	output wire [4:0] min2,
	output wire [4:0] seg2
    );
	 
wire clkOut;

divFrec #(60) divFrec1 (
	.enable(enable),
	.clkIn(clk),
	.clkOut(clkOut)
);

countDown countDown1 (
	.clk(clkOut),
	.enable(enable),
	.set(set),
	.min(min),
	.stop(sw0),
	.minOut(min1),
	.segOut(seg1)
);

countDown countDown2 (
	.clk(clkOut),
	.enable(enable),
	.set(set),
	.min(min),
	.stop(sw1),
	.minOut(min2),
	.segOut(seg2)
);
endmodule
