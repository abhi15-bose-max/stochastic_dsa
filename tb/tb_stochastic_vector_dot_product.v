`timescale 1ns/1ps

module tb_stochastic_vector_dot_product;

reg clk;
reg reset;

reg [7:0] a1,a2,a3,a4;
reg [7:0] b1,b2,b3,b4;

wire [15:0] result;

stochastic_vector_dot_product uut(

    .clk(clk),
    .reset(reset),

    .a1_mag(a1),
    .a2_mag(a2),
    .a3_mag(a3),
    .a4_mag(a4),

    .b1_mag(b1),
    .b2_mag(b2),
    .b3_mag(b3),
    .b4_mag(b4),

    .result(result)

);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

$dumpfile("output/waveform.vcd");
$dumpvars(0,tb_stochastic_vector_dot_product);

a1=8'd128;
a2=8'd64;
a3=8'd192;
a4=8'd32;

b1=8'd128;
b2=8'd128;
b3=8'd128;
b4=8'd128;

reset = 1;
#30;
reset = 0;

repeat(1200)
#10;

$display("Stochastic vector dot product = %d", result);
$monitor("t=%0t m1=%b m2=%b m3=%b m4=%b result=%d",
          $time, uut.m1, uut.m2, uut.m3, uut.m4, result);
$finish;

end

endmodule