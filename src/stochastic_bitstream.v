module stochastic_bitstream(

    input clk,
    input reset,

    input [7:0] magnitude,
    input [7:0] seed,

    output bit_out

);

reg [7:0] rnd;

initial rnd = 8'h1;

always @(posedge clk or posedge reset)
begin
    if(reset)
        rnd <= seed;
    else
        rnd <= {rnd[6:0], rnd[7]^rnd[5]^rnd[4]^rnd[3]};
end

assign bit_out = (rnd < magnitude);

endmodule