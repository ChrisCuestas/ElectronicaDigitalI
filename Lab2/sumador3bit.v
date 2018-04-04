`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:27:06 03/20/2018 
// Design Name: 
// Module Name:    sumador3bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sumador3bit(
   output reg [6:0] disp,
	input [0: 2] A, B
);
   reg [0: 3] SUM;
	always@(*)
	begin
		SUM <= A + B;
	end
	
	always @(SUM)
	begin
		case( SUM )
			4'b0000: disp <= 7'b0000001;
			4'b0001: disp <= 7'b1001111;
			4'b0010: disp <= 7'b0010010;
			4'b0011: disp <= 7'b0000110;
			4'b0100: disp <= 7'b1001100;
			4'b0101: disp <= 7'b0100100;
			4'b0110: disp <= 7'b0100000;
			4'b0111: disp <= 7'b0001111;
			4'b1000: disp <= 7'b0000000;
			4'b1001: disp <= 7'b0000100;
			4'b1010: disp <= 7'b0001000;
			4'b1011: disp <= 7'b1100000;
			4'b1100: disp <= 7'b0110001;
			4'b1101: disp <= 7'b1000010;
			4'b1110: disp <= 7'b0110000;
		endcase
	end
endmodule
