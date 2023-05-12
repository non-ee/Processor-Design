`timescale 1ns/1ps

`include "macro.vh"
`include "alu.v"
`include "decoder.v"
`include "next_pc.v"
`include "rwrite_data.v"
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
    
    reg [31:0] PC;
    wire [31:0] PC_IN;
    wire LOAD_ON;
    reg new_clk = 0;

    always @(posedge clk or negedge rst) begin
        if (~rst) 
            PC <= PC_ORIGIN;
        else if (~new_clk)
            PC <= PC_IN;
    end

    assign LOAD_ON = opcode == `load;
    always @(negedge clk) begin
        if (LOAD_ON) new_clk <= ~new_clk;
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
        .Imm(Imm),
        .AluSrc(AluSrc), .AluCtrl(AluCtrl),
        .MemRead(MemRead), .MemWrite(MemWrite),
        .RegWrite(RegWrite)
    );

/*******************************************************************************/
/*                                  Register File                              */
/*******************************************************************************/
    wire [31:0] rs1_data, rs2_data;         // Data read from rs1, rs2
    wire [31:0] data_in;                  // Data to be written into register
    wire wr_n = LOAD_ON ? ~new_clk && RegWrite : RegWrite;

    rf32x32 u_regfile(
        .clk(~clk), .reset(rst),
        .wr_n(~wr_n), 
        .rd1_addr(rs1), .rd2_addr(rs2), .wr_addr(rd),
        .data_in(data_in),
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
/*                            Write Back to Register                           */
/*******************************************************************************/
    rwrite_data u_rwrite_data(
        .inst(inst),
        .PC(PC), .DDT(DDT), .Imm(Imm), .Alu_Out(Alu_Out),
        .SLT(SLT), .SLTU(SLTU),
        .data_in(data_in)
    );

/*******************************************************************************/
/*                                   Next PC                                   */
/*******************************************************************************/
    next_pc u_next_pc(
        .inst(inst),
        .Imm(Imm), .Alu_Out(Alu_Out),
        .zero(ZERO), .slt(SLT), .sltu(SLTU),
        .PC(PC), .PC_IN(PC_IN)
    );

/*******************************************************************************/
/*                           Output Ports Assignments                          */
/*******************************************************************************/
    assign IAD = PC;
    assign DAD = Alu_Out;
    assign MREQ = MemRead || MemWrite;
    assign WRITE = MemWrite;
    assign SIZE =   func[1:0] == 2'b10 ? 2'b00 :     // word
                    func[1:0] == 2'b01 ? 2'b01 :     // half
                    func[1:0] == 2'b00 ? 2'b10 :     // byte
                                        2'bxx;

    assign IACK_n = 1;
    assign DDT = rs2_data;

endmodule