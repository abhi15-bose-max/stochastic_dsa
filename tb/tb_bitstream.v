`timescale 1ns/1ps

module tb_bitstream;

reg clk;
reg reset;
wire bit_out;

parameter MAG = 8'd128;

stochastic_bitstream uut(
    .clk(clk),
    .reset(reset),
    .magnitude(MAG),
    .bit_out(bit_out)
);

initial begin
    clk=0;
    forever #5 clk=~clk;
end

integer ones;

initial begin

$dumpfile("output/waveform.vcd");
$dumpvars(0,tb_bitstream);

ones = 0;

reset=1;
#10;
reset=0;

repeat(100)
begin
    #10;
    if(bit_out)
        ones = ones + 1;
end

$display("Total ones = %d",ones);

$finish;

end

endmodule