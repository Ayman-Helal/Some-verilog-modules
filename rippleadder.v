module rippleadder
(
 output   [1:0]sum1,
 output wire cout,
 input   a1,b1,a2,b2,cin
);

wire a;

fulladder fulladder1
(
    .a(a1),
    .b(b1),
    .c(cin),
    .sum(sum1[0]),
    .carry(a)
);

fulladder fulladder2
(
    .a(a2),
    .b(b2),
    .c(a),
    .sum(sum1[1]),
    .carry(cout)  
);
endmodule