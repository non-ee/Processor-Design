`include "macro.vh"

module alu (
    input [2:0] Ctrl,           // Signal to control ALU operation
    input [31:0] A, B,          // Operands : A, B
    output reg [31:0] Out,      // Output of the operation
    output zero, slt, sltu      // Comparison between A and B
);

    assign zero = Ctrl == `SUB ? (Out == 0) : 1'bx ;
    assign slt  = Ctrl == `SUB ? ($signed(Out) < 0) : 1'bx ;
    assign sltu = Ctrl == `SUB ? (Out < 0) : 1'bx ;

    // Operation Control
    always @(*) begin
        case (Ctrl)
            `ADD : Out <= A + B;
            `SUB : Out <= A - B;
            `AND : Out <= A & B;
            `OR  : Out <= A | B;
            `XOR : Out <= A ^ B;
            `SLL : Out <= A << B;
            `SRA : Out <= A >>> B;
            `SRL : Out <= A >> B;
        endcase
    end
endmodule