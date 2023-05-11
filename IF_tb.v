`include "IF.v"

module IF_tb;
    reg clk, rst;
    reg PC_SRC;
    reg [31:0] PC_IN;
    wire [31:0] PC_OUT;

    IF IF_Unit( .clk(clk), .rst(rst),
                .PC_SRC(PC_SRC),
                .PC_IN(PC_IN), .PC_OUT(PC_OUT) );

    initial begin
        clk = 1;
        rst = 0;
        PC_SRC = 0;
        #1
        clk = 0;
        rst = 1;
        #1
        clk = 1;
        #1 clk = 0; rst = 0;
        #1 clk = 1;
    end
    initial
        $monitor($stime, " ,clk=%b PC_IN = %h PC_OUT = %h", clk, PC_IN, PC_OUT);
endmodule