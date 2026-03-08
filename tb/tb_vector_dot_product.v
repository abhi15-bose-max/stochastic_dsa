`timescale 1ns/1ps

module tb_vector_dot_product;

reg clk;
reg reset;

reg a1,a2,a3,a4;
reg b1,b2,b3,b4;

wire [15:0] result;

vector_dot_product uut(

    .clk(clk),
    .reset(reset),

    .a1(a1), .b1(b1),
    .a2(a2), .b2(b2),
    .a3(a3), .b3(b3),
    .a4(a4), .b4(b4),

    .result(result)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin

$dumpfile("output/waveform.vcd");
$dumpvars(0,tb_vector_dot_product);

$display("Running stochastic vector dot product test");

reset = 1;
#10;
reset = 0;

/* Example vectors */

a1=1; b1=1;
a2=1; b2=0;
a3=0; b3=1;
a4=1; b4=1;

repeat(20)
#10;

$display("Dot product accumulator = %d", result);

$finish;

end

endmodule