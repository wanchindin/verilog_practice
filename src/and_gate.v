/*
iverilog -o sim/and_tb tb/tb_and_gate.v src/and_gate.v
vvp sim/and_tb (Verilog Virtual Processor)
gtkwave sim/tb_and_gate.vcd
*/
module and_gate(
    input wire a, b,
    output wire y
);
    assign y = a & b;
endmodule