`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
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
	input wire reset,
	input wire set,
	input wire min,
	input wire stop,
	output wire [5:0] minOut,
	output wire [5:0] segOut
    );

counter counterMin (
	.clk(clk),
	.reset(reset),
	.set(set),
	.enable(enable),
	.add(min),
	.count(minOut)
);

counter counterSeg (
	.clk(clk),
	.reset(reset),
	.set(set),
	.enable(enable),
	.add(0),
	.count(segOut)
);

endmodule
