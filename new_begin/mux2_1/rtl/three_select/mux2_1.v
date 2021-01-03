module mux2_1
(
    input   wire    in1,
    input   wire    in2,
    input   wire    sel,
    
    output  wire     out
);

assign  out = (sel == 1'b0) ? in1 : in2;

endmodule
