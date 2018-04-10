`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: Universidad Nacional del Colombia
// Subject: Laboratorio de Electrónica Digital I 2018-01 Grupo 2016498-1
// Student: Christian Camilo Cuestas, Eliana Ortiz García y Juan David Gonzalez Muñoz
// 
// Create Date:    09:45:51 04/09/2018 
// Design Name: 	Bit de paridad de dos numeros binarios concatenados
// Module Name:    parity3bit 
// Project Name: Laboratorio 2
// Target Devices: Nexys 4
// Tool versions: Nexys 4
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module parity3bit(
	output reg [6:0] disp,
	input [0: 2] A, B,
	output reg [0:7] anodes 
    );
	 
	reg [0: 5] CONC;
	wire PAR;
   
	always@(A,B) //Concatenar
	begin
		CONC <= {A,B};
	end
	
	paridadBit paridadBit0 ( .cadena(CONC),	.paridad(PAR));
	
	always @(PAR)
	begin
		if(PAR==1'b0)
			disp <= 7'b1000000;
		else
			disp <= 7'b1111001;
			
		anodes <= 8'b11111110;	//Para que sólo prenda el dígito de la derecha
	end

endmodule

