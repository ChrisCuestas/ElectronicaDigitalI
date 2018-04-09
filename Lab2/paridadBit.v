`timescale 1ns / 1ps

module paridadBit #(parameter length = 2)(
		input [0:length-1] cadena,
		output reg [0:0] paridad
    );
	 
	 reg parBit=1'b0;
	 integer index;
	 
	 always @(cadena)
	 begin
		parBit <= cadena[0];
		for(index = 1; index < length; index = index + 1)
		begin
			parBit<= parBit^cadena[index];
		end
		paridad <= parBit;
	 end
endmodule
