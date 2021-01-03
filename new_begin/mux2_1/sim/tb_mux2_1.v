`timescale 1ns/1ns

module tb_mux2_1();

reg     in1;
reg     in2;
reg     sel;

wire    out;

initial
    begin
        in1 <= 1'b0;
        in2 <= 1'b0;
        sel <= 1'b0;
    end
    
always  
    begin
        #10 in1 <= ($random) % 2;
    end

always
    begin
        #10 in2 <= ($random) % 2;
    end
 
always  
    begin
        #10 sel <= ($random) % 2;
    end

mux2_1  u_mux2_1
(
    .in1(in1),
    .in2(in2),
    .sel(sel),
    
    .out(out)
);   
    
endmodule