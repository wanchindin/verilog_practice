module tb_dff;
    reg clk, d, rst;
    wire q;
    dff uut(
        .clk(clk),
        .d(d),
        .rst(rst),
        .q(q)
    );
    always #1 clk = ~clk; //5ns轉一次
    initial begin
        $monitor("Time=%0t | clk=%b rst=%b d=%b q=%b", $time, clk, rst, d, q);
        $dumpfile("sim/tb_dff.vcd");
        $dumpvars(0, tb_dff);

        clk=0; d=0; rst=1;
        #2 rst = 0;             // 釋放 reset
        #2 d = 1;               // 在下一個時脈邊緣，q 變成 1
        #2 d = 0;               // 下一個時脈邊緣，q 變回 0
        #4 d = 1;               // 維持高電位兩個週期
        #4 rst = 1;             // 再次 reset
        #2 rst = 0;

        #4 $finish;
    end
endmodule