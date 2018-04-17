module contador
(
	input           clk,
//	input           btn,
	input				 reset,
	input 	[2:0]	 sw,
	output   [6:0]  seg,
	output   [3:0]  an
);

wire [3:0]  counter;
reg  [3:0]   d1;
reg  [3:0]   d2;
reg  [3:0]   d3;
reg  [3:0]   d4;
//reg          counting;

sevenseg sevenseg0 (
	.clk1      ( clk    ),
	.digit0    ( d4   ),
	.digit1    ( d3   ),
	.digit2    ( d2   ),
	.digit3    ( d1   ),
	.seg1      ( seg    ),
	.an1       ( an     )
);

counter counter0 (
	.clk(clk),
	.sw (sw),
	.reset(reset),
	.led(counter)
);

/*always @(posedge btn) begin
	counting <= ~counting;
end*/

always @(counter) begin
	//if (counting == 1'b1) begin
		d1 <= counter;

		if (d1 == 4'hA) begin
			d2 <= d2 + 1;
			d1 <= 0;
		end

		if (d2 == 4'hA) begin
			d3 <= d3 + 1;
			d2 <= 0;
		end

		if (d3 == 4'hA) begin
			d4 <= d4 + 1;
			d3 <= 0;
		end

		if (d4 == 4'hA) d4 <= 0;
	//end
end

endmodule