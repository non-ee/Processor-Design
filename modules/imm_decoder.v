`include "header/macro.vh"

module imm_decoder (inst, Imm);
    input [31:0] inst;
    output [31:0] Imm;

    assign Imm = Immediate(inst);

    // (instruction) --> 32bits Immediate 
    function [31:0] Immediate;
        input [31:0] INST;
        case (INST[6:0])        
            `jalr, `load : Immediate = {{20{INST[31]}}, INST[31:20]};                                          /* I-type format */
            `I_op : begin
                        case (INST[14:12])
                            3'b001,
                            3'b101  : Immediate = INST[24:20];
                            default : Immediate = {{20{INST[31]}}, INST[31:20]}; 
                        endcase
                    end
            
            `store      : Immediate = {{20{INST[31]}}, INST[31:25], INST[11:7]};                               /* S-type format */
            `branch     : Immediate = {{20{INST[31]}}, INST[7], INST[30:25], INST[11:8], 1'b0};      /* B-type format */
            `lui,`auipc : Immediate = {INST[31:12], 12'b0};                                             /* B-type format */
            `jal        : Immediate = {{12{INST[31]}}, INST[19:12], INST[20], INST[30:21], 1'b0};    /* J-type format */
        endcase
    endfunction
endmodule