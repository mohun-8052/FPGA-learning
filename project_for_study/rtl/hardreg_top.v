module hardreg_top;

    reg         clock,clearb;
    reg [3:0]   data;
    reg [3:0]   qout;

    `define stim    #100    data=4'b

    event   end_first_pass;
        hardreg reg_4bit(
            .clk(clock),
            .d(data),
            .clrb(clearb),
            .q(qout)
        );
    
    initial
        begin
            clock   = 1'b0;
            clearb  = 1'b1;
        end

    always  #50  clock = ~clock;

    always  @(end_first_pass)
        clearb = ~clearb;

    always  @(posedge clock)
        begin
            $display("at time %d clearb=%d data=%d qout=%d",$time,clearb,data,qout);
        end
    initial
        begin
            repeat(4)
            begin
                data = 4'b0000;
                `stim   0001;
                `stim   0010;
                `stim   0011;
                `stim   0100;
                `stim   0101;
                `stim   0110;
                `stim   0111;
                `stim   1000;
                `stim   1001;
                `stim   1010;
                `stim   1011;
                `stim   1100;
                `stim   1101;
                `stim   1110;
                `stim   1111;
                #200 -> end_first_pass;
            end
            $finish;
        end
  
endmodule
