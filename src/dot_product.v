module dot_product(
    input clk,
    input reset,
    input a,
    input b,
    output [15:0] result
);

wire mult_out;

stochastic_multiplier mult(
    .a(a),
    .b(b),
    .y(mult_out)
);

counter_accumulator acc(
    .clk(clk),
    .reset(reset),
    .bit_in(mult_out),
    .count(result)
);

endmodule