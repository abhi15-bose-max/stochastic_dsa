module counter_accumulator(
    input clk,
    input reset,
    input bit_in,
    output reg [15:0] count
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        count <= 0;
    else if(bit_in)
        count <= count + 1;
end

endmodule