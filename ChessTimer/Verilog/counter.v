`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
// 
// Create Date:    08/05/2018 
// Module Name:    counterMin 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module counter(
	input	wire	clk,
	input wire	enable,
	input wire	[5:0]	TIME,
	output wire	[5:0]	min,
	output wire	[5:0] sec
);

reg [5:0]	minReg = 6'b111111;
reg [5:0]	secReg = 6'b000000;

initial
begin
	minReg = TIME;
end

always @(posedge clk) 
begin
	if(enable==1'b1)
	begin
		if(secReg==6'b000000) begin
				if(minReg==6'b000000) 
				begin
					minReg <= minReg;
					secReg <= secReg;
				end
				else begin
					minReg <= minReg-6'b000001;
					secReg <= 6'd59;
				end
			end
		else secReg <= secReg-6'b000001;
	end
end

assign min = minReg;
assign sec = secReg;

endmodule
