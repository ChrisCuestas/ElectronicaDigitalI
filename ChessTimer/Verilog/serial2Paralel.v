`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas Ibanez
// 
// Create Date:    08/05/2018 
// Module Name:    dataControl 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module serial2Paralel(
	input	wire		clk,
	input wire		dReady,
	input	wire [23:0]	dataIn,
	input	wire		ldcReady,
	output	reg	dataOut,
	output	reg [1:0]	OPER,
	output	reg	ENB,
	output	reg	RST
    );


endmodule
