module mux2_1
(
    input   wire    in1,
    input   wire    in2,
    input   wire    sel,
    
    output  reg     out
);

always@(*) begin
    if(sel == 1'b0)
        out = in1;
    else if(sel == 1'b1)
        out = in2;
    else
        out = 1'b0;
end


endmodule