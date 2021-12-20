module operation2
(output [3:0] out,input [6:0] in ,input enable);

reg [3:0]r;
always@(enable)
begin
if (in[2] ^ in[4] ^ in[6] == in[0] && in[2] ^ in[5] ^ in[6] == in[1] && in[4] ^ in[5] ^ in[6] == in[3])
begin
 r[0]<=in[2];
 r[1]<=in[4];
 r[2]<=in[5];
 r[3]<=in[6];
end

else if (in[2]^in[4]^in[6]!==in[0] && in[2]^in[5]^in[6]!==in[1] && in[4]^in[5]^in[6]==in[3] )
begin
 r[0] <= ~in[2];
 r[1] <=in[4];
 r[2] <=in[5];
 r[3] <=in[6];
end

else if (in[2]^in[4]^in[6] !== in[0] && in[2]^in[5]^in[6] == in[1] && in[4]^in[5]^in[6]!==in[3] )
begin
 r[0] <= in[2];
 r[1] <= ~in[4];
 r[2] <= in[5];
 r[3] <= in[6];
end

else if (in[2]^in[4]^in[6] ==in[0] && in[2]^in[5]^in[6] !== in[1] && in[4]^in[5]^in[6] !== in[3] )
begin
r[0] <= in[2];
r[1] <= in[4];
r[2] <= ~in[5];
r[3] <= in[6];
end
else if(in[2]^in[4]^in[6] !== in[0] && in[2]^in[5]^in[6] !== in[1] && in[4]^in[5]^in[6] !== in[3] )
begin
 r[0] <= in[2];
 r[1] <= in[4];
 r[2] <= in[5];
 r[3] <= ~in[6];
end
end
assign out=r;
endmodule