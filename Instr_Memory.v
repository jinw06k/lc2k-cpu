module Instr_Memory(
    input pcCurrent,
    
    output reg [31:0] instr
);

    reg [31:0] Instruction[8:0];

    initial begin
        Instruction[0] = 32'd08454154;
        Instruction[1] = 32'd08519689;
        Instruction[2] = 32'd00655361;
        Instruction[3] = 32'd29360128;
        Instruction[4] = 32'd00655361;
        Instruction[5] = 32'd29360128;
        Instruction[6] = 32'd00655361;
        Instruction[7] = 32'd29360128;
        Instruction[8] = 32'd25165824;
    end

    always @(pcCurrent) begin
        instr <= Instruction[pcCurrent];
    end

endmodule