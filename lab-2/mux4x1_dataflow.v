timescale 1ns/1ps // Time unit = 1ns, time precision = 1ps
module mux4x1_dataflow(
 input [3:0] in, // 4-bit input lines
 input [1:0] sel, // 2-bit select lines
 output out // Output of the MUX
);
 // Dataflow modeling of 4:1 multiplexer
 assign out = (~sel[1] & ~sel[0] & in[0]) |
 (~sel[1] & sel[0] & in[1]) |
 ( sel[1] & ~sel[0] & in[2]) |
 ( sel[1] & sel[0] & in[3]);
endmodule
