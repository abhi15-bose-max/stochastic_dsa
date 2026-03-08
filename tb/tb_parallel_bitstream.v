`timescale 1ns/1ps

module tb_parallel_bitstream;

reg clk;
reg reset;

reg [7:0] mag1;
reg [7:0] mag2;
reg [7:0] mag3;
reg [7:0] mag4;

wire bit1;
wire bit2;
wire bit3;
wire bit4;

parallel_bitstream_generator uut(

    .clk(clk),
    .reset(reset),

    .mag1(mag1),
    .mag2(mag2),
    .mag3(mag3),
    .mag4(mag4),

    .bit1(bit1),
    .bit2(bit2),
    .bit3(bit3),
    .bit4(bit4)

);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

integer ones1;
integer ones2;
integer ones3;
integer ones4;

integer i;

initial
begin

$dumpfile("output/waveform.vcd");
$dumpvars(0,tb_parallel_bitstream);

ones1=0;
ones2=0;
ones3=0;
ones4=0;

reset=1;
#10;
reset=0;

/* Example magnitudes */

mag1 = 8'd64;    // 0.25
mag2 = 8'd128;   // 0.5
mag3 = 8'd192;   // 0.75
mag4 = 8'd32;    // 0.125

for(i=0;i<500;i=i+1)
begin
    #10;

    if(bit1) ones1 = ones1 + 1;
    if(bit2) ones2 = ones2 + 1;
    if(bit3) ones3 = ones3 + 1;
    if(bit4) ones4 = ones4 + 1;

end

$display("Stream1 ones = %d", ones1);
$display("Stream2 ones = %d", ones2);
$display("Stream3 ones = %d", ones3);
$display("Stream4 ones = %d", ones4);

$finish;

end

endmodule