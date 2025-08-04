module tb_nor_gate;
    reg a, b;
    wire y;

    nor_gate uut (.a(a), .b(b), .y(y));
    initial begin
        $monitor("a=%b b=%b y=%b" , a, b, y);
        $dumpfile("sim/tb_nor_gate.vcd");
        $dumpvars(0, tb_nor_gate);

        a=0; b=0; #1;
        a=0; b=1; #1;
        a=1; b=0; #1;
        a=1; b=1; #1;

        $finish;
    end

endmodule