//bài 1
module decoder1to2 (
    input A,    
    output Y0,  
    output Y1   
);

    assign Y0 = ~A;  
    assign Y1 = A;     
endmodule


// bài 2

module mux2to1 (
    input D0,    // Data input 0
    input D1,    // Data input 1
    input S,     // Select input
    output Y     // Output
);

    wire Y0, Y1, net1, net2;


    decoder1to2 decoder1 (.A(S), .Y0(Y0), .Y1(Y1));

    and (net1, D0, Y0);
    and (net2, D1, Y1);
    or (Y, net1, net2);
endmodule

module half_adder (
    input A,    
    input B,    
    output S,   
    output C   
);
    xor (S, A, B);     
    and (C, A, B);     
endmodule

module full_adder(
    input a,
    input b,
    input cin,

    output s,
    output cout
);
    wire net1, net2, net3;

    half_adder first(a, b, net1, net2);
    half_adder seccond(net1, cin, s, net3);
    or (cout, net2, net3); 
endmodule

module four_ripple(
    input [3:0]A,
    input [3:0]B, 
    input cin, 
    output [3:0]S,
    output cout
);
    wire c1, c2, c3;

    full_adder a(A[0], B[0], cin, S[0], c1);
    full_adder b(A[1], B[1], c1, S[1], c2);
    full_adder c(A[2], B[2], c2, S[2], c3);
    full_adder d(A[3], B[3], c3, S[3], cout);
endmodule

module two_bit_comparator(
    input [1:0]A,
    input [1:0]B,
    output A_gt_B,
    output A_lt_B,
    output A_eq_B
);
    wire net1, net2, net3, net4, net5;

    and(net1, ~A[1], B[1]);
    and(net2, ~A[1], ~A[0], B[0]);
    and(net3, ~A[0], B[1], B[0]);

    xnor(net4, A[1], B[1]);
    xnor(net5, A[0], B[0]);

    or(A_lt_B, net1, net2, net3);
    and(A_eq_B, net4, net5);
    nor(A_gt_B, A_lt_B, A_eq_B);

endmodule

