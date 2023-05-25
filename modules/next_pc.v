`include "../header/macro.vh"

module next_pc(inst, Imm, Alu_Out, zero, slt, sltu, PC, PC_IN);
    input [31:0] inst;
    input [31:0] Imm, Alu_Out;
    input zero, slt, sltu;
    input [31:0] PC;
    output [31:0] PC_IN;

    wire [6:0] opcode   = inst[6:0];
    wire [2:0] func     = inst[14:12];

    wire branch_check;
    assign branch_check = opcode == `branch ? func == `beq ? zero :
                                            func == `bne  ? ~zero :
                                            func == `blt  ? slt :
                                            func == `bltu ? sltu :
                                            func == `bge  ? ~slt :
                                            func == `bgeu ? ~sltu : 1'bx 
                                            : 0;


    assign PC_IN =  branch_check ? PC + Imm :
                    opcode == `jal ? PC + Imm :
                    opcode == `jalr ? Alu_Out : PC + 4;

endmodule