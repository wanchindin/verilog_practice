module tb_counter;
    reg clk, rst;
    wire [3:0]count;

    counter uut(
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    always #1 clk = ~clk;
    initial begin
        $monitor("time:%t clk:%d rst:%d count:%d", $time, clk, rst, count);
        $dumpfile("sim/tb_counter.vcd");
        $dumpvars(0, tb_counter);

        clk=0; rst=1;
        #1 rst=0;
        #35 rst=1;
        #1 rst=0;
        #10 $finish;

    end
endmodule