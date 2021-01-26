`timescale 1ns/1ns

module	tb_full_add_1();

reg	in1;
reg	in2;
reg	cin;

wire	cout;
wire	sum;

initial	begin
	in1 <= 1'b0;
	in2 <= 1'b0;
	cin <= 1'b0;
end

always	#10	in1 <= ($random) % 2;
always	#10	in2 <= ($random) % 2;
always	#10	cin <= ($random) % 2;

full_add_1 u_full_add_1(
	.in1(in1),
	.in2(in2),
	.cin(cin),
	
	.cout(cout),
	.sum(sum)
);


endmodule
