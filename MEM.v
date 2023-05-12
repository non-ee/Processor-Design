`include "macro.vh"

module MEM (inst, MREQ, WRITE);
    input [31:0] inst;
    output MREQ, WRITE;

    wire [6:0] opcode;
    
    assign opcode = inst[6:0];
    assign MREQ   = opcode == `load || opcode == `store;
    assign WRITE  = opcode == `store;
endmodule