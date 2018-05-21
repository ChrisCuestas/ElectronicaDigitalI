`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
// 
// Create Date:    08/05/2018 
// Module Name:     divFrec
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module divFrec (
	input clkIn,
	output clkOut
    );

reg [23:0] counter;

reg cnt;

always @(negedge clkIn) begin
	cnt = counter [23]; //Periodo de 10ms
end

always @(posedge clkIn) begin
	counter <= counter + 1'b1;
end

assign clkOut = cnt;

endmodule
