module vga_display(
	input 					vga_clk,
	input 					sys_rst_n,
	
	input 		[ 9:0] 	pixel_xpos,
	input 		[ 9:0]	pixel_ypos,
	output reg 	[15:0] 	pixel_date
)

//parameter define
parameter 	H_DISP	= 10'd640;
parameter 	V_DISP 	= 10'd480;
localparam 	WHITE 	= 16'b11111_111111_11111;
localparam	BLACK		= 16'b00000_000000_00000;
localparam	RED		= 16'b11111_000000_00000;
localparam	GREEN		= 16'b00000_111111_00000;
localparam	BLUE		= 16'b00000_000000_11111;

always @(posedge vga_clk or negedge sys_rst_n)begin
	if(!sys_rst_n)
		pixel_date <= 16'b0;
	else begin
		if((pixel_xpos > 0) && (pixel_xpos < (H_DISP/5)*1))
			pixel_date <= WHITE;
		else if ((pixel_xpos >= (H_DISP/5)*1) && pixel_xpos < (H_DISP/5)*2)
			pixel_date <= BLACK;
		else if ((pixel_xpos >= (H_DISP/5)*2) && pixel_xpos < (H_DISP/5)*3)
			pixel_date <= RED;
		else if ((pixel_xpos >= (H_DISP/5)*3) && pixel_xpos < (H_DISP/5)*4)
			pixel_date <= GREEN;
		else 
			pixel_date <= BLUE;
	end
end
endmodule