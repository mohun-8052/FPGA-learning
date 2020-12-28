`timescale 1ns/1ns  

module flow_led_tb;

parameter T = 20;

reg 		sys_clk;
reg		rst_n;

wire [3:0]	led;

initial begin
	sys_clk   = 1'b0;
	rst_n = 1'b0;
	#100
	rst_n = 1'b1;
end

always #(T/2) sys_clk = ~sys_clk;

flow_led u_flow_led(
	.sys_clk	(sys_clk),
	.rst_n		(rst_n),
	.led		(led)
);
endmodule
