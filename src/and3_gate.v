// 3 input and gate
module and3_gate(
    input wire a, b, c,
    output wire y
);
    assign y = a & b & c;
endmodule