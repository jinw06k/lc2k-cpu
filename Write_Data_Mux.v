module Write_Data_Mux(
    input [31:0] memResult,                // writeData = 0 
    input [31:0] aluResult,                // writeData = 1
    input [31:0] pcPlusOne,                // writeData = 2
    input CONTROL_WRITE_DATA,

    output reg [31:0] write_value,
    output reg CONTROL_ALU_DONE

);

    always @(CONTROL_WRITE_DATA, memResult, aluResult, pcPlusOne) begin
        if (CONTROL_WRITE_DATA == 1) begin   // use aluResult
            write_value <= aluResult;
            CONTROL_ALU_DONE <= 1;
        end
        else if (CONTROL_WRITE_DATA == 0) begin
            write_value <= memResult;
            CONTROL_ALU_DONE <= 0;
        end
        else begin                      // jalr (save pc+1 to reg)
            write_value <= pcPlusOne;
            CONTROL_ALU_DONE <= 0;
        end
    end

endmodule
