module sobol_generator(

    input clk,
    input reset,

    output reg [7:0] value

);

initial value = 8'h1;

always @(posedge clk or posedge reset)
begin
    if(reset)
        value <= 8'h1;
    else
        value <= {value[6:0], value[7]^value[5]^value[4]^value[3]};
end

endmodule