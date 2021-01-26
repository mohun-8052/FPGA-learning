`timescale 1ns/1ns

module tb_half_add();

reg	in1;
reg	in2;

wire	out;
wire  c;

initial	begin
	in1 <= 1'b0;
	in2 <= 1'b0;
end

always #10 in1 <= ($random) % 2;
always #10 in2 <= ($random) % 2;

half_add u_half_add(
	.in1(in1),
	.in2(in2),
	
	.out(out),
	.c(c)
);
endmodule
