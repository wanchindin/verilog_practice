module tb_FIFO;
    reg clk, rst, rd_en, wr_en;
    reg[7:0] din;
    wire[7:0] dout;
    wire empty, full;

    FIFO uut(.clk(clk), .rst(rst), .rd_en(rd_en), .wr_en(wr_en), .din(din), .dout(dout), .empty(empty), .full(full));
    
    always #1 clk = ~clk;
    initial begin
        $dumpfile("sim/tb_FIFO.vcd");
        $dumpvars(0, tb_FIFO);
        rst=1; clk=0; rd_en=0; wr_en=0;
        #2 rst=0;
        repeat(4) begin
            @(posedge clk);
            wr_en = 1;
            din = $random;
        end
        @(posedge clk) wr_en = 0;

        repeat(4) begin
            @(posedge clk);
            rd_en = 1;
        end
        @(posedge clk) rd_en = 0;

        repeat(2) begin
            @(posedge clk);
            wr_en = 1;
            din = $random;
            rd_en = 1;
        end
        @(posedge clk) rd_en=0; wr_en=0;

        $finish;
    end

endmodule