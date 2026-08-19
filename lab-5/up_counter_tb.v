module up_counter_tb;
reg clk; reg reset;
wire [3:0] count;
up_counter_4bit uut (
.clk(clk),
.reset(reset),
.count(count)
);

always #5 clk = ~clk;
initial
begin
$monitor("Time=%t|Reset=%b |count=%b",$time,reset,count);
reset = 1; #10;
reset = 0; #200;
$finish;
end
initial begin
$dumpfile ("up_counter_4bit.vcd");
$dumpvars();
end
endmodule 
