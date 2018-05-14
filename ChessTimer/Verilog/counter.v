`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
// 
// Create Date:    08/05/2018 
// Module Name:    countDown 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module counter(
	input	wire	clk,
	input wire	enable,
	input wire	reset,
	input	wire	set,
	input	wire	add,
	output	wire	count
);

reg [5:0]	counter;
reg			state= 1'b0;
reg			out= 1'b0;

always @(posedge enable) begin
	state <= !state;
end

always @(posedge clk, posedge add) begin
	case(set)
		1'b0: if(state==1'b1) 
				begin
					counter <= counter - 6'b000001;
					if(counter == 6'b000000)
					begin
						counter<=6'b111100;
						out<= !out;
					end
				end
		1'b1: if(state==1'b0 && set == 1'b1) 
				begin
					counter <= counter + 6'b000001;
					if(counter == 6'b111100)
					begin
						counter<=0;
						out<= !out;
					end
				end
	endcase
end

assign count = counter;
assign carry = out;

endmodule
