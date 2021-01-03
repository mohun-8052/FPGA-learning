module key_led(
	input       			clk,
	input       			rst_n,
	
	input     	[3:0] 	key,
	output reg 	[3:0] 	led
);


//reg define
reg [23:0] 		cnt;
reg [ 1:0]  	led_ctrl;


//0.2s计数器
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cnt <= 24'd0;
	else
		if(cnt < 24'd10000000)
			cnt <= cnt + 1'b1;
		else
			cnt <= 24'd0;
end


//每隔0.2秒改变状态机状态
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		led_ctrl <= 2'b0;
	else
		if(cnt == 24'd10000000)
			led_ctrl <= led_ctrl + 1'b1;
		else
			led_ctrl <= led_ctrl;
end


//根据按键改变各个状态下点亮的LED
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		led <= 4'b0000;
	else
		if(key[0] == 1'b1)
			case(led_ctrl)
					2'd0:		led <= 4'b1000;
					2'd1:		led <= 4'b0100;
					2'd2:		led <= 4'b0010;
					2'd3:		led <= 4'b0001;
				default: 	led <= 4'b0000;
			endcase
		
		else if(key[1] == 1'b1)
			case(led_ctrl)
					2'd0:		led <= 4'b0001;
					2'd1:		led <= 4'b0010;
					2'd2:		led <= 4'b0100;
					2'd3:		led <= 4'b1000;
				default: 	led <= 4'b0000;
			endcase
		
		else if(key[2] == 1'b1)
			case(led_ctrl)
					2'd0:		led <= 4'b0000;
					2'd1:		led <= 4'b1111;
					2'd2:		led <= 4'b0000;
					2'd3:		led <= 4'b1111;
				default: 	led <= 4'b0000;
			endcase
		
		else if(key[3] == 1'b1)
			led <= 4'b1111;
		
		else
			led <= 4'b0000;

end

endmodule