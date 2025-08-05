module mux2to1(
    input wire a,b,
    input wire sel,
    output wire y
);
    assign y = sel ? a : b;
endmodule