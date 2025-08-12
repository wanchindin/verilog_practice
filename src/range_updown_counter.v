module range_updown_counter(
    input wire clk, rst,
    output reg [3:0] count
);
    reg updown;
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            count <= 4'd3;
            updown <= 1'b0; 
        end else begin
            if(updown==0) begin
                if(count==4'd12) begin
                    count <= count-1;
                    updown <=1;
                end else begin
                    count <= count+1;
                end
            end else begin
                if(count==4'd3) begin
                    count <= count+1;
                    updown <=0;
                end else begin
                    count <= count-1;
                end
            end
        end 
    end
endmodule

//tb
module tb_range_updown_counter;
    reg clk, rst;
    wire [3:0] counter;

    range_updown_counter uut(.clk(clk), .rst(rst), .counter(counter));

    always #1 clk = ~clk;
    initial begin
        $dumpfile("sim/tb_range_udcounter.vcd");
        $dumpvars(0, tb_range_updown_counter);
        rst=1; clk=0;
        repeat(2) @(posedge clk); rst=0;
        repeat(30) @(posedge clk);
        $finish;
    end
endmodule