`include "../header/macro.vh"
`include "../modules/imm_decoder.v"
`include "../modules/alu_decoder.v"
`include "../modules/mem_decoder.v"
`include "../modules/raddr_decoder.v"
`include "../modules/rwrite_decoder.v"

module decoder (
    input [31:0] inst,          // Instruction

    output [4:0] rd,            // Register Address to be written
    output [4:0] rs1,           // First Register Address to be read
    output [4:0] rs2,           // Second Register Address to be read

    output [31:0] Imm,          // Immediate
    output AluSrc,              // Signal to indicate the second operand of ALU (rs2 or Imm) 
    output [2:0] AluCtrl,       // Control Signal for ALU

    output MemRead,             // Signal to enable reading from the Data Memory
    output MemWrite,            // Signal to enable writing on the Data Memory

    output RegWrite            // Signal to enable writing on the Registers
);
    
    raddr_decoder decoder_raddr_decoder(.inst(inst), .rs1(rs1), .rs2(rs2), .rd(rd));

    rwrite_decoder decoder_rwrite_decoder(.inst(inst), .rwrite(RegWrite));

    imm_decoder decoder_imm_decoder(.inst(inst), .Imm(Imm));

    alu_decoder decoder_alu_decoder(.inst(inst), .alusrc(AluSrc), .aluctrl(AluCtrl));

    mem_decoder decoder_mem_decoder(.inst(inst), .MemRead(MemRead), .MemWrite(MemWrite));

endmodule