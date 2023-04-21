`include "macro.vh"

module alu (
    input [2:0] Ctrl,           // ALUの制御信号
    input [31:0] A, B,          // オペランド A, B
    output reg [31:0] Out,      // 演算の結果
    output zero, slt, sltu
);

    assign zero = Out == 0;
    assign slt = $signed(A) < $signed(B);
    assign sltu = A < B;

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