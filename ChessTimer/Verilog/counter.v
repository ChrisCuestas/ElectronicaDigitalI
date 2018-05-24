`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas Ibanez
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
	input wire	[7:0]	TIME,
	output wire	[7:0]	min,
	output wire	[7:0] sec
);

reg [6:0]	counter	= 7'b0000000;
reg [7:0]	minReg	= 8'b00000000;
reg [7:0]	secReg	= 8'b00000000;


always @(posedge clk, negedge enable, posedge reset) 
begin
	if(reset)
	begin
		counter	<= 7'b0000000;
		minReg	<= 8'b00000000;
		secReg	<= 8'b00000000;
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
			if(minReg==8'b00000000 && secReg==8'b00000000)
			begin
				minReg <= TIME;
			end
			if(counter == 7'd100)
			begin
				counter <= 7'b0000000;
				if(secReg==8'b00000000) 
				begin
					//minReg <= minReg - 1
					if (minReg[3:0]==0) begin
						minReg[3:0]	<=9;
						if (minReg[7:4]==0) begin
							minReg[7:4] <=5;
						end
						else minReg[7:4] <= minReg[7:4] - 4'd1;
					end
					else minReg[3:0] <= minReg[3:0] - 4'd1;
					
					secReg <= {4'd5,4'd9};
				end
				else begin
					//secReg <= secReg-6'b000001;
					if (secReg[3:0]==0) begin
						secReg[3:0]	<=9;
						if (secReg[7:4]==0) begin
							secReg[7:4] <=5;
						end
						else secReg[7:4] <= secReg[7:4] - 4'd1;
					end
					else secReg[3:0] <= secReg[3:0] - 4'd1;
				end
			end
			else counter <= counter + 7'b0000001;
		end
	end
end

assign min = minReg;
assign sec = secReg;

endmodule
