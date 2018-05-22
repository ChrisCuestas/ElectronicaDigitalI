`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas Ibanez 
// 
// Create Date:    08/05/2018 
// Module Name:    control 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module control(
	input		wire	enable,
	input		wire	reset,
	input 	wire	set,
	output	wire	setTime,
	output	wire	count
    );
reg enableSetTime;
reg enableCounter;
reg enableReg;
reg resetReg;

initial 
begin
	enableSetTime	<= 1'b0;
	enableCounter	<= 1'b0;
	enableReg		<= 1'b0;
	resetReg 		<= 1'b1;
end

always @(posedge enable)
begin
	enableReg <= !enableReg;
end

always @(posedge reset)
begin
	resetReg <= 1'b0;
end

always @(enableReg)
begin
	case(enableReg)
		1'b0:	begin
				enableCounter <= 1'b0;
				if(set == 1'b1) enableSetTime <= 1'b1;
				else if(resetReg == 1'b0)
					begin
						enableSetTime	<= 1'b0;
						enableCounter	<= 1'b0;
					end
				end
		1'b1:	begin
				enableSetTime	<= 1'b0;
				enableCounter	<= 1'b1;
				end
	endcase
end

assign setTime = enableSetTime;
assign count = enableCounter;

endmodule
