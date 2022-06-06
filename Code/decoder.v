module decoder
(    input [6:0] in,
     input clk, 
     input enable,
     output serial_out
);
wire [3:0] data1;

operation2 c1
(    .in(in),
     .enable(enable),
     .out(data1)
);

wire pts_reset;
wire shift;

parallel_to_serial c2
(    .clk(clk),
     .pts_reset(pts_reset),
     .write(enable),
     .shift(shift),
     .data_in(data1),
     .serial_out(serial_out)
);
wire counter_reset;
counter2 c3
(    .clk(clk),
     .counter_reset(counter_reset),
     .shift(shift)
);
reg p_reset;
reg c_reset;
always @ (posedge clk)
begin
    if ( shift==0 )
	 begin
	     p_reset = 1;
	     c_reset = 1;
	 end
	 else if ( shift == 1)
	 begin
	     p_reset = 0;
	     c_reset = 0;
	 end
end
assign pts_reset = p_reset;
assign counter_reset = c_reset;	 
endmodule
