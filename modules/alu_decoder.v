`include "header/macro.vh"

module alu_decoder(inst, alusrc, aluctrl);
    input [31:0] inst;
    output [1:0] alusrc;
    output [2:0] aluctrl;

    wire [6:0] opcode = inst[6:0];

    wire   alusrcA, alusrcB;
    assign alusrcA = opcode ==  `jal || opcode == `branch || opcode == `auipc ;
    assign alusrcB = !(opcode == `R_op);

    assign alusrc = {alusrcB, alusrcA};
    assign aluctrl = alu_control(inst);

    // (instruction) --> 3bits Alu control code
    function [2:0] alu_control;
        input [31:0] INST;
        
        if (INST[6:0] == `R_op || INST[6:0] == `I_op) begin
            case (INST[14:12])
                3'b000  : alu_control = INST[30] & INST[5] == 1'b1 ? `SUB : `ADD;      // ADD & SUB
                3'b101  : alu_control = INST[30] == 1'b1 ? `SRA : `SRL;                // Shift Right Logic
                3'b001  : alu_control = `SLL;                                  // Shift Left Logic
                3'b100  : alu_control = `XOR;                                  // XOR
                3'b110  : alu_control = `OR;                                   // OR
                3'b111  : alu_control = `AND;                                  // AND
                default : alu_control = 3'bxxx; 
            endcase
        end

        else
            alu_control = `ADD;

    endfunction

endmodule
