`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: Universidad Nacional del Colombia
// Subject: Laboratorio de Electrónica Digital I 2018-01 Grupo 2016498-1
// Student: Christian Camilo Cuestas, Eliana Ortiz García y Juan David Gonzalez Muñoz
// 
// Create Date:    09:27:06 03/20/2018 
// Design Name: Comparador de 3 bits
// Module Name:    comparador3bit 
// Project Name: Laboratorio 2
// Target Devices: Nexys 4
// Tool versions: Nexys 4
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module comparador3bit(
	output reg [6:0] disp,
	input [0: 2] A, B,
	output reg [0:7] anodes 
    );
	reg [0: 3] RES;
   
	always@(*)
	begin
		if(A>B)
			RES <= {1'b0,A};
		else
			if(B>A)
				RES <= {1'b0,B};
			else
				RES <= 4'b1000;
	end
	
	always @(RES)
	begin
		case( RES )
			4'b0000: disp <= 7'b0100000;
			4'b0001: disp <= 7'b1111001;
			4'b0010: disp <= 7'b0100100;
			4'b0011: disp <= 7'b0000110;
			4'b0100: disp <= 7'b0011001;
			4'b0101: disp <= 7'b0010010;
			4'b0110: disp <= 7'b0000010;
			4'b0111: disp <= 7'b1111000;
			4'b1000: disp <= 7'b0110111;	//Muestra el =, si los numeros son iguales
			default: disp <= 7'b1111111;	//El display se apaga
		endcase
		anodes <= 8'b00000001;	//Para que sólo prenda el dígito de la derecha
	end

endmodule
