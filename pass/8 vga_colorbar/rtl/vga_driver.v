module vga_drive(
	input 				vga_clk,
	input 				sys_rst_n,
	
	output 				vga_hs,
	output 				vga_vs,
	output 	[15:0] 	vga_rgb,
	
	input  	[15:0] 	pixel_date,
	output 	[ 9:0] 	pixel_xpos,
	output 	[ 9:0] 	pixel_ypos
)

// parameter define
parameter H_SYNC  =  10'd96;
parameter H_BACK  =  10'd48;
parameter H_DISP	=	10'd640;
parameter H_FRONT	=	10'd16;
parameter H_TOTAL	=	10'd800;

parameter V_SYNC  =  10'd2;
parameter V_BACK  =  10'd33;
parameter V_DISP	=	10'd480;
parameter V_FRONT	=	10'd10;
parameter V_TOTAL	=	10'd525;

//reg define
reg	[9:0]	cnt_h;
reg	[9:0]	cnt_v;

//wire define
wire			vga_en;
wire			date_req;

// main code	
assign vga_hs = (cnt_h <= H_SYNC -1'b1)? 	1'b0	:	1'b1;
assign vga_hs = (cnt_v <= V_SYNC -1'b1)? 	1'b0	:	1'b1;

assign vga_en = (((cnt_h >= H_SYNC + H_fRONT) && (CNT_h <= H_SYNC + H_FRONT+H_dISP))
					 &&((cnt_v >= V_SYNC + V_fRONT) && (CNT_v <= V_SYNC + V_FRONT+V_dISP)))
					 ? 1'b1	:	1'b0;

assign vga_rgb = vga_en? pixel_date	:	16'b0;

assign pixel_xpos = date_req?(cnt_h - (H_SYNC + H_BACK - 1'b1))	:	10'b0;
assign pixel_ypos = date_req?(cnt_v - (V_SYNC + V_BACK - 1'b1))	:	10'b0;
					 
always @(posedge vga_clk or negedge sys_rst_n) begin
	if(!sys_rst_n)
		cnt_h <= 10'b0;
	else begin
		if(cnt_h < H_TOTAL - 1'b1)
			cnt_h <= cnt_h + 1'b1;
		else
			cnt_h <= 10'b0;
	end
end

always @(posedge vga_clk or negedge sys_rst_n) begin
	if(!sys_rst_n)
		cnt_v <= 10'b0;
	else if(cnt_h == H_TOTAL - 1'b1) begin
		if(cnt_v < v_TOTAL - 1'b1)
			cnt_v <= cnt_v + 1'b1;
		else
			cnt_v <= 10'b0;
	end
end

endmodule