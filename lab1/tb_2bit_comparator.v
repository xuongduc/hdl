`include "ex.v"

module tb_2bit_comparator;

    reg [1:0]A,B;
    wire A_gt_B, A_lt_B, A_eq_B;

    two_bit_comparator uut(A, B, A_gt_B, A_lt_B, A_eq_B);

    initial $monitor("A = %b, B = %b, A_gt_B = %b, A_lt_B = %b, A_eq_B = %b", A, B, A_gt_B, A_lt_B, A_eq_B);

    initial begin
        $dumpfile("ex4.vcd");
        $dumpvars(0, tb_2bit_comparator);
        A = 2'b00; B = 2'b00; #10;
        A = 2'b01; B = 2'b00; #10;
        A = 2'b00; B = 2'b01; #10;
        A = 2'b01; B = 2'b01; #10;
        A = 2'b10; B = 2'b01; #10;
        A = 2'b01; B = 2'b10; #10;
        A = 2'b10; B = 2'b10; #10;
        A = 2'b11; B = 2'b11; #10;
        $finish;
    end



endmodule