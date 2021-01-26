`timescale		1ns/1ns

module	tb_flip_flop();

reg	sys_clk;
reg	sys_rst_n;
reg	key_in;

wire	led;

initial	begin
			sys_clk 		 = 1'b1;  //时钟初始设置为1'b0, 且使用非阻塞赋值
			sys_rst_n	<= 1'b0;
			key_in		<= 1'b0;
	
	#20	sys_rst_n	<= 1'b1;
	#210	sys_rst_n	<= 1'b0;
	#40 	sys_rst_n   <= 1'b1;
	
end

always	#20	key_in	<= {$random} % 2;

always	#10 	sys_clk	 = ~sys_clk;

flip_flop	u_flip_flop(
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.key_in(key_in),
	
	.led(led)
);


endmodule
