`timescale 1ns/1ps

module tb_stochastic_matrix_multiply_4x4;

reg clk;
reg reset;

/* Matrix A */

reg [7:0] a11,a12,a13,a14;
reg [7:0] a21,a22,a23,a24;
reg [7:0] a31,a32,a33,a34;
reg [7:0] a41,a42,a43,a44;

/* Matrix B */

reg [7:0] b11,b12,b13,b14;
reg [7:0] b21,b22,b23,b24;
reg [7:0] b31,b32,b33,b34;
reg [7:0] b41,b42,b43,b44;

/* Output matrix */

wire [15:0] c11,c12,c13,c14;
wire [15:0] c21,c22,c23,c24;
wire [15:0] c31,c32,c33,c34;
wire [15:0] c41,c42,c43,c44;

stochastic_matrix_multiply_4x4 uut(

.clk(clk),
.reset(reset),

.a11(a11),.a12(a12),.a13(a13),.a14(a14),
.a21(a21),.a22(a22),.a23(a23),.a24(a24),
.a31(a31),.a32(a32),.a33(a33),.a34(a34),
.a41(a41),.a42(a42),.a43(a43),.a44(a44),

.b11(b11),.b12(b12),.b13(b13),.b14(b14),
.b21(b21),.b22(b22),.b23(b23),.b24(b24),
.b31(b31),.b32(b32),.b33(b33),.b34(b34),
.b41(b41),.b42(b42),.b43(b43),.b44(b44),

.c11(c11),.c12(c12),.c13(c13),.c14(c14),
.c21(c21),.c22(c22),.c23(c23),.c24(c24),
.c31(c31),.c32(c32),.c33(c33),.c34(c34),
.c41(c41),.c42(c42),.c43(c43),.c44(c44)

);

/* clock */

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin

$dumpfile("output/waveform.vcd");
$dumpvars(0,tb_stochastic_matrix_multiply_4x4);

reset = 1;
#20;
reset = 0;

/* Example matrices */

a11=128; a12=64;  a13=32;  a14=192;
a21=64;  a22=128; a23=192; a24=32;
a31=32;  a32=64;  a33=128; a34=192;
a41=192; a42=32;  a43=64;  a44=128;

b11=128; b12=64;  b13=32;  b14=192;
b21=64;  b22=128; b23=192; b24=32;
b31=32;  b32=64;  b33=128; b34=192;
b41=192; b42=32;  b43=64;  b44=128;

/* run simulation */

repeat(1000)
#10;

/* print results */

$display("---- RESULT MATRIX ----");

$display("%d %d %d %d",c11,c12,c13,c14);
$display("%d %d %d %d",c21,c22,c23,c24);
$display("%d %d %d %d",c31,c32,c33,c34);
$display("%d %d %d %d",c41,c42,c43,c44);

$finish;

end

endmodule