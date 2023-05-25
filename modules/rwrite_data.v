`include "../header/macro.vh"

module rwrite_data(inst, PC, DDT, Imm, Alu_Out, SLT, SLTU, data_in);
    input [31:0] inst;
    input [31:0] PC, DDT, Imm, Alu_Out;
    input SLT, SLTU;
    output [31:0] data_in;

    wire [6:0] opcode = inst[6:0];
    wire [2:0] func = inst[14:12];

    assign data_in =  opcode == `load ? DDT :
                        opcode == `jal || opcode == `jalr ? PC + 4 :
                        opcode == `lui ? Imm :
                        opcode == `auipc ? PC + Imm :
                        func == `slt ? SLT :
                        func == `sltu ? SLTU : Alu_Out;
endmodule