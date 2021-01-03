module add_4b(X,Y,SUM,C);
    
input   [3:0]   X,Y;
output  [3:0]   SUM;
output          C;

assign  {C,SUM} = X + Y;

endmodule