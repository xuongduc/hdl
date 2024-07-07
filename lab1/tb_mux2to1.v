`include "ex.v"
module tb_mux2to1;
    reg D0,D1; 
    reg S;
    wire Y;
    
    mux2to1 uut (
        .D0(D0),
        .D1(D1),
        .S(S),
        .Y(Y)
    );
    
    initial $monitor("D0 = %b, D1 = %b, S = %b, Y = %b", D0, D1, S, Y);
    initial begin
        $dumpvars(0, tb_mux2to1);
        $dumpfile("tb.vcd");
        
        // Test case 1: S = 0, D0 = 1, D1 = 0
        S = 0; D0 = 0; D1 = 0; 
        #10;  // Wait for 10 time units
        S = 0; D0 = 0; D1 = 1; 
        #10;
        S = 0; D0 = 1; D1 = 0; 
        #10;
        S = 0; D0 = 1; D1 = 1; 
        #10;
        S = 1; D0 = 0; D1 = 0; 
        #10;
        S = 1; D0 = 0; D1 = 1; 
        #10;
        S = 1; D0 = 1; D1 = 0; 
        #10;
        S = 1; D0 = 1; D1 = 1; 
        #10;

        $finish;
    end

endmodule
