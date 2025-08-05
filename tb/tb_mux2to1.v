module tb_mux2to1;
    reg a , b;
    reg sel;
    wire y;
    mux2to1 uut (.a(a), .b(b), .sel(sel), .y(y));

    initial begin
        $monitor("sel=%d a=%d b=%d y=%d", sel, a, b, y);
        $dumpfile("sim/tb_mux2to1.vcd");
        $dumpvars(0, tb_mux2to1);

        sel=0; a=0; b=0; #1;
        sel=1; a=0; b=0; #1;
        sel=0; a=0; b=1; #1;
        sel=1; a=0; b=1; #1;
        sel=0; a=1; b=0; #1;
        sel=1; a=1; b=0; #1;
        sel=0; a=1; b=1; #1;
        sel=1; a=1; b=1; #1;

        $finish;
    end
endmodule