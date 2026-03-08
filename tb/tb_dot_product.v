`timescale 1ns/1ps

module tb_dot_product;

reg clk;
reg reset;

wire a_stream;
wire b_stream;
wire [15:0] result;

parameter A_VAL = 8'd128;
parameter B_VAL = 8'd64;

stochastic_bitstream A(
    .clk(clk),
    .reset(reset),
    .magnitude(A_VAL),
    .bit_out(a_stream)
);

stochastic_bitstream B(
    .clk(clk),
    .reset(reset),
    .magnitude(B_VAL),
    .bit_out(b_stream)
);

dot_product uut(
    .clk(clk),
    .reset(reset),
    .a(a_stream),
    .b(b_stream),
    .result(result)
);

initial begin
    clk=0;
    forever #5 clk=~clk;
end

initial begin

$dumpfile("output/waveform.vcd");
$dumpvars(0,tb_dot_product);

reset=1;
#10;
reset=0;

repeat(500)
#10;

$display("Dot product counter = %d",result);

$finish;

end

endmodule