`include "../header/macro.vh"

module alu_decoder(inst, alusrc, aluctrl);
    input [31:0] inst;
    output alusrc;
    output [2:0] aluctrl;

    wire [6:0] opcode = inst[6:0];

    assign alusrc  =  opcode == `load || opcode == `store || opcode == `I_op || opcode == `jalr ;
    assign aluctrl = alu_control(inst);

    // (instruction) --> 3bits Alu control code
    function [2:0] alu_control;
        input [31:0] INST;
        
        // R-type
        if (INST[6:0] == `R_op) begin
            case ({INST[31:25], INST[14:12]})
                10'b0000000_000 : alu_control = `ADD;       // ADD
                10'b0100000_000 : alu_control = `SUB;       // SUB
                10'b0000000_001 : alu_control = `SLL;       // Shift Left Logic
                10'b0000000_010,        
                10'b0000000_011 : alu_control = `SUB;       // SLT, SLTU
                10'b0000000_100 : alu_control = `XOR;       // XOR
                10'b0000000_101 : alu_control = `SRL;       // Shift Right Logic
                10'b0100000_101 : alu_control = `SRA;       // Shift Right Arithmetic
                10'b0000000_110 : alu_control = `OR;        // OR
                10'b0000000_111 : alu_control = `AND;       // AND
                default         : alu_control = 3'bxxx; 
            endcase
        end
        
        // I-type
        else if (INST[6:0] == `jalr || INST[6:0] == `load)
            alu_control = `ADD;
        else if (INST[6:0] == `I_op) begin
            case (INST[14:12])
                3'b000 : alu_control = `ADD;                                 // addi
                3'b010,                                  
                3'b011 : alu_control = `SUB;                                 // slti, sltiu;
                3'b100 : alu_control = `XOR;                                 // xori
                3'b110 : alu_control = `OR;                                  // ori
                3'b111 : alu_control = `AND;                                 // andi

                3'b001 : alu_control = `SLL;                                 // slli
                3'b101 : alu_control =  (INST[31:25] == 0 )    ? `SRL :      // srli      
                                        (INST[31:25] == 7'h20) ? `SRA :      // srai
                                                                3'bxxx;    
                default: alu_control = 3'bxxx;
            endcase
        end

        // S-type, U-type
        else if (INST[6:0] == `store || INST[6:0] == `auipc)
            alu_control = `ADD;
        else if (INST[6:0] == `branch)
            alu_control = `SUB;

    endfunction

endmodule