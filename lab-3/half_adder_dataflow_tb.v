`timescale 1ns/1ps 
module half_adder_dataflow_tb;
 reg a, b; 
 wire sum, carry; 
 half_adder_dataflow uut (
 .a(a),
 .b(b),
 .sum(sum),
 .carry(carry)
 );
 
 initial begin
 $display("Dataflow Half Adder Test");
 $display("A B | Sum Carry");
 $display("---------------------");
 a = 0; b = 0; #10 $display("%b %b|%b %b", a, b, sum,
carry); 
 a = 0; b = 1; #10 $display("%b %b | %b %b", a, b, sum,
carry);
 a = 1; b = 0; #10
$display("%b %b | %b %b", a, b, sum, carry); // 1 + 0
 a = 1; b = 1; #10 $display("%b %b | %b %b", a, b, sum,
carry); 
 $finish; 
 end

 initial begin
 $dumpfile("half_adder_dataflow.vcd"); 
 $dumpvars(0, half_adder_dataflow_tb); 
 end
endmodule
