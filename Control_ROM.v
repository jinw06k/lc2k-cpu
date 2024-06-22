module Control_ROM(
    input clk,
    input [2:0] opcode,

    output reg CONTROL_WRITE_REG,               // 1 = dest reg     0 = regB
    output reg CONTROL_WRITE_DATA,              // 1 = aluResult    0 = memResult
    output reg CONTROL_ENABLE_REG_WRITE,        // 1 = write register
    output reg CONTROL_ALUvalB,                 // 1 = regBvalue    0 = offsetExtended
    output reg CONTROL_OPERATION,               // 1 = nor          0 = add
    output reg CONTROL_MEM_ACCESS,              // 1 = memory accessed
    output reg CONTROL_ENABLE_MEM_WRITE,        // 1 = write mem    0 = read mem
    output reg CONTROL_HALT,
    output reg CONTROL_JALR
);

    parameter OP_ADD = 3'b000;
    parameter OP_NOR = 3'b001;
    parameter OP_LW = 3'b010;
    parameter OP_SW = 3'b011;
    parameter OP_BEQ = 3'b100;
    parameter OP_JALR = 3'b101;
    parameter OP_HALT = 3'b110;
    parameter OP_NOOP = 3'b111;

    initial begin
        CONTROL_HALT = 0;
        CONTROL_JALR = 0;
        CONTROL_ALUvalB = 0;
    end

    always @(posedge clk) begin
        case(opcode)
            OP_ADD: begin
                CONTROL_ALUvalB <= 1;            // 1 = regBvalue
                CONTROL_HALT <= 0;
                CONTROL_JALR <= 0;
                CONTROL_WRITE_REG <= 1;          // 1 = dest reg
                CONTROL_WRITE_DATA <= 1;         // 1 = aluResult
                CONTROL_ENABLE_REG_WRITE <= 1;   // 1 = write register
                CONTROL_OPERATION <= 0;          // 0 = add
                CONTROL_MEM_ACCESS <= 0;         // 0 = memory not accessed
                CONTROL_ENABLE_MEM_WRITE <= 0;   // 0 = read mem
            end
            OP_NOR: begin
                CONTROL_HALT = 0;
                CONTROL_JALR = 0;
                CONTROL_WRITE_REG = 1;          // 1 = dest reg
                CONTROL_WRITE_DATA = 1;         // 1 = aluResult 
                CONTROL_ENABLE_REG_WRITE = 1;   // 1 = write register
                CONTROL_ALUvalB = 1;            // 1 = regBvalue
                CONTROL_OPERATION = 1;          // 1 = nor
                CONTROL_MEM_ACCESS = 0;         // 0 = memory not accessed
                CONTROL_ENABLE_MEM_WRITE = 0;   // 0 = read mem
            end
            OP_LW: begin
                CONTROL_HALT = 0;
                CONTROL_JALR = 0;
                CONTROL_WRITE_REG = 0;          // 0 = regB
                CONTROL_WRITE_DATA = 0;         // 0 = memResult
                CONTROL_ALUvalB = 0;            // 0 = offsetExtended
                CONTROL_ENABLE_REG_WRITE = 1;   // 1 = write register
                CONTROL_OPERATION = 0;          // 0 = add
                CONTROL_MEM_ACCESS = 1;         // 1 = memory accessed
                CONTROL_ENABLE_MEM_WRITE = 0;   // 0 = read mem
            end
            OP_SW: begin
                CONTROL_HALT = 0;
                CONTROL_JALR = 0;
                CONTROL_WRITE_REG = 0;          // 0 = regB
                CONTROL_WRITE_DATA = 0;         // 0 = memResult
                CONTROL_ENABLE_REG_WRITE = 0;   // 0 = don't write reg
                CONTROL_ALUvalB = 0;            // 0 = offsetExtended
                CONTROL_OPERATION = 0;          // 0 = add
                CONTROL_MEM_ACCESS = 1;         // 1 = memory accessed
                CONTROL_ENABLE_MEM_WRITE = 1;   // 1 = write mem
            end
            OP_BEQ: begin
                CONTROL_HALT = 0;
                CONTROL_JALR = 0;
                CONTROL_WRITE_REG = 0;          // 0 = regB
                CONTROL_WRITE_DATA = 0;         // 0 = memResult
                CONTROL_ENABLE_REG_WRITE = 0;   // 0 = don't write reg
                CONTROL_ALUvalB = 0;            // 1 = regBvalue
                CONTROL_OPERATION = 2;          // 2 = equal?
                CONTROL_MEM_ACCESS = 0;         // 0 = memory not accessed
                CONTROL_ENABLE_MEM_WRITE = 0;   // 0 = read mem
            end
            OP_JALR: begin
                CONTROL_HALT = 0;
                CONTROL_WRITE_REG = 0;          // 0 = regB
                CONTROL_WRITE_DATA = 2;         // 1 = pc+1
                CONTROL_ENABLE_REG_WRITE = 1;   // 1 = write register
                CONTROL_JALR = 1;               // 1 = jalr jump
                CONTROL_ALUvalB = 0;            // 0 = offsetExtended
                CONTROL_OPERATION = 0;          // 0 = add
                CONTROL_MEM_ACCESS = 0;         // 0 = memory not accessed
                CONTROL_ENABLE_MEM_WRITE = 0;   // 0 = read mem
            end
            OP_HALT: begin
                CONTROL_HALT = 1;
                CONTROL_JALR = 0;
                CONTROL_WRITE_REG = 0;          // 1 = dest reg     0 = regB
                CONTROL_WRITE_DATA = 0;         // 1 = aluResult    0 = memResult
                CONTROL_ENABLE_REG_WRITE = 0;   // 1 = write register
                CONTROL_ALUvalB = 0;            // 1 = regBvalue    0 = offsetExtended
                CONTROL_OPERATION = 0;          // 1 = nor          0 = add
                CONTROL_MEM_ACCESS = 0;         // 1 = memory accessed
                CONTROL_ENABLE_MEM_WRITE = 0;   // 1 = write mem    0 = read mem
            end
            OP_NOOP: begin
                CONTROL_HALT = 0;
                CONTROL_JALR = 0;
                CONTROL_WRITE_REG = 0;          // 1 = dest reg     0 = regB
                CONTROL_WRITE_DATA = 0;         // 1 = aluResult    0 = memResult
                CONTROL_ENABLE_REG_WRITE = 0;   // 1 = write register
                CONTROL_ALUvalB = 0;            // 1 = regBvalue    0 = offsetExtended
                CONTROL_OPERATION = 0;          // 1 = nor          0 = add
                CONTROL_MEM_ACCESS = 0;         // 1 = memory accessed
                CONTROL_ENABLE_MEM_WRITE = 0;   // 1 = write mem    0 = read mem
            end
        endcase
    end
endmodule