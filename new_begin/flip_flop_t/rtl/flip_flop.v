module flip_flop(
	input		wire		sys_clk,
	input		wire		sys_rst_n,
	input		wire 		key_in,
	
	output	reg		led
);

always @(posedge	sys_clk)	begin
	if(!sys_rst_n)
		led <= 1'b0;
	else
		led <= key_in;
end

endmodule
