module study(
    input               clk,
    input               reset_n,
    input               RD,

    output  reg [3:0]   count,
    output  reg         g1

);


    
always @(posedge clk or negedge reset_n) begin
   if(!reset_n)
        q <= 4'b0000;
    else
        q <= q + 4'b0001;
end

always @(q)begin
    if(q == 4'b0110)
        g1 = 1'b0;
    else
        g1 = 1'b1;
        
end

always @(g1)begin
    RS rs(.sb(g1),.rb(clk),.qb(RD));
end
   
always @(RD)begin
    if(RD == 1'b0000)
         q <= 4'b0000;
    else
         q <= q;
end

endmodule


