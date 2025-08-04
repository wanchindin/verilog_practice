module tb_xor_gate;
    reg a, b;
    wire y;
    xor_gate uut (.a(a), .b(b), .y(y));
    
    initial begin
        $monitor("a=%b b=%b y=%b", a, b, y);
        $dumpfile("sim/tb_xor_gate.vcd");
        $dumpvars(0, tb_xor_gate);

        a=0; b=0; #1;
        a=0; b=1; #1;
        a=1; b=0; #1;
        a=1; b=1; #1;
        $finish;
    end
endmodule