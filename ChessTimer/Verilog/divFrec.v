`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas Ibanez
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
	output clkOut1,
	output clkOut2
    );

reg [23:0] counter;

reg cnt1;
reg cnt2;

always @(negedge clkIn) begin
	cnt1 = counter [23]; //Periodo de 10ms, Frecuencia de 100Hz
	cnt2 = counter [2]; 	//Periodo de 40ns, Frecuencia de 25MHz
end

always @(posedge clkIn) begin
	counter <= counter + 1'b1;
end

assign clkOut1 = cnt1;
assign clkOut2 = cnt2;

endmodule
