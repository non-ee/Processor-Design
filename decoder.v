`include "macro.vh"

module decoder (
    input [31:0] inst,          // Instruction
    output [4:0] rd,            // Register Address to be written
    output [4:0] rs1,           // First Register Address to be read
    output [4:0] rs2,           // Second Register Address to be read
    output RegWrite,            // Signal to enable writing on the Registers
    output MemRead,             // Signal to enable reading from the Data Memory
    output MemWrite,            // Signal to enable writing on the Data Memory
    output AluSrc,              // Signal to indicate the second operand of ALU (rs2 or Imm) 
    output [2:0] AluCtrl,       // Control Signal for ALU
    output [31:0] Imm           // Immediate
);
    
    wire [6:0] opCode;
    assign opCode = inst[6:0];

    assign rd  = inst[11:7];
    assign rs1 = inst[19:15];
    assign rs2 = inst[24:20];

    assign RegWrite =   opCode == `lui   ||
                        opCode == `auipc ||     // U-type
                        opCode == `jal   ||     // J-type
                        opCode == `jalr  ||
                        opCode == `load  ||     
                        opCode == `I_op  ||     // I-type
                        opCode == `R_op   ;     // R-type

    assign MemRead  =   opCode == `load;        // enable read the memory for load instruction
    
    assign MemWrite =   opCode == `store;       // enable write over the memory for store instruction                                                    
    
    assign AluSrc  =  opCode == `load || opCode == `store || opCode == `I_op || opCode == `jalr ;
                                
    assign AluCtrl = alu_control(inst);

    assign Imm = Immediate(inst);

    // (instruction) --> 32bits Immediate 
    // (instruction) --> 32bits Immediate 
    function [31:0] Immediate;
        input [31:0] inst;
        case (inst[6:0])        
            `jalr, `load : Immediate = $signed({inst[31:20]});           /* I-type format */
            `I_op       : Immediate = inst[14:12] == 3'b001 || inst[14:12] == 3'b101 ? inst[24:20] : $signed(inst[31:20]);
            `store      : Immediate = $signed({inst[31:25], inst[11:7]});                               /* S-type format */
            `branch     : Immediate = $signed({inst[31], inst[7], inst[30:25], inst[11:8], 1'b0});      /* B-type format */
            `lui,`auipc : Immediate = {inst[31:12], 12'b0};                                             /* B-type format */
            `jal        : Immediate = $signed({inst[31], inst[19:12], inst[20], inst[30:21], 1'b0});    /* J-type format */
        endcase
    endfunction

    // (instruction) --> 3bits Alu control code
    function [2:0] alu_control;
        input [31:0] inst;
        
        // R-type
        if (inst[6:0] == `R_op) begin
            case ({inst[31:25], inst[14:12]})
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
            alu_control = `ADD;
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