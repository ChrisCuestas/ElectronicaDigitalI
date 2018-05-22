`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Nacional de Colombia
// Students: Christian Camilo Cuestas Ibanez
// 
// Create Date:    08/05/2018 
// Module Name:    visualizador 
// Project Name:  Proyecto Digital I: Reloj de Ajedrez
// Target Devices: Nexys 4
// Description:
//
//////////////////////////////////////////////////////////////////////////////////
module visualizador(
	input	wire				clk,
	input	wire				setTime,
	input	wire	[5:0]		timeIn,
	input	wire	[23:0]	countedTime,
	output wire				LCD_RS,
	output wire				LCD_RW,
	output wire				LCD_E,
	output wire	[7:0]		LCD_DB
    );

wire clkOut; 

wire 	dReady;
wire	dataIn;

wire	ldcReady;
wire	dataOut;
	 
divFrec divFrec1 (
	.clkIn(clk),
	.clkOut2(clkOut)
);

dataControl dataControl0(
	.setTime(setTime),
	.timeIn(timeIn),
	.countedTime(countedTime),
	.done(dReady),
	.dataOut(dataIn)
);

serial2Paralel serial2Paralel(
	.clk(clkOut),
	.dReady(dReady),
	.dataIn(dataIn),
	.ldcReady(ldcReady),
	.dataOut(dataOut),
	.OPER(OPER),
	.ENB(ENB),
	.RST(RST)
);

FPGA_2_LCD FPGA2LCD0 (
	.CLK(clkOut), 
	.LCD_RS(LCD_RS), 
	.LCD_RW(LCD_RW), 
	.LCD_E(LCD_E), 
	.LCD_DB(LCD_DB), 
	.RDY(ldcReady), 
	.DATA(dataOut), 
	.OPER(OPER), 
	.ENB(ENB), 
	.RST(RST)
);

endmodule
