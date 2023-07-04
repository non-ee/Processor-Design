module rst_en_Reg #(parameter WIDTH = 32) (clk, rst, en, IN, OUT);
    input clk, rst, en;
    input [WIDTH-1:0] IN;
    output reg [WIDTH-1:0] OUT;

    always @(posedge clk, negedge rst) begin
        if (~rst)
            OUT <= {WIDTH{1'b0}};
        else if (en)
            OUT <= IN;
    end
endmodule