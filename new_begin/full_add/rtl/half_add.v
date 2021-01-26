module half_add(
	input		wire		in1,
	input		wire		in2,
	
	output	wire		out,
	output	wire		c
);

assign {c, out} = in1 +in2;

endmodule
