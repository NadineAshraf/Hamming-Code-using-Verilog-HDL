module clk_divider
(    input wire clk_in,
     output reg clk_out1,
	  output reg clk_out2
);
reg[1:0] counter1=2'd0;
reg[2:0] counter2=3'd0;

always @(posedge clk_in)
begin
    counter1 <= counter1 + 2'd1;
	 counter2 <= counter2 + 3'd1;
    if(counter1 >= 3)
        counter1 <= 2'd0;
	 if(counter2 >= 6)
        counter2 <= 3'd0;
    clk_out1 <= ( counter1 < 2 )? 1'b1:1'b0;
	 clk_out2 <= ( counter2 < 2 )? 1'b1:1'b0;
end
endmodule
