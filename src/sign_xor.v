module sign_xor(
    input sign_a,
    input sign_b,
    output sign_out
);

assign sign_out = sign_a ^ sign_b;

endmodule