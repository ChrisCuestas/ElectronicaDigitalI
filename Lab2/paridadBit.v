`timescale 1ns / 1ps

module paridadBit #(parameter length = 6)(
		input [0:length-1] cadena,
		output reg [0:0] paridad
    );
	 
	 always @(cadena)
	 begin
		paridad<= cadena[0]^cadena[1]^cadena[2]^cadena[3]^cadena[4]^cadena[5];
	 end
endmodule
