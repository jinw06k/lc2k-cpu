module Write_Data_Mux(
    input clk,
    input memResult,                // writeData = 0 
    input aluResult,                // writeData = 1
    input pcPlusOne,                // writeData = 2
    input CONTROL_WRITE_DATA,

    output reg write_value
);

always @(posedge clk) begin
    if (CONTROL_WRITE_DATA == 1) begin   // use aluResult
        write_value <= aluResult;
    end
    else if (CONTROL_WRITE_DATA == 0) begin
        write_value <= memResult;
    end
    else begin                      // jalr (save pc+1 to reg)
        write_value <= pcPlusOne;
    end
end

endmodule
