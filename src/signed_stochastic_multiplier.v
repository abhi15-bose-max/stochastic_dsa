module signed_stochastic_multiplier(

    input mag_a,
    input mag_b,

    input sign_a,
    input sign_b,

    output mag_out,
    output sign_out

);

stochastic_multiplier mult(
    .a(mag_a),
    .b(mag_b),
    .y(mag_out)
);

sign_xor sign_logic(
    .sign_a(sign_a),
    .sign_b(sign_b),
    .sign_out(sign_out)
);

endmodule