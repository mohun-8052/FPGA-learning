module full_add_1(
	input		wire	in1,
	input		wire	in2,
	input		wire	cin,

	output	wire	sum,
	output	wire	cout
);

assign	{cout,sum} = in1 + in2 + cin;

endmodule
