`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
// 
// Create Date:    08/05/2018 
// Module Name:    counterSeg 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//
//////////////////////////////////////////////////////////////////////////////////
module counterSeg(
	input	wire	clk,
	input wire	enable,
	input wire	reset,
	output wire	[5:0] counter,
	output wire	carry
);

reg [5:0]	counterReg = 6'b000000;
reg			state = 1'b0;
reg			carryReg = 1'b0;

always @(posedge enable) begin
	state <= !state;
end

always @(posedge clk) begin
	case(state)
		1'b0: begin
					counterReg<= counterReg;
					carryReg<= carryReg;
				end
		1'b1: begin
					counterReg <= counterReg - 6'b000001;
					if(counter == 6'b000000)
					begin
						counterReg<=6'b111100;
						carryReg<= !carryReg;
					end
				end
	endcase
end

assign counter = counterReg;
assign carry = carryReg;

endmodule
