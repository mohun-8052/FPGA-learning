module seg_led_static_top(
	input         sys_clk,
	input 		  rst_n,
	
	output [7:0]  seg_led,
	output [5:0]  sel
);

wire 	flag;

time_cnt u_time_cnt(
	.sys_clk      (sys_clk),
	.rst_n        (rst_n),
	
	.flag         (flag),
);

seg_led_static u_seg_led_static(
	.sys_clk     (sys_clk),
	.rst_n       (rst_n),
	
	.flag        (flag),
	.seg_led     (seg_led),        //数码管段选
	.sel         (sel)         //数码管位选
);
endmodule
