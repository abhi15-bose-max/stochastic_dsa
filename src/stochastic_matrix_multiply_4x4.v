module stochastic_matrix_multiply_4x4(

input clk,
input reset,

input [7:0] a11,a12,a13,a14,
input [7:0] a21,a22,a23,a24,
input [7:0] a31,a32,a33,a34,
input [7:0] a41,a42,a43,a44,

input [7:0] b11,b12,b13,b14,
input [7:0] b21,b22,b23,b24,
input [7:0] b31,b32,b33,b34,
input [7:0] b41,b42,b43,b44,

output [15:0] c11,c12,c13,c14,
output [15:0] c21,c22,c23,c24,
output [15:0] c31,c32,c33,c34,
output [15:0] c41,c42,c43,c44

);

/* Row1 */

stochastic_vector_dot_product dp11(clk,reset,a11,a12,a13,a14,b11,b21,b31,b41,c11);
stochastic_vector_dot_product dp12(clk,reset,a11,a12,a13,a14,b12,b22,b32,b42,c12);
stochastic_vector_dot_product dp13(clk,reset,a11,a12,a13,a14,b13,b23,b33,b43,c13);
stochastic_vector_dot_product dp14(clk,reset,a11,a12,a13,a14,b14,b24,b34,b44,c14);

/* Row2 */

stochastic_vector_dot_product dp21(clk,reset,a21,a22,a23,a24,b11,b21,b31,b41,c21);
stochastic_vector_dot_product dp22(clk,reset,a21,a22,a23,a24,b12,b22,b32,b42,c22);
stochastic_vector_dot_product dp23(clk,reset,a21,a22,a23,a24,b13,b23,b33,b43,c23);
stochastic_vector_dot_product dp24(clk,reset,a21,a22,a23,a24,b14,b24,b34,b44,c24);

/* Row3 */

stochastic_vector_dot_product dp31(clk,reset,a31,a32,a33,a34,b11,b21,b31,b41,c31);
stochastic_vector_dot_product dp32(clk,reset,a31,a32,a33,a34,b12,b22,b32,b42,c32);
stochastic_vector_dot_product dp33(clk,reset,a31,a32,a33,a34,b13,b23,b33,b43,c33);
stochastic_vector_dot_product dp34(clk,reset,a31,a32,a33,a34,b14,b24,b34,b44,c34);

/* Row4 */

stochastic_vector_dot_product dp41(clk,reset,a41,a42,a43,a44,b11,b21,b31,b41,c41);
stochastic_vector_dot_product dp42(clk,reset,a41,a42,a43,a44,b12,b22,b32,b42,c42);
stochastic_vector_dot_product dp43(clk,reset,a41,a42,a43,a44,b13,b23,b33,b43,c43);
stochastic_vector_dot_product dp44(clk,reset,a41,a42,a43,a44,b14,b24,b34,b44,c44);

endmodule