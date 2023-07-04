`include "header/macro.vh"
`include "modules/imm_decoder.v"
`include "modules/alu_decoder.v"

module Decoder (
    input [31:0] inst,          // Instruction
    input flush,
    output [4:0] rd,            // Register Address to be written
    output [4:0] rs1,           // First Register Address to be read
    output [4:0] rs2,           // Second Register Address to be read

    output [31:0] Imm,          // Immediate
    output [1:0] AluSrc,              // Signal to indicate the second operand of ALU (rs2 or Imm) 
    output [2:0] AluCtrl,       // Control Signal for ALU

    output MREQ,             // Signal to enable reading from the Data Memory
    output WRITE,            // Signal to enable writing on the Data Memory
    output [1:0] SIZE,

    output RegWrite            // Signal to enable writing on the Registers
);

    wire [6:0] opcode = inst[6:0];
    wire [2:0] func = inst[14:12];

    assign rd  = inst[11:7];    
    assign rs1 = inst[19:15];
    assign rs2 = inst[24:20];

    imm_decoder decoder_imm_decoder(.inst(inst), .Imm(Imm));

    alu_decoder decoder_alu_decoder(.inst(inst), .alusrc(AluSrc), .aluctrl(AluCtrl));

    wire rw_ =  opcode == `lui  | opcode == `auipc | opcode == `jal | opcode == `jalr | 
                opcode == `load | opcode == `I_op  | opcode == `R_op;

    assign MREQ  = opcode == `load | opcode == `store;
    assign WRITE = flush ? 1'b0 : opcode == `store;
    assign SIZE  =  func[1:0] == 2'b00 ? `BYTE :
                    func[1:0] == 2'b01 ? `HALF : `WORD;
    
    assign RegWrite = flush | rd == 5'b0 ? 1'b0 : rw_;

endmodule
