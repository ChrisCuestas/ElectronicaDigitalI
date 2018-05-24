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
	input	wire	[7:0]		timeIn,
	input	wire	[31:0]	countedTime,
	output wire				LCD_RS,
	output wire				LCD_RW,
	output wire				LCD_E,
	output wire	[7:0]		LCD_DB
    );

wire clkOut; 

wire	[31:0]	dataIn;

wire	ldcReady;
wire	[7:0]	dataOut;
wire	[1:0]	OPER;
	 
divFrec divFrec1 (
	.clkIn(clk),
	.clkOut2(clkOut)
);

dataControl dataControl0(
	.setTime(setTime),
	.timeIn(timeIn),
	.countedTime(countedTime),
	.dataOut(dataIn)
);

dataSender dataSender0(
	.clk(clkOut),
	.dataIn(dataIn),
	.lcdReady(lcdReady),
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
	.RDY(lcdReady), 
	.DATA(dataOut), 
	.OPER(OPER), 
	.ENB(ENB), 
	.RST(RST)
);

endmodule
