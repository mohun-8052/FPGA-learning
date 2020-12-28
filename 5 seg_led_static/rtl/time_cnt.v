module time_cnt(
	input 		sys_clk,
	input 		rst_n,
	
	output reg	flag
);

parameter MAX_cnt = 25'd25000000;

reg [24:0] cnt;

always @(posedge sys_clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt = 25'd0;
	end
	else begin
		if(cnt < MAX_cnt - 1'b1) begin
			cnt  <= cnt + 1'b1;
			flag <= 1'b0;
		end
		else begin
			cnt <= 25'd0;
			flag <= 1'b1;
		end
	end
end


endmodule
