module count(
	input 						sys_clk,
	input 						rst_n,
	
	output 	reg					en,    			// enable bit
	output 	reg					sign,				// sign bit : + sign and - sign
	output 	reg 	[19:0] 	date,  			// reg have 6 num --> max=999999-->need 20 b
	output 	reg 	[ 5:0] 	point          // 6 point need 6 b,high is point
);

//                 parameter define
parameter MAX_NUM = 23'd5000_000;

//                    reg define
reg 	[22:0] 		cnt;                    //10ms
reg 					flag;							//flag sign

//**************************************************
//***********          main code
//**************************************************

always @(posedge sys_clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt 	<= 		 23'd0;
		flag 	<=			  1'b0;
	end
	else if(cnt < MAX_NUM - 1'b0) begin
		cnt   <=   cnt + 1'b1;
		flag  <=   		  1'b0;
	end
	else begin
		cnt   <= 		 23'd0;
		flag  <=         1'b1;
	end
end

always @(posedge sys_clk or negedge rst_n) begin
	if(!rst_n) begin
		en    <= 		  1'b0;
		sign  <=         1'b0;
		point <=	  6'b000_000;
		date  <= 	    20'd0;
	end
	else begin
		en    <= 		  1'b1;
		sign  <=         1'b1;
		point <=	  6'b000_000;
		if(flag) begin
			if(date < 20'd999_999)
				date <= date + 1'b1;
			else
				date <=       20'd0;
		end
	end
end

endmodule