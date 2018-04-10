`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Institute: Universidad Nacional del Colombia
// Subject: Laboratorio de Electrónica Digital I 2018-01 Grupo 2016498-1
// Student: Christian Camilo Cuestas, Eliana Ortiz García y Juan David Gonzalez Muñoz
// 
// Create Date:    15:40:00 04/04/2018 
// Design Name: Restador de 3 bits
// Module Name:    restador3bit 
// Project Name: Laboratorio 2
// Target Devices: Nexys 4
// Tool versions: Nexys 4
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module restador3bit(
   output reg [7:0] disp,
	input [0: 2] A, B,
	output reg [0:7] anodes 
);
	reg [0: 3] RES;
	reg sign =1'b1;
   
	always@(*)
	begin
		if(A>B)
			RES <= A - B;
		else
		begin
			RES <= B - A;
			sign <= 1'b1;
		end
	end
	
	always @(RES)
	begin
		//Para mostrar la resta en hexadecimal en el display 7-seg
		case( {sign,RES} )
			5'b00000: disp <= 7'b1000000;
			5'b00001: disp <= 7'b1111001;
			5'b00010: disp <= 7'b0100100;
			5'b00011: disp <= 7'b0110000;
			5'b00100: disp <= 7'b0011001;
			5'b00101: disp <= 7'b0010010;
			5'b00110: disp <= 7'b0000010;
			5'b00111: disp <= 7'b1111000;
			5'b01000: disp <= 7'b0000000;
			5'b01001: disp <= 7'b0010000;
			5'b01010: disp <= 7'b0001000;
			5'b01011: disp <= 7'b0000011;
			5'b01100: disp <= 7'b1000110;
			5'b01101: disp <= 7'b0100001;
			5'b01110: disp <= 7'b0000110;
			5'b10000: disp <= 8'b01000000;
			5'b10001: disp <= 8'b01111001;
			5'b10010: disp <= 8'b00100100;
			5'b10011: disp <= 8'b00110000;
			5'b10100: disp <= 8'b00011001;
			5'b10101: disp <= 8'b00010010;
			5'b10110: disp <= 8'b00000010;
			5'b10111: disp <= 8'b01111000;
			5'b11000: disp <= 8'b00000000;
			5'b11001: disp <= 8'b00010000;
			5'b11010: disp <= 8'b00001000;
			5'b11011: disp <= 8'b00000011;
			5'b11100: disp <= 8'b01000110;
			5'b11101: disp <= 8'b00100001;
			5'b11110: disp <= 8'b00000110;
			default: disp <= 7'b1111111;
		endcase
		anodes <= 8'b11111110;	//Para que sólo prenda el dígito de la derecha
	end
endmodule
