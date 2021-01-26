module half_add(
	input		wire		in1,
	input		wire		in2,
	
	output	reg		out,
	output	reg		c
);

always @(*) begin
	case({in2,in1})
		2'b00 : 	begin		out = 1'b0; c = 1'b0;	end
		2'b01	:	begin		out = 1'b1; c = 1'b0;	end
		2'b10 :  begin		out = 1'b1; c = 1'b0;	end
		2'b11 : 	begin		out = 1'b0; c = 1'b1;	end
		default : begin	out = 0; c = 1'b0;		end
	endcase
end

endmodule
