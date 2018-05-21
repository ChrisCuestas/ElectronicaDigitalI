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
	input wire [5:0] timeIn,
	input wire player1,
	input wire player2,
	output wire [5:0] min1,
	output wire [5:0] sec1,
	output wire [5:0] min2,
	output wire [5:0] sec2
    );

divFrec divFrec0 (
	.clkIn(clk),
	.clkOut(clkOut)
);

 
/*wire carry;

counterMin counterMin0 (
	.clk(clk),
	.enable(enable),
	.reset(reset),
	.set(set),
	.add(min),
	.counter(minOut),
	.carrySeg(carry)
);

counterSeg counterSeg0 (
	.clk(clk),
	.enable(enable),
	.reset(reset),
	.counter(segOut),
	.carry(carry)
);*/

endmodule
