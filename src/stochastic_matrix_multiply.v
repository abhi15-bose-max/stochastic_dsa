module stochastic_matrix_multiply(

    input clk,
    input reset,

    input [7:0] a11,a12,
    input [7:0] a21,a22,

    input [7:0] b11,b12,
    input [7:0] b21,b22,

    output [15:0] c11,
    output [15:0] c12,
    output [15:0] c21,
    output [15:0] c22

);

stochastic_vector_dot_product dp11(
    .clk(clk), .reset(reset),
    .a1_mag(a11), .a2_mag(a12), .a3_mag(8'd0), .a4_mag(8'd0),
    .b1_mag(b11), .b2_mag(b21), .b3_mag(8'd0), .b4_mag(8'd0),
    .result(c11)
);

stochastic_vector_dot_product dp12(
    .clk(clk), .reset(reset),
    .a1_mag(a11), .a2_mag(a12), .a3_mag(8'd0), .a4_mag(8'd0),
    .b1_mag(b12), .b2_mag(b22), .b3_mag(8'd0), .b4_mag(8'd0),
    .result(c12)
);

stochastic_vector_dot_product dp21(
    .clk(clk), .reset(reset),
    .a1_mag(a21), .a2_mag(a22), .a3_mag(8'd0), .a4_mag(8'd0),
    .b1_mag(b11), .b2_mag(b21), .b3_mag(8'd0), .b4_mag(8'd0),
    .result(c21)
);

stochastic_vector_dot_product dp22(
    .clk(clk), .reset(reset),
    .a1_mag(a21), .a2_mag(a22), .a3_mag(8'd0), .a4_mag(8'd0),
    .b1_mag(b12), .b2_mag(b22), .b3_mag(8'd0), .b4_mag(8'd0),
    .result(c22)
);

endmodule