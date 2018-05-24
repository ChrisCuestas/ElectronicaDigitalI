`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas Ibanez
// 
// Create Date:    08/05/2018 
// Module Name:    dataSender 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module dataSender(
	input	wire		clk,
	input	wire [31:0]	dataIn,
	input	wire		lcdReady,
	output	reg [7:0]	dataOut,
	output	reg [1:0]	OPER,
	output	reg	ENB,
	output	reg	RST
    );

//===============================================================================================
//-------------------------------------Instructions----------------------------------------------
//===============================================================================================
parameter [7:0] SETUP		= 8'b00111000;		//Execution time = 42us, sets to 8-bit interface, 2-line display, 5x7 dots
parameter [7:0] DISP_ON		= 8'b00001100;		//Execution time = 42us, Turn ON Display
parameter [7:0] ALL_ON		= 8'b00001111;		//Execution time = 42us, Turn ON All Display
parameter [7:0] ALL_OFF		= 8'b00001000;		//Execution time = 42us, Turn OFF All Display
parameter [7:0] CLEAR 		= 8'b00000001; 	//Execution time = 1.64ms, Clear Display
parameter [7:0] ENTRY_N		= 8'b00000110;		//Execution time = 42us, Normal Entry, Cursor increments, Display is not shifted
parameter [7:0] HOME 		= 8'b00000010; 	//Execution time = 1.64ms, Return Home
parameter [7:0] C_SHIFT_L 	= 8'b00010000; 	//Execution time = 42us, Cursor Shift
parameter [7:0] C_SHIFT_R 	= 8'b00010100; 	//Execution time = 42us, Cursor Shift
parameter [7:0] D_SHIFT_L 	= 8'b00011000; 	//Execution time = 42us, Display Shift
parameter [7:0] D_SHIFT_R 	= 8'b00011100; 	//Execution time = 42us, Display Shift

//===============================================================================================
//--------------------------------------Characters-----------------------------------------------
//===============================================================================================
parameter [7:0] DOUBLE_DOT = 8'b00111010;


//##########################################################################################
//-----------------------------Create the STATE MACHINE------------------------------------
//##########################################################################################
reg [3:0] 	STATE 			= 2'd0;
reg 			SUBSTATE 		= 0;
reg [3:0] 	char			= 4'd0;
reg [3:0] 	lastChar			= 4'd0;

always @(posedge clk) begin
	if (lcdReady==1'b1)
	begin
		case(STATE)
			0:	begin								//Inicio
					dataOut 	<= 0;
					OPER		<= 2'd2;
					ENB		<= 0;
					RST		<= 0;
					
					STATE				<=	STATE + 4'd1;				//Go to next STATE
					SUBSTATE			<=	1'b0;
				end
			1:	begin															//Write character
					ENB	<= 1;
					RST	<= 0;
					
					if(SUBSTATE==1'b0) begin							//Write the instruction ENTRY_N
						OPER		<= 2'd2;
						dataOut	<= ENTRY_N;
						
						STATE				<=	STATE ;					
						SUBSTATE			<=	1'b1;						//Go to next SUBSTATE
					end
					else													//Write the 1st char
					begin
						OPER		<= 2'd1;
						dataOut 	<= {4'b0011,dataIn[3:0]};
						STATE				<=	STATE + 4'd1;			//Go to next STATE
						SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					end
				end
			2:	begin															//Write character
					ENB	<= 1;
					RST	<= 0;
					
					if(SUBSTATE==1'b0) begin							//Write the instruction ENTRY_N
						OPER		<= 2'd2;
						dataOut	<= ENTRY_N;
						
						STATE				<=	STATE ;					
						SUBSTATE			<=	1'b1;						//Go to next SUBSTATE
					end
					else													//Write the 2nd char
					begin
						OPER		<= 2'd1;
						dataOut 	<= {4'b0011,dataIn[7:4]};
						STATE				<=	STATE + 4'd1;			//Go to next STATE
						SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					end
				end
			3:	begin
					ENB	<= 1;
					RST	<= 0;
					
					if(SUBSTATE==1'b0) begin							//Write the instruction ENTRY_N
						OPER		<= 2'd2;
						dataOut	<= ENTRY_N;
						
						STATE				<=	STATE ;					
						SUBSTATE			<=	1'b1;						//Go to next SUBSTATE
					end
					else													//Write the : char
					begin
						OPER		<= 2'd1;
						dataOut 	<= DOUBLE_DOT;
						STATE				<=	STATE + 4'd1;			//Go to next STATE
						SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					end
				end
			4:	begin
					ENB	<= 1;
					RST	<= 0;
					
					if(SUBSTATE==1'b0) begin							//Write the instruction ENTRY_N
						OPER		<= 2'd2;
						dataOut	<= ENTRY_N;
						
						STATE				<=	STATE ;					
						SUBSTATE			<=	1'b1;						//Go to next SUBSTATE
					end
					else													//Write the 3rd char
					begin
						OPER		<= 2'd1;
						dataOut 	<= {4'b0011,dataIn[11:8]};
						STATE				<=	STATE + 4'd1;			//Go to next STATE
						SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					end
				end
			5:	begin
					ENB	<= 1;
					RST	<= 0;
					
					if(SUBSTATE==1'b0) begin							//Write the instruction ENTRY_N
						OPER		<= 2'd2;
						dataOut	<= ENTRY_N;
						
						STATE				<=	STATE ;					
						SUBSTATE			<=	1'b1;						//Go to next SUBSTATE
					end
					else													//Write the 4th char
					begin
						OPER		<= 2'd1;
						dataOut 	<= {4'b0011,dataIn[15:12]};
						STATE				<=	STATE + 4'd1;			
						SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					end
				end
			6:	begin
					ENB	<= 1;
					RST	<= 0;
					OPER		<= 2'd2;
					dataOut	<= C_SHIFT_L;								//Write the instruction C_SHRIFT_L
					
					STATE				<=	STATE + 4'd1;					//Go to next STATE
					SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
				end
			7:	begin
					ENB	<= 1;
					RST	<= 0;
					
					if(SUBSTATE==1'b0) begin							//Write the instruction ENTRY_N
						OPER		<= 2'd2;
						dataOut	<= ENTRY_N;
						
						STATE				<=	STATE ;					
						SUBSTATE			<=	1'b1;						//Go to next SUBSTATE
					end
					else													//Write the 5th char
					begin
						OPER		<= 2'd1;
						dataOut 	<= {4'b0011,dataIn[19:16]};
						STATE				<=	STATE + 4'd1;			
						SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					end
				end
			8:	begin
					ENB	<= 1;
					RST	<= 0;
					
					if(SUBSTATE==1'b0) begin							//Write the instruction ENTRY_N
						OPER		<= 2'd2;
						dataOut	<= ENTRY_N;
						
						STATE				<=	STATE ;					
						SUBSTATE			<=	1'b1;						//Go to next SUBSTATE
					end
					else													//Write the 6th char
					begin
						OPER		<= 2'd1;
						dataOut 	<= {4'b0011,dataIn[23:20]};
						STATE				<=	STATE + 4'd1;			
						SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					end
				end
			9:	begin
					ENB	<= 1;
					RST	<= 0;
					
					if(SUBSTATE==1'b0) begin							//Write the instruction ENTRY_N
						OPER		<= 2'd2;
						dataOut	<= ENTRY_N;
						
						STATE				<=	STATE ;					
						SUBSTATE			<=	1'b1;						//Go to next SUBSTATE
					end
					else													//Write the : char
					begin
						OPER		<= 2'd1;
						dataOut 	<= DOUBLE_DOT;
						STATE				<=	STATE + 4'd1;			//Go to next STATE
						SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					end
				end
			10:	begin
					ENB	<= 1;
					RST	<= 0;
					
					if(SUBSTATE==1'b0) begin							//Write the instruction ENTRY_N
						OPER		<= 2'd2;
						dataOut	<= ENTRY_N;
						
						STATE				<=	STATE ;					
						SUBSTATE			<=	1'b1;						//Go to next SUBSTATE
					end
					else													//Write the 7th char
					begin
						OPER		<= 2'd1;
						dataOut 	<= {4'b0011,dataIn[27:24]};
						STATE				<=	STATE + 4'd1;			
						SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					end
				end
			11:	begin
					ENB	<= 1;
					RST	<= 0;
					
					if(SUBSTATE==1'b0) begin							//Write the instruction ENTRY_N
						OPER		<= 2'd2;
						dataOut	<= ENTRY_N;
						
						STATE				<=	STATE ;					
						SUBSTATE			<=	1'b1;						//Go to next SUBSTATE
					end
					else													//Write the 8th char
					begin
						OPER		<= 2'd1;
						dataOut 	<= {4'b0011,dataIn[31:28]};
						STATE				<=	STATE + 4'd1;			
						SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					end
				end
			12:	begin
					ENB	<= 1;
					RST	<= 0;
					OPER		<= 2'd2;
					dataOut	<= CLEAR;
					
					STATE				<=	4'd1;					
					SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
					
				end
			default: begin
					STATE				<=	4'd0;			
					SUBSTATE			<=	1'b0;						//Go to next SUBSTATE
				end
		endcase
	end
	else
	begin
		dataOut 	<= dataOut;
		OPER		<= OPER;
		ENB		<= ENB;
		RST		<=	RST;
		STATE		<=	STATE;
		SUBSTATE	<=	SUBSTATE;
	end
end
endmodule
