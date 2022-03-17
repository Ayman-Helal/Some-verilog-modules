module fulladder0
(
output wire sum,carry,
input wire a,b,c
);
assign {carry,sum}=a+b+c;
endmodule