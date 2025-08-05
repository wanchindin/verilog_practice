module mux2to1(
    input wire a,b,
    input wire sel,
    output wire y
);
    assign y = sel ? a : b;
    // assign y = sel ? d1 : d0; 是怎麼對應硬體的？
    // assign y = (~sel & a)|(sel & b);
endmodule
