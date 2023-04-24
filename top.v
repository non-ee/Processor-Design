`include "macro.vh"
`include "alu.v"
`include "decoder.v"
`include "rf32x32.v"

module top(
    input clk, rst,
    input ACKD_n, 
    input ACKI_n,
    input [31:0] IDT,
    input [2:0] OINT_n,
    input [31:0] Reg_temp,

    output [31:0] IAD,
    output [31:0] DAD,
    output MREQ,
    output WRITE,
    output [1:0] SIZE,
    output IACK_n,

    inout [31:0] DDT
);

/***********************************************/
/*                Program Counter              */
/***********************************************/

    reg PcSrc;
    reg [31:0] PC_IN, PC;
    always @(posedge clk or negedge rst) begin
        if (~rst) 
            PC <= 0;
        else begin
            PC <= PcSrc ? PC_IN : PC + 4;
            PcSrc <= 0;
        end
    end

    /* Instruction Decoder */
    wire [31:0] inst;
    wire [7:0] opcode;
    wire [2:0] func;
    assign inst = IDT; 
    assign opcode = inst[6:0];
    assign func = inst[14:12];

    wire [4:0] rs1, rs2, rd;
    wire RegWrite, MemRead, MemWrite, AluSrc;
    wire [1:0] MemToReg;
    wire [2:0] AluCtrl;
    wire [31:0] Imm;

    decoder u_decoder(
        .inst(inst),
        .rd(rd), .rs1(rs1), .rs2(rs2),
        .RegWrite(RegWrite),
        .MemRead(MemRead), .MemWrite(MemWrite),
        .AluSrc(AluSrc),
        .MemToReg(MemToReg),
        .AluCtrl(AluCtrl),
        .Imm(Imm)
    );

/***********************************************/
/*                 Register File               */
/***********************************************/

    wire [31:0] rs1_data, rs2_data;         // Data read from rs1, rs2
    wire [31:0] regWrData;                  // Data to be written into register

    rf32x32 u_regfile(
        .clk(clk), .reset(rst),
        .wr_n(RegWrite), 
        .rd1_addr(rs1), .rd2_addr(rs2), .data_in(regWrData),
        .data1_out(rs1_data), .data2_out(rs2_data)
    );
    
/***********************************************/
/*                      ALU                    */
/***********************************************/
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

/***********************************************/
/*                  Data Memory                */
/***********************************************/
    wire [31:0] memAddr;                    // Memory address to be read from Data Memory
    wire [31:0] memRdData, memWrData;       // memRdData : value read from memAddr
                                            // memWrData : value to be written into Data Memory
    assign memAddr = Alu_Out;
    assign memWrData = rs2_data;
    assign memRdData = DDT;
    // assign memWrData =  func == 3'b000 ? rs1_data[7:0] :       // store byte
    //                     func == 3'b001 ? rs1_data[15:0] :      // store half
    //                     func == 3'b010 ? rs2_data :            // store word
    //                                     32'hxxxxxxxx;

    /* Write data to register */
    wire [31:0] ld_Data, U_type_wrData;
    // assign ld_Data =    func == 3'b000 ? $signed(memRdData[7:0]) :           // load byte
    //                     func == 3'b001 ? $signed(memRdData[15:0]) :          // load half
    //                     func == 3'b010 ? memRdData :                         // load word
    //                     func == 3'b100 ? memRdData[7:0] :                    // load byte (unsigned)
    //                     func == 3'b101 ? memRdData[15:0] :                   // load half (unsigned)
    //                                     32'hxxxxxxxx;

    assign  U_type_wrData =  opcode == `lui   ? Imm :                     // lui
                            opcode == `auipc ? PC + Imm :                // auipc
                                                32'hxxxxxxxx;

    assign  regWrData =  MemToReg == 1 ? memRdData :
                        MemToReg == 2 ? PC + 4 :
                        MemToReg == 3 ? U_type_wrData :
                                        Alu_Out;


/***********************************************/
/*                    Next PC                  */
/***********************************************/
    always @(posedge (opcode == `jal)) begin
        PcSrc <= 1;
        PC_IN <= Imm;
    end

    always @(posedge (opcode == `jalr)) begin
        PcSrc <= 1;
        PC_IN <= rs1_data + Imm;
    end

    reg branch_check;
    always @(posedge (opcode == `branch)) begin
        branch_check =  func == `beq ? ZERO  :
                        func == `bne ? ~ZERO :
                        func == `blt ? SLT   :
                        func == `bge ? ~SLT  :
                        func == `bltu ? SLTU :
                        func == `bgeu ? ~SLTU :
                                        1'bx;

        PcSrc = branch_check;
        PC_IN = branch_check ? PC + Imm : 32'hxxxxxxxx;
    end

    // Output Assignment
    assign IAD = PC;
    assign DAD = Alu_Out;
    assign MREQ = MemRead;
    assign WRITE = MemWrite;
    assign SIZE =   func[1:0] == 10 ? 2'b00 :     // word
                    func[1:0] == 01 ? 2'b01 :     // half
                    func[1:0] == 00 ? 2'b1x :     // byte
                                        2'bxx;

    assign IACK_n = 1;
    assign DDT = memWrData;

endmodule