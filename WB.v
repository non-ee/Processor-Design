`include "macro.vh"

module WB (inst, DDT, Imm, PC, Alu_Out, regwrite, reg_data_in);
    input [31:0] inst;
    input [31:0] DDT, Imm, PC, Alu_Out;
    output regwrite;
    output [31:0] reg_data_in;

    wire [6:0] opcode;
    assign opcode = inst[6:0];

    assign regwrite =   opcode == `lui || opcode == `auipc ||
                        opcode == `jal || opcode == `jalr  || opcode == `load ||
                        opcode == `I_op || opcode == `R_op;

    assign reg_data_in =    opcode == `lui ? Imm :
                            opcode == `auipc ? PC + Imm :
                            opcode == `jal || opcode == `jalr ? PC + 4 :
                            opcode == `I_op || opcode == `R_op ? Alu_Out : 32'hxxxxxxxx;
    
endmodule