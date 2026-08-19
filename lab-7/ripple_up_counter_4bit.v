// T- Flipflop
module tff (
 input clk,
 input reset,
 output reg q
);
 always @(posedge clk or posedge reset) begin
 if (reset)
 q <= 1'b0;
 else
 q <= ~q;
 end
endmodule



// Ripple up counter code
module ripple_up_counter_4bit (
 input clk,
 input reset,
 output [3:0] q
);
 wire q_out0, q_out1, q_out2, q_out3;
 assign q = {q_out3, q_out2, q_out1, q_out0};
 // TFF instantiation
 tff tff0 (.clk(clk), .reset(reset), .q(q_out0));
 tff tff1 (.clk(~q_out0), .reset(reset), .q(q_out1));
 tff tff2 (.clk(~q_out1), .reset(reset), .q(q_out2));
 tff tff3 (.clk(~q_out2), .reset(reset), .q(q_out3));
endmodule
2.2: Save the file using command- :wq!
Step 3: Create Testbench file
3.1: Open gvim editor for testbench with command:
gvim ripple_up_counter_4bit_tb.v
Testbench:
module ripple_up_counter_tb;
 reg clk;
 reg reset;
 wire [3:0] q;
 // 4-bit ripple up counter instantiation
 ripple_up_counter_4bit uut (
 .clk(clk),
 .reset(reset),
 .q(q)
 );
 // Clock generation
 always #5 clk = ~clk;
 initial begin
 clk = 0;
 reset = 1;
 // Display signals
 $display("Time\treset\tq");
 $monitor("%0dns\t%b\t%b", $time, reset, q);
 // Apply reset
 #10;
 reset = 0;
 #200;
 $finish;
 end
 // Waveform dump
 initial begin
 $dumpfile("up_counter_dump.vcd");
 $dumpvars();
 end
endmodule
