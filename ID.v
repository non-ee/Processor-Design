module ID (INST, rwrite, IMM, RDT_1, RDT_2);
    input [31:0] INST;
    input rwrite;

    wire [6:0] opcode;
    assign opcode = INST[6:0];

    wire [4:0] rs1, rs2, rd;
    assign rs1 = INST[19:15];
    assign rs2 = INST[24:20];
    assign rd  = INST[11:7];

    assign rwrite = opcode == `lui   ||
                    opcode == `auipc ||
                    opcode == `jal   ||
                    opcode == `jalr  ||
                    opcode == `load  ||
                    opcode == `I_op  ||
                    opcode == `R_op;


    // assign IMM = Immediate(INST);

    
endmodule