`include "header/macro.vh"

module IF_stage (clk, rst, stall, pcsrc, PC_START, PC_IN, PC, PC_4);
    input clk, rst;
    input stall,  pcsrc;
    input [31:0] PC_START, PC_IN;
    output [31:0] PC;
    output [31:0] PC_4;

    wire [31:0] PC_w;

    rst_default_Reg #(32) PC_register(.clk(clk), .rst(rst), .en(~stall), .DEFAULT(PC_START), .IN(PC_w), .OUT(PC));

    assign PC_w = pcsrc ? PC_IN : PC_4;
    assign PC_4 = PC + 32'h04;

endmodule
