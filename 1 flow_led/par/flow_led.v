module flow_led(
	input            sys_clk,
	input            rst_n,
	
	output reg [3:0] led
);
 
reg [23:0] cnt;

always @(posedge sys_clk or negedge rst_n)
begin
	if(!rst_n)
		cnt <= 24'd0;
	else 
		if(cnt < 24'd10000000)
			cnt <= cnt + 1'b1;
		else
			cnt <= 24'd0;
end

always @(posedge sys_clk or negedge rst_n)
begin
	if(!rst_n)
		led <= 4'b0001;
	else 
		if(cnt == 24'd10000000)
			led <= {led[2:0],led[3]};
		else 
			led <= led;
end

endmodule

