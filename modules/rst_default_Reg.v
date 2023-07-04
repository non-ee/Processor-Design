module rst_default_Reg #(parameter WIDTH = 32) (clk, rst, en, DEFAULT, IN, OUT);
    input clk, rst, en;
    input [WIDTH-1:0] DEFAULT, IN;
    output reg [WIDTH-1:0] OUT;

    always @(posedge clk, negedge rst) begin
        if (~rst)
            OUT <= DEFAULT;
        else if (en)
            OUT <= IN;
    end
endmodule