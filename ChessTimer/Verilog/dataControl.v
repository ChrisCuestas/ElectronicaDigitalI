`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas Ibanez
// 
// Create Date:    08/05/2018 
// Module Name:    dataControl 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module dataControl(
	input	wire				setTime,
	input	wire	[5:0]		timeIn,
	input	wire	[23:0]	countedTime,
	output	reg 			done,
	output	reg [23:0]	dataOut
    );

always @(setTime)
begin
	if(setTime)
	begin
		dataOut = {timeIn,6'b000000,timeIn,6'b000000};
		done = 1;
	end
	else
	begin
		dataOut = countedTime;
		done = 1;
	end
end

endmodule
