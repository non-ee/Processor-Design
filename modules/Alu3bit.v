`include "header/macro.vh"

module Alu3bit (
    input [2:0] Ctrl,           // Signal to control ALU operation
    input [31:0] A, B,          // Operands : A, B
    output [31:0] Out      // Output of the operation
);

    assign Out  =   Ctrl == `ADD ? A + B    :
                    Ctrl == `SUB ? A - B    :
                    Ctrl == `AND ? A & B    :
                    Ctrl == `OR  ? A | B    :
                    Ctrl == `XOR ? A ^ B    :
                    Ctrl == `SLL ? A << B   :
                    Ctrl == `SRA ? A >>> B  :
                    Ctrl == `SRL ? A >> B   : 32'hxxxxxxxx;

endmodule