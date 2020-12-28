module seg_led(
	input 							sys_clk ,
	input 							rst_n   ,
	
	input 							en		  ,
	input 							sign    ,
	input 	   	[19:0] 		date    ,
	input 	   	[ 5:0] 		point   ,
	
	output 	reg 	[ 7:0] 		seg_led ,
	output 	reg 	[ 5:0] 		seg_sel
);

//parameter define
parameter CLK_DIVIDE =  4'd10			  ;		//时钟分频系数 10 50MHz->5MHz (20ns ->200ns)
parameter MAX_NUM    = 13'd5000	     ;      //对数码管驱动时钟(5MHz)计时1ms需要的计数值

//reg define
reg 	[ 3:0]				  clk_cnt	  ;      //时钟分频系数
reg 	   				     dri_clk     ;		//数码管驱动时钟，5MHz
reg 	[23:0]				  num         ;		//24位bcd码寄存器
reg   [12:0]              cnt0        ;		//数码管驱动时钟计数器
reg                       flag        ;		//标志信号（标志着cot0计数达1ms）
reg   [ 2:0]              cnt_sel     ;		//数码管位选计数器
reg   [ 3:0]              num_disp    ;		//当前数码管显示的数据
reg							  dot_disp    ;		//当前数码管显示的小数点

//wire define
wire  [ 3:0]              data0		  ;		//十万位数
wire  [ 3:0]              data1       ;		//万位数
wire  [ 3:0]              data2		  ;		//千位数
wire  [ 3:0]              data3       ;		//百位数
wire  [ 3:0]              data4		  ;		//十位数
wire  [ 3:0]              data5       ;		//个位数

endmodule
