`timescale 1ns/1ps

module tb_stochastic_matrix_multiply;

reg clk;
reg reset;

reg [7:0] a11,a12,a21,a22;
reg [7:0] b11,b12,b21,b22;

wire [15:0] c11,c12,c21,c22;

stochastic_matrix_multiply uut(

    .clk(clk),
    .reset(reset),

    .a11(a11), .a12(a12),
    .a21(a21), .a22(a22),

    .b11(b11), .b12(b12),
    .b21(b21), .b22(b22),

    .c11(c11), .c12(c12),
    .c21(c21), .c22(c22)

);

initial begin
    clk=0;
    forever #5 clk = ~clk;
end

initial begin

$dumpfile("output/waveform.vcd");
$dumpvars(0,tb_stochastic_matrix_multiply);

reset=1;
#30;
reset=0;

/* Example matrices */

a11=8'd128;  //0.5
a12=8'd64;   //0.25
a21=8'd192;  //0.75
a22=8'd32;   //0.125

b11=8'd128;
b12=8'd64;
b21=8'd128;
b22=8'd64;

repeat(1000)
#10;

$display("C11=%d C12=%d C21=%d C22=%d",c11,c12,c21,c22);

$finish;

end

endmodule