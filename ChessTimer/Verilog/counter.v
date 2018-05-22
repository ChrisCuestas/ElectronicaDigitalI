`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
// 
// Create Date:    08/05/2018 
// Module Name:    counter 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module counter(
	input	wire	clk,
	input wire	enable,
	input wire	reset,
	input wire	[5:0]	TIME,
	output wire	[5:0]	min,
	output wire	[5:0] sec
);

reg [6:0]	counter	= 7'b0000000;
reg [5:0]	minReg	= 6'b000000;
reg [5:0]	secReg	= 6'b000000;


always @(posedge clk, negedge enable, posedge reset) 
begin
	if(reset)
	begin
		counter	<= 7'b0000000;
		minReg	<= 6'b000000;
		secReg	<= 6'b000000;
	end
	else
	begin
		if (!enable)
		begin
			counter<= counter;
			minReg <= minReg;
			secReg <= secReg;
		end
		else
		begin
			if(minReg==6'b000000 && secReg==6'b000000)
			begin
				minReg <= TIME;
			end
			if(counter == 7'd100)
			begin
				counter <= 7'b0000000;
				if(secReg==6'b000000) 
				begin
					minReg <= minReg-6'b000001;
					secReg <= 6'd59;
				end
				else secReg <= secReg-6'b000001;
			end
			else counter <= counter + 7'b0000001;
		end
	end
end

assign min = minReg;
assign sec = secReg;

endmodule
