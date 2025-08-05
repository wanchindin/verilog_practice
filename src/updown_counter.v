module updown_counter(
    input wire clk,
    input wire rst,
    input wire updown,
    output reg [3:0]count
);
    always @(posedge clk or posedge rst) begin
        if(rst) 
            count <= 4'd0;
        else if(updown)
            count <= count+1;
        else
            count <= count-1;
    end
endmodule