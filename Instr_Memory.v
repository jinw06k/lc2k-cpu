module Instr_Memory(
    input pcCurrent,
    
    output reg instr
);

    reg [31:0] Instruction[1:0];

    initial begin
        Instruction[0] = 32'b0000_0000_0000_1010_0000_0000_0000_0011;
        Instruction[0] = 32'b0000_0000_0000_1010_0000_0000_0000_0011;
    end

    always @(pcNext) begin
        instr <= Data[pcNext];
    end

endmodule