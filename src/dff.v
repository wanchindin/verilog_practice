module dff(
    input wire d,
    input wire clk, 
    input wire rst,
    output reg q //用reg才能在always賦值
);
   always @(posedge clk or posedge rst) begin //非同步reset
        if(rst)
            q <= 1'b0; 
        else
            q <= d;
   end
endmodule