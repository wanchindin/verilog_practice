module tb_and3_gate;
    reg a, b, c;
    wire y;
    and3_gate uut (.a(a), .b(b), .c(c), .y(y));

    initial begin
        $monitor("a=%b b=%b c=%b y=%b", a, b, c, y);
        $dumpfile("sim/tb_and3_gate.vcd");
        $dumpvars(0, tb_and3_gate);

        a=0; b=0; c=0; #1;
        a=0; b=0; c=1; #1;
        a=0; b=1; c=0; #1;
        a=0; b=1; c=1; #1;
        a=1; b=0; c=0; #1;
        a=1; b=0; c=1; #1;
        a=1; b=1; c=0; #1;
        a=1; b=1; c=1; #1;

        $finish;
    end
endmodule