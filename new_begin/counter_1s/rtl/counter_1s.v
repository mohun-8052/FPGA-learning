module	counter_1s(
	input 	wire	sys_clk,
	input		wire	sys_rst_n,

	output	reg	led_out	
);


always @(posedge	sys_clk or	negedge	sys_rst_n) begin
	if(!sys_rst_n)
		
	
end


endmodule
