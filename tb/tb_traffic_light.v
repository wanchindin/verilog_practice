module tb_traffic_light;
    reg clk, rst;
    wire [1:0] light;

    traffic_light uut (.clk(clk), .rst(rst), .light(light));

    // 產生時脈 (10ns 週期)
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_traffic_light.vcd");
        $dumpvars(0, tb_traffic_light);

        clk = 0; rst = 1;
        #10 rst = 0;               // 釋放 reset

        // 模擬 10 個狀態切換
        repeat(10) @(posedge clk);

        $finish;
    end
endmodule
