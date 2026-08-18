`timescale 1ns/1ps
module half_adder_gatelevel(
 input a, // First input bit
 input b, // Second input bit
 output sum, // Sum output
 output carry // Carry output
);
// Primitive gate instantiation
xor u1(sum, a, b); // sum = a XOR b
and u2(carry, a, b); // carry = a AND b
endmodule
