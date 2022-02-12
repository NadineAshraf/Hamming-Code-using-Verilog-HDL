module parallel_to_serial
(
	input clk,
	input pts_reset,
	input write,
	input shift,
	input [3:0] data_in,
	output serial_out
);

reg [3:0] data;
	
always @(posedge clk)
begin
	 if( pts_reset ==1)
			data <= 0;
	 else if( write == 1)
	 begin
			data <= data_in;
	 end
	 else if( shift == 1 && write == 0 )//do shift right
			data<={ 1'b0 , data[3:1]};
end
	
assign serial_out = data[0];
endmodule