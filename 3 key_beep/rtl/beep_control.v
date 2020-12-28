module beep_control(
	input sys_clk,
	input rst_n,
	
	input key_flag,
	input key_value,
	output reg beep
);

always @(posedge sys_clk or negedge rst_n) 
begin
	if(!rst_n)
		beep <= 1'b1;
	else
		if(key_flag & (!key_value))
			beep <= !beep;
		else
			beep <= beep;
end

endmodule
