`timescale 1ns/1ps

module tb_signed_multiplier;

reg mag_a;
reg mag_b;

reg sign_a;
reg sign_b;

wire mag_out;
wire sign_out;

signed_stochastic_multiplier uut(

    .mag_a(mag_a),
    .mag_b(mag_b),

    .sign_a(sign_a),
    .sign_b(sign_b),

    .mag_out(mag_out),
    .sign_out(sign_out)
);

initial
begin

$dumpfile("output/waveform.vcd");
$dumpvars(0,tb_signed_multiplier);

$monitor("t=%0t signA=%b signB=%b magA=%b magB=%b -> signOut=%b magOut=%b",
        $time,sign_a,sign_b,mag_a,mag_b,sign_out,mag_out);

sign_a=0; sign_b=0;
mag_a=1; mag_b=1;
#10;

sign_a=1; sign_b=0;
mag_a=1; mag_b=1;
#10;

sign_a=1; sign_b=1;
mag_a=1; mag_b=1;
#10;

sign_a=0; sign_b=1;
mag_a=1; mag_b=1;
#10;

$finish;

end

endmodule