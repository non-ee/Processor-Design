`timescale 1ns/1ps

`include "macro.vh"
`include "alu.v"
`include "decoder.v"
`include "rf32x32.v"

module top(
    input clk, rst,                
    input ACKD_n, 
    input ACKI_n,
    input [31:0] IDT,               // Instruction Data
    input [2:0] OINT_n,
    input [31:0] Reg_temp,

    output [31:0] IAD,              // Instruction Address  (Next PC)
    output [31:0] DAD,              // Data Address         (Memory address for load inst)
    output MREQ,                    // Enable access to Data Memory     (for load/store inst)
    output WRITE,                   // Enable writing into Data Memory  (for store inst)
    output [1:0] SIZE,              // Specify size of data to read/write (for load/store)
    output IACK_n,

    inout [31:0] DDT                // for load inst, as an input read from data memory
                                    // for store inst, as an output to be read by data memory
);

    wire [31:0] inst  = IDT;
    wire [7:0] opcode = inst[6:0];
    wire [2:0] func   = inst[14:12];

/*******************************************************************************/
/*                                 Program Counter                             */
/*******************************************************************************/
    parameter PC_ORIGIN = 32'h10000;
    wire PcSrc;
    reg [31:0] PC;
    wire [31:0] PC_IN;
    wire LOAD_ON;
    reg LOAD_OFF = 1;

    always @(posedge clk or negedge rst) begin
        if (~rst) 
            PC <= PC_ORIGIN;
        else if (LOAD_OFF)
            PC <= PcSrc ? PC_IN : PC + 4;
    end

    assign LOAD_ON = opcode == `load;
    always @(negedge clk) begin
        if (LOAD_ON) LOAD_OFF <= ~LOAD_OFF;
    end

/*******************************************************************************/
/*                              Instruction Decoder                            */
/*******************************************************************************/
    wire [4:0] rs1, rs2, rd;
    wire RegWrite, MemRead, MemWrite, AluSrc;
    wire [2:0] AluCtrl;
    wire [31:0] Imm;

    decoder u_decoder(
        .inst(inst),
        .rd(rd), .rs1(rs1), .rs2(rs2),
        .RegWrite(RegWrite),
        .MemRead(MemRead), .MemWrite(MemWrite),
        .AluSrc(AluSrc),
        .AluCtrl(AluCtrl),
        .Imm(Imm)
    );

/*******************************************************************************/
/*                                  Register File                              */
/*******************************************************************************/
    wire [31:0] rs1_data, rs2_data;         // Data read from rs1, rs2
    wire [31:0] regWrData;                  // Data to be written into register
    wire wr_n = LOAD_ON ? LOAD_OFF : RegWrite;

    rf32x32 u_regfile(
        .clk(~clk), .reset(rst),
        .wr_n(~wr_n), 
        .rd1_addr(rs1), .rd2_addr(rs2), .wr_addr(rd),
        .data_in(regWrData),
        .data1_out(rs1_data), .data2_out(rs2_data)
    );
    
/*******************************************************************************/
/*                                     Alu                                     */
/*******************************************************************************/
    wire [31:0] Alu_A, Alu_B;               // ALU operand
    wire [31:0] Alu_Out;                    // ALU output
    wire ZERO, SLT, SLTU;                   // Comparison of the two operands

    assign Alu_A = rs1_data;                
    assign Alu_B = AluSrc ? Imm : rs2_data;

    alu u_alu(
        .Ctrl(AluCtrl),
        .A(Alu_A), .B(Alu_B),
        .Out(Alu_Out),
        .zero(ZERO), .slt(SLT), .sltu(SLTU)
    );

/*******************************************************************************/
/*                               Data Memory Wires                             */
/*******************************************************************************/
    wire [31:0] memAddr;                    // Memory address to be read from Data Memory
    wire [31:0] memRdData, memWrData;       // memRdData : value read from memAddr
                                            // memWrData : value to be written into Data Memory
    assign memAddr = Alu_Out;
    assign memWrData = rs2_data;
    assign memRdData = DDT;

    
    assign regWrData =  opcode == `load ? memRdData :
                        opcode == `jal || opcode == `jalr ? PC + 4 :
                        opcode == `lui ? Imm :
                        opcode == `auipc ? PC + Imm :
                        func == `slt ? SLT :
                        func == `sltu ? SLTU : Alu_Out;
                        

/*******************************************************************************/
/*                                PcSrc, PC_IN                                 */
/*******************************************************************************/

    wire branch_check;
    assign branch_check = opcode == `branch ?   func == `beq ? ZERO :
                                                func == `bne ? ~ZERO :
                                                func == `blt ? SLT :
                                                func == `bge ? ~SLT :
                                                func == `bltu ? SLTU :
                                                func == `bgeu ? ~SLTU : 1'bx
                                                : 0;

    assign PcSrc =  opcode === 7'bxxxxxxx ? 0 : opcode == `branch ? branch_check :
                                                opcode == `jal || opcode == `jalr ;

    assign PC_IN =  opcode == `jal ? PC + Imm :
                    opcode == `jalr ? Alu_Out :
                    opcode == `branch ? PC + Imm : 32'hxxxxxxxx;

/*******************************************************************************/
/*                           Output Ports Assignments                          */
/*******************************************************************************/
    assign IAD = PC;
    assign DAD = memAddr;
    assign MREQ = MemRead || MemWrite;
    assign WRITE = MemWrite;
    assign SIZE =   func[1:0] == 2'b10 ? 2'b00 :     // word
                    func[1:0] == 2'b01 ? 2'b01 :     // half
                    func[1:0] == 2'b00 ? 2'b10 :     // byte
                                        2'bxx;

    assign IACK_n = 1;
    assign DDT = memWrData;

endmodule