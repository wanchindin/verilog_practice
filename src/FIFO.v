module FIFO(
    input wire clk, rst, rd_en, wr_en,
    input wire [7:0] din,
    output reg [7:0] dout,
    output wire empty, full

);
    reg [7:0] mem [0:15];
    reg [4:0] w_ptr, r_ptr;

    always @(posedge clk or posedge rst) begin //write
        if(rst) w_ptr <= 0; 
        else begin
            if(wr_en && !full) begin
                mem[w_ptr[3:0]] <= din;
                w_ptr <= w_ptr+1;
            end
        end
    end

    always @(posedge clk or posedge rst) begin
        if(rst) r_ptr <= 0;
        else if (rd_en && !empty) begin
            dout <= mem[r_ptr[3:0]];
            r_ptr <= r_ptr+1;
        end
    end

    assign empty = (w_ptr == r_ptr);
    assign full =  (w_ptr[3:0] == r_ptr[3:0]) && (w_ptr[4] != r_ptr[4]);
endmodule
