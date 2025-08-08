module tb_traffic_light_timer;
    reg clk;
    reg rst;
    wire [1:0] light;

    traffic_light_timer uut(.clk(clk), .rst(rst), .light(light));
    always #1 clk = ~clk;
    initial begin
        $monitor("light = %h", light);
        $dumpfile("sim/tb_traffic_light_timer.vcd");
        $dumpvars(0, tb_traffic_light_timer);

        rst = 1; clk = 0;
        #2 rst = 0;
        repeat(20) @(posedge clk);
        $finish;
    end
endmodule