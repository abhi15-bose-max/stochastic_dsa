module stochastic_vector_dot_product(

    input clk,
    input reset,

    input [7:0] a1_mag,
    input [7:0] a2_mag,
    input [7:0] a3_mag,
    input [7:0] a4_mag,

    input [7:0] b1_mag,
    input [7:0] b2_mag,
    input [7:0] b3_mag,
    input [7:0] b4_mag,

    output reg [15:0] result

);

initial result = 0;

wire a1,a2,a3,a4;
wire b1,b2,b3,b4;

stochastic_bitstream A1(.clk(clk),.reset(reset),.magnitude(a1_mag),.seed(8'd1),   .bit_out(a1));
stochastic_bitstream A2(.clk(clk),.reset(reset),.magnitude(a2_mag),.seed(8'd7),   .bit_out(a2));
stochastic_bitstream A3(.clk(clk),.reset(reset),.magnitude(a3_mag),.seed(8'd13),  .bit_out(a3));
stochastic_bitstream A4(.clk(clk),.reset(reset),.magnitude(a4_mag),.seed(8'd19),  .bit_out(a4));

stochastic_bitstream B1(.clk(clk),.reset(reset),.magnitude(b1_mag),.seed(8'd23),  .bit_out(b1));
stochastic_bitstream B2(.clk(clk),.reset(reset),.magnitude(b2_mag),.seed(8'd29),  .bit_out(b2));
stochastic_bitstream B3(.clk(clk),.reset(reset),.magnitude(b3_mag),.seed(8'd31),  .bit_out(b3));
stochastic_bitstream B4(.clk(clk),.reset(reset),.magnitude(b4_mag),.seed(8'd37),  .bit_out(b4));

wire m1,m2,m3,m4;

stochastic_multiplier M1(.a(a1),.b(b1),.y(m1));
stochastic_multiplier M2(.a(a2),.b(b2),.y(m2));
stochastic_multiplier M3(.a(a3),.b(b3),.y(m3));
stochastic_multiplier M4(.a(a4),.b(b4),.y(m4));

reg [7:0] warmup;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        result <= 0;
        warmup <= 0;
    end

    else
    begin
        warmup <= warmup + 1;

        if(warmup > 20)   // wait for streams to stabilize
            result <= result + m1 + m2 + m3 + m4;
    end
end

endmodule