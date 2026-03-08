module vector_dot_product(

    input clk,
    input reset,

    input a1, input b1,
    input a2, input b2,
    input a3, input b3,
    input a4, input b4,

    output reg [15:0] result

);

wire m1;
wire m2;
wire m3;
wire m4;

stochastic_multiplier mult1(.a(a1), .b(b1), .y(m1));
stochastic_multiplier mult2(.a(a2), .b(b2), .y(m2));
stochastic_multiplier mult3(.a(a3), .b(b3), .y(m3));
stochastic_multiplier mult4(.a(a4), .b(b4), .y(m4));

always @(posedge clk or posedge reset)
begin

    if(reset)
        result <= 0;

    else
        result <= result + m1 + m2 + m3 + m4;

end

endmodule