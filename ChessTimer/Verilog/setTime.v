`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
// 
// Create Date:    08/05/2018 
// Module Name:    setTime 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module setTime(
	input wire enable,
	input wire add,
	output wire [5:0] min
    );

reg [5:0] minReg;

initial
begin
	minReg <= 6'd5;
end

always @(posedge add)
begin
	if(enable==1'b1) begin
		if (minReg == 6'd59) minReg <= 6'd0;
		else minReg <= minReg + 1'b1;
	end
end

assign min = minReg;

endmodule
