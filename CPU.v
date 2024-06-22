module CPU();

    wire clk, pcInput, pcCurrent, pcPlusOne, offsetExtended;
    wire write_reg, write_value, aluValA, regBvalue, aluValB, aluResult;
    wire memResult;

    wire [31 : 0] instruction;

    wire CONTROL_WRITE_REG, CONTROL_WRITE_DATA;
    wire CONTROL_ENABLE_REG_WRITE, CONTROL_ALUvalB, CONTROL_OPERATION;
    wire CONTROL_MEM_ACCESS, CONTROL_ENABLE_MEM_WRITE;
    wire CONTROL_BEQ, CONTROL_JALR;



// think how to initialize pc