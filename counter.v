module counter
(
	input             clk,
	input		[2:0]		sw,
	input 				reset,
	output   [3:0]		led
);

reg [29:0] counter;

reg [3:0] cnt;

always @(sw) begin
	case (sw)
		3'b001: cnt = counter [29:26];
		3'b010: cnt = counter [26:23];
		3'b100: cnt = counter [23:20];
		default: cnt = counter [29:26];
	endcase
end

always @(posedge clk) begin
	if(reset==1'b0) counter <= counter + 1'b1;
	else counter <= 0;
end

/*always @(cnt) begin
	if (cnt == 4'b1010) begin
			cnt = 4'b0000;
	end
end*/

assign led = cnt;

endmodule