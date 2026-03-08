module parallel_bitstream_generator(

    input clk,
    input reset,

    input [7:0] mag1,
    input [7:0] mag2,
    input [7:0] mag3,
    input [7:0] mag4,

    output bit1,
    output bit2,
    output bit3,
    output bit4

);

wire [7:0] s1,s2,s3,s4;

sobol_generator g1(.clk(clk),.reset(reset),.value(s1));
sobol_generator g2(.clk(clk),.reset(reset),.value(s2));
sobol_generator g3(.clk(clk),.reset(reset),.value(s3));
sobol_generator g4(.clk(clk),.reset(reset),.value(s4));

comparator c1(.a(s1),.b(mag1),.y(bit1));
comparator c2(.a(s2),.b(mag2),.y(bit2));
comparator c3(.a(s3),.b(mag3),.y(bit3));
comparator c4(.a(s4),.b(mag4),.y(bit4));

endmodule