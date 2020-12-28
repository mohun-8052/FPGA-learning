//50MHz=>20ns
//1ms=1*10^6ns

module key_debounce(
	input 		  sys_clk,
	input         rst_n,
	
	input         key,
	output reg    key_value,
	output reg    key_flag
	
);

reg           key_reg;
reg [19:0]	delay_cnt;  //延时20ms

always @(posedge sys_clk or negedge rst_n)
begin
	if(!rst_n) 
	begin
		key_reg <= 1'b1;
		delay_cnt <= 20'd0;
	end
	else begin
		key_reg <= key;
		if(key != key_reg)
			delay_cnt <= 20'd1000000;
		else begin 
			if(delay_cnt > 20'd0)
				delay_cnt <= delay_cnt - 1'b1;
			else 
				delay_cnt <= 20'd0;
		end
	end
end

always @(posedge sys_clk or negedge rst_n)
begin
	if(!rst_n) 
	begin
		key_value <= 1'b1;
		key_flag <= 1'b0;
	end
	else begin
		if(delay_cnt == 20'd1)
		begin
			key_flag <= 1'b1;
			key_value <= key;
		end
		else begin
			key_flag <= 1'b0;
			key_value <= key_value;
		end 
	end
end

endmodule
