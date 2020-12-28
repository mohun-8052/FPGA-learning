module RS(
    input   sb,
    input   rb,
    
    output  q,
    output  qb
);

    nand    n1(q,sb,qb);
    nand    n2(qb,rb,q);
    `

endmodule
