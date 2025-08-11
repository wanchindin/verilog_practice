// 2-bits and gate
module and2bits(
    input wire [1:0] a, b,
    output wire [1:0] y
);
    assign y = a & b;
endmodule

module tb_and2bits;
    reg [1:0] a, b;
    wire [1:0] y;
    2bits_and_gate uut(.a(a), .b(b), .y(y));

    initial begin
        $dumpfile("sim/tb_and2bits.vcd");
        $dumpvars(0, tb_and2bits);
        
        for(a=0; a<4; a = a+1) begin
            for(b=0; b<4; b = b+1) begin
                #1;
                $display("a=%b b=%b y=%b", a, b, y);
            end    
        end
        $finish;    
    end
endmodule