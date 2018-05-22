`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas  Ibanez y Eliana Ortiz García 
// 
// Create Date:    08/05/2018 
// Module Name:    timersControl
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module timersControl(
	input wire  enable,
	input wire [1:0]	player,
	output reg enable1,
	output reg enable2,
	output reg reset1,
	output reg reset2
    );

always @(enable, player)
begin
	if(enable==1'b1)
	begin
		case(player)
			2'b01:begin
						enable1	<= 1'b1;
						reset1	<= 1'b1;
						enable2	<= 1'b0;
						reset2	<= 1'b0;
					end
			2'b10:begin	
						enable1	<= 1'b0;
						reset1	<= 1'b0;
						enable2	<= 1'b1;
						reset2	<= 1'b1;
					end
			default:	begin	
						enable1	<= enable1;
						reset1	<= reset1;
						enable2	<= enable2;
						reset2	<= reset2;
					end
		endcase
	end
	else
	begin
		enable1	<= 1'b0;
		reset1	<= 1'b0;
		enable2	<= 1'b0;
		reset2	<= 1'b0;
	end
end

endmodule
