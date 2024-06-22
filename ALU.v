module ALU(
    input [31:0] aluValA,
    input [31:0] aluValB,
    input CONTROL_OPERATION,            // 0 = ADD, 1 = NOR, 2 = EQUAL?

    output reg [31:0] aluResult,
    output reg CONTROL_BEQ
);

    always @ (aluValA, aluValB, CONTROL_OPERATION) begin
        case(CONTROL_OPERATION)
            2'b00: aluResult <= aluValA + aluValB;
            2'b01: aluResult <= ~(aluValA | aluValA); 
        endcase

        if (CONTROL_OPERATION == 2'b10) begin
            if (aluValA == aluValB) begin   // if equal, jump
                CONTROL_BEQ <= 1;
            end
        end
        else begin
            CONTROL_BEQ <= 0;
        end
    end

endmodule