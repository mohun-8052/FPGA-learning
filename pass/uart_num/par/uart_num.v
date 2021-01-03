module uart_num(
    input       num,
    input       sys_clk,
    input       sys_rst_n,
    
    output  reg y
);

parameter   s0 = 2'b00;
parameter   s1 = 2'b01;
parameter   s2 = 2'b10;
parameter   s3 = 2'b11;

reg [1:0]   cur_state;
reg [1:0]   next_state;

always @(*)
begin
    if(!sys_rst_n)
        cur_state <= 2'b0;
    else
        cur_state <= next_state;
end

always @(*)
begin
   case(cur_state)
    s0:
        if(num == 1)    begin   next_state <= s1;    
                                         y <= 1'b0;
                        end
        else            begin   next_state <= s0;    end
    s1:                                         
        if(num == 1)    begin   next_state <= s1;    
                                         y <= 1'b0;
                        end
        else            begin   next_state <= s0;    end
    s2:                                         
        if(num == 1)    begin   next_state <= s1;    
                                         y <= 1'b0;
                        end
        else            begin   next_state <= s0;    end
    s3:                                         
        if(num == 1)    begin   next_state <= s1;    
                                         y <= 1'b1;
                        end
        else            begin   next_state <= s0;    end 
    default:            begin   next_state <= s0;    end
   endcase
end



endmodule
