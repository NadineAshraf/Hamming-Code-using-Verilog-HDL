module encoder_tb;
reg data;
reg write;
reg clk;
reg reset;
wire [6:0] out;

encoder uut
(    .data_in(data),
     .write(write),
     .clk(clk),
     .reset(reset),
     .data_out(out)
);
parameter clk_period = 100 ;
always 
begin
# ( clk_period /2 );
clk = ~clk;
end

initial
begin
    data = 1;
    # clk_period ;
    data = 0;
    # clk_period ;
    data = 0;
    # clk_period ;
    data = 1;
    # clk_period ;
    $display("result=%b",out);
end
endmodule