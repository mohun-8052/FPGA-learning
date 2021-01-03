`timescale 1ns/1ns

module tb_mux8_1();

reg [2:0]   sel;
reg [7:0]   in;

wire        out;

initial 
    begin
        sel <= 3'b000;
        in  <= 8'b00000000;
    end

always  #10 sel[0]  <=  ($random)%2;
always  #10 sel[1]  <=  ($random)%2;
always  #10 sel[2]  <=  ($random)%2;

always  #10 in[0]  <=  ($random)%2;
always  #10 in[1]  <=  ($random)%2;
always  #10 in[2]  <=  ($random)%2;
always  #10 in[3]  <=  ($random)%2;
always  #10 in[4]  <=  ($random)%2;
always  #10 in[5]  <=  ($random)%2;
always  #10 in[6]  <=  ($random)%2;
always  #10 in[7]  <=  ($random)%2;

initial begin
    $timeformat(-9, 0, "ns", 6);
    $monitor("@time %t: sel=%b   in=%b  out=%b",$time,sel,in,out);
end 

mux8_1  u_mux8_1
(
    .sel(sel),
    .in(in),
    .out(out)
);

endmodule