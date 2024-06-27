module Instr_Memory(
    input [31:0] pcCurrent,
    
    output [31:0] instr
);

    reg [31:0] Instruction[9:0];

    initial begin

        // subone
        // Instruction[0] = 32'd8454156;
        // Instruction[1] = 32'd8519691;
        // Instruction[2] = 32'd8585226;
        // Instruction[3] = 32'd17432578;
        // Instruction[4] = 32'd720897;
        // Instruction[5] = 32'd16842749;
        // Instruction[6] = 32'd29360128;
        // Instruction[7] = 32'd4718596;
        // Instruction[8] = 32'd12845069;
        // Instruction[9] = 32'd25165824;


        // jalrTest
        Instruction[0] = 32'd8519687;
        Instruction[1] = 32'd22216704;
        Instruction[2] = 32'd16777219;
        Instruction[3] = 32'd29360128;
        Instruction[4] = 32'd29360128;
        Instruction[5] = 32'd1179649;
        Instruction[6] = 32'd25165824;
    end

    assign instr = Instruction[pcCurrent];

endmodule
