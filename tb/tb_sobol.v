`timescale 1ns/1ps

module tb_sobol;

reg clk;
reg reset;
wire [7:0] value;

sobol_generator uut(
    .clk(clk),
    .reset(reset),
    .value(value)
);

initial begin
    clk=0;
    forever #5 clk=~clk;
end

initial begin

$dumpfile("output/waveform.vcd");
$dumpvars(0,tb_sobol);

reset=1;
#10;
reset=0;

repeat(20)
begin
    #10;
    $display("t=%0t sobol=%d",$time,value);
end

$finish;

end

endmodule