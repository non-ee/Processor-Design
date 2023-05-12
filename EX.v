`include "macro.vh"
`include "alu.v"

module EX (inst, data1_out, data2_out, Imm, Alu_Out, PC, PC_IN);
    input [31:0] inst;
    input [31:0] data1_out, data2_out, Imm;
    input [31:0] PC;
    output [31:0] Alu_Out;
    output [31:0] PC_IN;

    wire [6:0] opcode   = inst[6:0];
    wire [2:0] func     = inst[14:12];

    /* ALU */
    wire AluSrc;
    wire [31:0] A, B, Out;
    wire [2:0] ctrl;
    wire zero, slt, sltu;

    assign AluSrc = opcode == `store || opcode == `load || opcode == `jalr || opcode == `I_op;
    assign A = data1_out;
    assign B = AluSrc ? Imm : data2_out;
    assign ctrl = alu_control(inst);

    assign Alu_Out =    func == `slt ? slt :
                        func == `sltu ? sltu : Out;

    alu u_alu(
        .Ctrl(ctrl),
        .A(B), .B(B), .Out(Out),
        .zero(zero), .slt(slt), .sltu(sltu)
    );

    /*  PC_IN */
    wire branch;
    assign branch = opcode == `branch ? func == `beq ? zero :
                                            func == `bne  ? ~zero :
                                            func == `blt  ? slt :
                                            func == `bltu ? sltu :
                                            func == `bge  ? ~slt :
                                            func == `bgeu ? ~sltu : 1'bx 
                                            : 0;

    assign PC_IN =  branch  ? PC + Imm : 
                    opcode == `jal ? PC + Imm :
                    opcode == `jalr ? Out : PC + 4;

    // (instruction) --> 3bits Alu control code
    function [2:0] alu_control;
        input [31:0] INST;
        
        // R-type
        if (INST[6:0] == 7'b0110011) begin
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
        else if (inst[6:0] == `jalr || inst[6:0] == `load)
            alu_control = 0;
        else if (inst[6:0] == `I_op) begin
            case (inst[14:12])
                3'b000 : alu_control = `ADD;                                 // addi
                3'b010,                                  
                3'b011 : alu_control = `SUB;                                 // slti, sltiu;
                3'b100 : alu_control = `XOR;                                 // xori
                3'b110 : alu_control = `OR;                                  // ori
                3'b111 : alu_control = `AND;                                 // andi

                3'b001 : alu_control = `SLL;                                 // slli
                3'b101 : alu_control =  (inst[31:25] == 0 )    ? `SRL :      // srli      
                                        (inst[31:25] == 7'h20) ? `SRA :      // srai
                                                                3'bxxx;    
                default: alu_control = 3'bxxx;
            endcase
        end

        // S-type, U-type
        else if (inst[6:0] == `store || inst[6:0] == `auipc)
            alu_control = `ADD;
        else if (inst[6:0] == `branch)
            alu_control = `SUB;

    endfunction
endmodule