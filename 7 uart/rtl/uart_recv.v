module uart_recv(
	input 				sys_clk,
	input					sys_rst_n,
	
	input 				uart_rxd,
	output reg 			uart_done,
	output reg [7:0]	uart_date
);

//parameter define
parameter 	CLK_FREQ = 50000000;                       //50MHz时钟
parameter 	UART_BPS = 9600;                           //波特率设置为9600
localparam 	BPS_CNT 	= CLK_FREQ/UART_BPS;              //一个数据需要计数几个时钟周期

//reg define
reg 			uart_rxd_d0;                               //用于边沿检测
reg 			uart_rxd_d1;                               //用于边沿检测
reg [15:0] 	clk_cnt;                                   //系统时间计数
reg [ 3:0] 	rx_cnt;                                    //数据位计数
reg 			rx_flag;                                   //接收状态标志
reg [ 7:0] 	rxdate;                                    //串行临时数据接收

//wire define
wire 			start_flag;                                //边沿检测结果



//进行边缘检测
assign start_flag = uart_rxd_d1 & (~ uart_rxd_d0);

always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		uart_rxd_d0 <= 1'b0;
		uart_rxd_d1 <= 1'b0;
	end
	else begin
		uart_rxd_d0 <= uart_rxd;
		uart_rxd_d0 <= uart_rxd_d0;
	end
end


//边沿检测成功后，进入接收过程
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) 
		rx_flag <= 1'b0;
	else begin
		if(start_flag)
			rx_flag <= 1'b1;
		else 
			if((rx_cnt == 4'd9) &&(clk_cnt == BPS_CNT/2))
				rx_flag <= 1'b0;
			else
				rx_flag <= rx_flag;
	end
end

//设置接收数据的计时时钟并且计算接收数据数
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		clk_cnt <= 1'b0;
		rx_cnt  <= 1'b0;
	end
	else begin
		if(rx_flag) begin
			if(clk_cnt < BPS_CNT -1) begin
				rx_cnt  <= rx_cnt;
				clk_cnt <= clk_cnt + 1'b0;
			end
			else begin
				rx_cnt  <= rx_cnt + 1'b1;
				clk_cnt <= 16'b0;
			end
		end
		else begin
			rx_cnt  <=  4'b0;
			clk_cnt <= 16'b0;
		end
	end
end

//串行数据的接收
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) 
		rxdate <= 8'b0;
	else if(rx_flag) 
		if(clk_cnt == BPS_CNT/2) begin
			case (rx_cnt)
				4'd1: rxdate[0] <= uart_rxd;
				4'd2: rxdate[1] <= uart_rxd;
				4'd3: rxdate[2] <= uart_rxd;
				4'd4: rxdate[3] <= uart_rxd;
				4'd5: rxdate[4] <= uart_rxd;
				4'd6: rxdate[5] <= uart_rxd;
				4'd7: rxdate[6] <= uart_rxd;
				4'd8: rxdate[7] <= uart_rxd;
				default: rxdate <= rxdate;
			endcase
		end
		else 
			rxdate <= rxdate;
	else
		rx_date <= 8'd0;	
end

//串行数据转存，标志接收结束
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		uart_date <= 8'd0;
		uart_done <= 1'b0;
	end
	else if(rx_cnt == 4'd9) begin
		uart_date <= rx_date;
		uart_done <= 1'b1;
	end
	else begin
		uart_date <= 8'b0;
		uart_done <= 1'b0;
	end
end

endmodule