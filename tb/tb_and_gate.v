//`timescale 1ns/1ps
module tb_and_gate;
    reg a, b;
    wire y;

    and_gate uut (.a(a), .b(b), .y(y)); //unit under test

    initial begin
        $monitor("a=%b b=%b y=%b", a, b, y);
        $dumpfile("sim/tb_and_gate.vcd");
        $dumpvars(0, tb_and_gate);
        
        a=0; b=0; #1; //延遲1個時間單位再執行下一行
        a=0; b=1; #1;
        a=1; b=0; #1;
        a=1; b=1; #1;
        
        $finish;
    end
endmodule


