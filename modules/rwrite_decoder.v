`include "../header/macro.vh"

module rwrite_decoder(inst, rwrite);
    input [31:0] inst;
    output rwrite;

    wire [6:0] opcode = inst[6:0];

    assign rwrite = opcode == `lui   ||
                    opcode == `auipc ||     // U-type
                    opcode == `jal   ||     // J-type
                    opcode == `jalr  ||
                    opcode == `load  ||     
                    opcode == `I_op  ||     // I-type
                    opcode == `R_op   ;     // R-type 

endmodule