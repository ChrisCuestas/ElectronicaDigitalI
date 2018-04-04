`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: Universidad Nacional del Colombia
// Subject: Laboratorio de Electrónica Digital I 2018-01 Grupo 2016498-1
// Student: Christian Camilo Cuestas, Eliana Ortiz García y Juan David Gonzalez Muñoz
// 
// Create Date:    09:27:06 03/20/2018 
// Design Name: Sumador de 3 bits
// Module Name:    sumador3bit 
// Project Name: Laboratorio 2
// Target Devices: Nexys 4
// Tool versions: Nexys 4
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module sumador3bit(
   output reg [6:0] disp,
	input [0: 2] A, B,
	input [0:7] anodes, 
);
   reg [0: 3] SUM;
   
	always@(*)
	begin
		SUM <= A + B;
	end
	
	always @(SUM)
	begin
		//Para mostrar la suma en hexadecimal en el display 7-seg
		case( SUM )
			4'b0000: disp <= 7'b0100000;
			4'b0001: disp <= 7'b1111001;
			4'b0010: disp <= 7'b0100100;
			4'b0011: disp <= 7'b0000110;
			4'b0100: disp <= 7'b0011001;
			4'b0101: disp <= 7'b0010010;
			4'b0110: disp <= 7'b0000010;
			4'b0111: disp <= 7'b1111000;
			4'b1000: disp <= 7'b0000000;
			4'b1001: disp <= 7'b0010000;
			4'b1010: disp <= 7'b0001000;
			4'b1011: disp <= 7'b0000011;
			4'b1100: disp <= 7'b1000110;
			4'b1101: disp <= 7'b0100001;
			4'b1110: disp <= 7'b0000110;
			default: disp <= 7'b1111111;
		endcase
		anodes <= 8'b00000001;	//Para que sólo prenda el dígito de la derecha
	end
endmodule
