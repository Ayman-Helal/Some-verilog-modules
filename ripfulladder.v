module ripfulladder
(
output  [1:0]sum1,
output wire cout,
input   [1:0]a1,[1:0]b1,
input wire cin
);

wire a;

fulladder0 fulladder1
(
    .a(a1[0]),
    .b(b1[0]),
    .c(cin),
    .sum(sum1[0]),
    .carry(a)
);

fulladder0 fulladder2
(
    .a(a1[1]),
    .b(b1[1]),
    .c(a),
    .sum(sum1[1]),
    .carry(cout)  
);
endmodule