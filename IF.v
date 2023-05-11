module IF(clk, rst, PC_IN, PC_OUT, IDT);
    input clk, rst;
    input [31:0] PC_IN;
    output [31:0] PC_OUT;
    output [31:0] IDT;

    reg [31:0] PC;

    assign PC_OUT = PC + 4;
    
    always @(posedge clk, negedge rst) begin
        if (~rst)
            PC <= 0;
        else
            PC <= PC_IN;
    end

endmodule
