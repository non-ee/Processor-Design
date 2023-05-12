`include "macro.vh"

module mem_decoder (inst, MemRead, MemWrite);
    input [31:0] inst;
    output MemRead, MemWrite;

    wire [6:0] opcode = inst[6:0];
    
    assign MemRead = opcode == `load;
    assign MemWrite = opcode == `store;
endmodule