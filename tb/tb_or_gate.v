module tb_or_gate;
    reg a, b;
    wire y;
    or_gate uut(.a(a), .b(b), .y(y));

    initial begin
        $monitor("a=%b b=%b y=%b", a, b, y);
        $dumpfile("sim/tb_or_gate.vcd");
        $dumpvars(0, tb_or_gate);

        a=0; b=0; #1;
        a=0; b=1; #1;
        a=1; b=0; #1;
        a=1; b=1; #1;

        $finish;
    end
endmodule