`timescale 1ns/1ps

module tb_multiplier;

reg a;
reg b;
wire y;

stochastic_multiplier uut(
    .a(a),
    .b(b),
    .y(y)
);

initial
begin

$dumpfile("output/waveform.vcd");
$dumpvars(0,tb_multiplier);

$monitor("t=%0t a=%b b=%b y=%b",$time,a,b,y);

a=0;b=0;
#10;

a=1;b=0;
#10;

a=0;b=1;
#10;

a=1;b=1;
#10;

$finish;

end

endmodule