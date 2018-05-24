`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas Ibanez
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
	output reg [7:0] min
    );

reg [3:0] decReg;
reg [3:0] uniReg;

initial
begin
	decReg <= 0;
	uniReg <= 5;
end

always @(posedge add)
begin
	if (enable==1) begin
		if (uniReg==9) begin
			uniReg	<=0;
			if (decReg==5) begin
				decReg <=0;
			end
			else decReg <= decReg+ 4'd1;
		end
		else uniReg <= uniReg + 4'd1;
	end
	min <= {decReg,uniReg};
end

endmodule
