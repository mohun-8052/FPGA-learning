module uart_top(
	input     sys_clk,
	input     sys_rst_n,
	
	input     uart_rxd,
	output    uart_txd
);

//parameter define
parameter CLK_FREQ = 50000000;
parameter UART_BPS = 115200;

//wire define
wire  uart_en_W;            //UART发送使能
wire [7:0] uart_date_w      //UART发送数据
wire clk_1m_W;              //

//main code




endmodule