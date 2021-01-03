module uart_send(
	input 					sys_clk,
	input 					sys_rst_n,
	
	input 		[7:0]		uart_din,
	input 					uart_en,
	output reg 				uart_txd
);

//parameter define
parameter 	CLK_FREQ = 50000000;                       //50MHz时钟
parameter 	UART_BPS = 9600;                           //波特率设置为9600
localparam 	BPS_CNT 	= CLK_FREQ/UART_BPS;              //一个数据需要计数几个时钟周期

//reg define
reg 			uart_en_d0;                               //用于边沿检测
reg 			uart_en_d1;                               //用于边沿检测
reg [15:0] 	clk_cnt;                                   //系统时间计数
reg [ 3:0] 	tx_cnt;                                    //数据位计数
reg 			tx_flag;                                   //接收状态标志
reg [ 7:0] 	tx_date;                                    //串行临时数据接收

//wire define
wire 			en_flag;                                //边沿检测结果

assign en_flag = uart_en_d0 & (~ uart_en_d1);
//边沿检测
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		uart_en_d0 <= 1'b0;
		uart_en_d1 <= 1'b0;
	end
	else begin
		uart_en_d0 <= uart_en;
		uart_en_d1 <= uart_en_d0;
	end	
end

//进入发送状态，装载发送数据
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		tx_flag <= 1'b0;
		tx_date <= 8'b0;
	end
	else begin
		if(en_flag) begin
			tx_flag <= 1'b1;
			tx_date <= uart_din;
		end
		else begin
			if((tx_cnt ==4'd9) && (clk_cnt = BPS_CNT/2)) begin
				tx_flag <= 1'b0;
				tx_date <= 8'd0;
			end
			else begin
				tx_flag <= tx_flag;
				tx_date <= tx_date;
			end
		end
	end
end

//发送数据计时
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		clk_cnt <= 16'd0;
		tx_cnt  <=  4'd0;
	end
	else if(tx_flag)begin
		if(clk_cnt < BPS_CNT -1) begin
			clk_cnt <= clk_cnt + 1'b1;
			tx_cnt  <= tx_cnt;
		end
		else begin
			clk_cnt <= 16'd0;
			tx_cnt  <= tx_cnt + 1'b1
		end
	end
	else begin
		clk_cnt <= 16'd0;
		tx_cnt <= 4'd0;
	end
end

//并行数据转串行数据
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		uart_txd <= 1'b1;
	end
	else if(tx_flag)
		case(tx_cnt) 
			4'd0: uart_txd <= 1'b0;
			4'd1: uart_txd <= tx_date[0];
			4'd2: uart_txd <= tx_date[1];
			4'd3: uart_txd <= tx_date[2];
			4'd4: uart_txd <= tx_date[3];
		   4'd5: uart_txd <= tx_date[4];
			4'd6: uart_txd <= tx_date[5];
			4'd7: uart_txd <= tx_date[6];
			4'd8: uart_txd <= tx_date[7];
			default:;
		endcase
	else
		uart_txd <= 1'b1;
end

endmodule
