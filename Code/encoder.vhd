module encoder
(    input clk,
	  input data_in,
	  input write,
	  output ready,
	  output [6:0] data_out
);
wire [3:0] stp_out;
reg operation_enable;
wire [2:0] count_out;

// operation enable = counter_reset = stp_reset
serial_to_parallel c1
(    .reset(operation_enable),
     .write(write),
	  .data_in(data_in),
	  .clk(clk),
	  .data_o1(stp_out)
);
counter1 c2
(    .en(write),
     .clk(clk),
	  .reset(operation_enable),
	  .count(count_out)
);
operation1 c3
(    .enable(operation_enable),
	  .data_in2(stp_out),
	  .data_o(data_out)
);
reg r;
always @ ( posedge clk)
begin 
    if ( count_out == 3'd 4)
	 begin
	     operation_enable = 1;
		  r = 1;
	 end
	 else
	 begin
	     operation_enable = 0;
		  r = 0;
	  end
end
assign ready = r;
    
endmodule