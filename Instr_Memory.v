module Instr_Memory(
    input clk,
    input [31:0] pcCurrent,
    
    output [31:0] instr
);

    reg [31:0] Instruction[9:0];

    initial begin
        // Instruction[0] = 32'd08454154;
        // Instruction[1] = 32'd08519689;
        // Instruction[2] = 32'd655361;
        // Instruction[3] = 32'd29360128;
        // Instruction[4] = 32'd655361;
        // Instruction[5] = 32'd29360128;
        // Instruction[6] = 32'd655361;
        // Instruction[7] = 32'd29360128;
        // Instruction[8] = 32'd25165824;

        // Instruction[0] = 32'd8454152;
        // Instruction[1] = 32'd12648455;
        // Instruction[2] = 32'd21561344;
        // Instruction[3] = 32'd5308419;
        // Instruction[4] = 32'd17694716;
        // Instruction[5] = 32'd8847369;
        // Instruction[6] = 32'd29360128;
        // Instruction[7] = 32'd25165824;


        Instruction[0] = 32'd8454154;
        Instruction[1] = 32'd4849665;
        Instruction[2] = 32'd12648457;
        Instruction[3] = 32'd8454155;
        Instruction[4] = 32'd21561344;
        Instruction[5] = 32'd5308419;
        Instruction[6] = 32'd17694715;
        Instruction[7] = 32'd8847371;
        Instruction[8] = 32'd29360128;
        Instruction[9] = 32'd25165824;
    end

    assign instr = Instruction[pcCurrent];

endmodule