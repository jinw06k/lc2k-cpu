module Data_Memory(
    input [31:0] aluResult,
    input [31:0] regBvalue,
    input CONTROL_MEM_ACCESS,               // 1 = accessed
    input CONTROL_ENABLE_MEM_WRITE,         // 1 = write, 0 = read
    input clk,
    
    output [31:0] memResult
);

    reg [63:0] Data[63:0];

    integer ii;

    initial begin
        for (ii = 0; ii < 64; ii = ii + 1) begin
            Data[ii] = 0;
        end

        // subone
        Data[12] = 1;
        Data[13] = 5;
        Data[14] = 2;
        Data[15] = 7;

        // jalrTest
        // Data[7] = 5;

    end

    always @(aluResult, regBvalue, CONTROL_MEM_ACCESS, CONTROL_ENABLE_MEM_WRITE) begin
            if (CONTROL_ENABLE_MEM_WRITE == 1) begin // write
                Data[aluResult] <= regBvalue;
            end
    end

    assign memResult = Data[aluResult];

endmodule
