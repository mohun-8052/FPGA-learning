module flow_led(
    input           sys_clk,
    input           rst_n,

    output reg[3:0] led 
);


reg [23:0] cnt;


always @(posedge sys_clk or negedge rst_n)
begin
    if(!rst_n)
        cnt <= 24'd0;
    else
        if(cnt < 24'd1000_0000)
            cnt <= cnt + 24'd1;
        else 
            cnt <= 24'd0;
end



endmodule
