module  flop(
    input   date,
    input   clock,
    input   clear,

    output  q,
    output  qb
);
    wire    a,b,c,d,e,f,nclock,ndate;

    nand    #10 nd1(a,clock,date,clear),
                nd2(b,clock,ndate),
                nd4(d,c,b),
                nd5(e,c,nclock),
                nd6(f,d,nclock),
                nd8(qb,q,f,clear);
    nand    #9  nd3(c,a,d),
                nd7(q,e,qb);
    not     #10 iv1(ndate,date),
                iv2(ncolck,clock);

endmodule
