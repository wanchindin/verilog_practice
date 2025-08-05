module tb_updown_counter;
    reg clk, rst, updown;
    wire [3:0]count;

    updown_counter uut (
        .clk(clk),
        .rst(rst),
        .updown(updown),
        .count(count)
    );
    always #1 clk = ~clk;
    initial begin
        clk=0; rst=1; updown=1;
        $monitor("time:%t clk:%d rst:%d updown:%d count:%d", $time, clk, rst, updown, count);
        $dumpfile("sim/tb_updown_counter.vcd");
        $dumpvars(0, tb_updown_counter);

        #2 rst=0;
        #35 updown=0;
        #10 updown=1;
        #16 rst=1;
        #2 rst=0;
        #30 $finish;
    end
endmodule