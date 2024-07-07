`include "ex.v"


module tb_ripple_carry_adder_4bit;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] S;
    wire Cout;


    four_ripple uut (A, B, Cin, S, Cout);


    
    initial $monitor("A = %b, B = %b, Cin = %b, S = %b, Cout = %b", A, B, Cin, S, Cout);
        
    initial begin
        $dumpfile("ex3b.vcd");
        $dumpvars(0, tb_ripple_carry_adder_4bit);
        // 0+0=0
        A = 4'b0000; B = 4'b0000; Cin = 0; #10; //0+0=0  
        A = 4'b0011; B = 4'b0001; Cin = 0; #10; //3+1=4
        A = 4'b0100; B = 4'b0011; Cin = 0; #10; //4+3=7
        A = 4'b1111; B = 4'b1111; Cin = 0; #10; //15+15=30 (11110)
        A = 4'b0000; B = 4'b0000; Cin = 1; #10; //0+0+1=1
        A = 4'b0010; B = 4'b0101; Cin = 1; #10; //2+5+1=8
        A = 4'b0100; B = 4'b0111; Cin = 1; #10; //4+7+1=12
        A = 4'b1111; B = 4'b1111; Cin = 1; #10; //15+15+1=31 (11111)


        $finish;
    end


endmodule
