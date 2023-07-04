`include "header/macro.vh"

module WB_stage (rw, rd, reg_in, rwrite, wr_addr, data_in);
    input rw;
    input [4:0] rd;
    input [31:0] reg_in;
    output rwrite;
    output [4:0] wr_addr;
    output [31:0] data_in;

    assign rwrite  = rw;
    assign wr_addr = rd;
    assign data_in = reg_in;
    
endmodule