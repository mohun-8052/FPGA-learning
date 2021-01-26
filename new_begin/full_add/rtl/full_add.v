module full_add(
	input		wire		in1,
	input		wire		in2,
	input		wire		cin,
	
	output	wire		cout,
	output	wire		sum
);

wire	h0_sum;
wire	h0_cout;
wire	h1_cout;

half_add u_half_add0(
	.in1(in1),
	.in2(in2),
	.out(h0_sum),
	.c(h0_cout)
);

half_add u_half_add1(
	.in1(cin),
	.in2(h0_sum),
	.out(sum),
	.c(h1_cout)
);

assign	cout = h1_cout | h0_cout;

endmodule
