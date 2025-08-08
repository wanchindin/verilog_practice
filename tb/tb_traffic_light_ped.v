module tb_traffic_light_ped;
    reg clk, rst, ped_btn;
    wire [1:0]light;
    traffic_light_ped uut(.clk(clk), .rst(rst), .ped_btn(ped_btn), .light(light));

    always #1 clk = ~clk;
    initial begin
        $dumpfile("sim/tb_traffic_light_ped.vcd");
        $dumpvars(0, tb_traffic_light_ped);

        rst = 1; clk = 0; ped_btn = 0;
        #2 rst = 0;
        repeat(20) @(posedge clk);
        rst = 1;
        #2 rst = 0; ped_btn=1;
        repeat(20) @(posedge clk);

        $finish;
    end
endmodule