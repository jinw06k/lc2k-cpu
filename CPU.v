module CPU();

    wire clk, pcInput, pcCurrent, pcPlusOne, offsetExtended;
    wire write_reg, write_value, aluValA, regBvalue, aluValB, aluResult;
    wire memResult;

    wire [31 : 0] instruction;

    wire CONTROL_WRITE_REG, CONTROL_WRITE_DATA;
    wire CONTROL_ENABLE_REG_WRITE, CONTROL_ALUvalB, CONTROL_OPERATION;
    wire CONTROL_MEM_ACCESS, CONTROL_ENABLE_MEM_WRITE;
    wire CONTROL_BEQ, CONTROL_JALR, CONTROL_HALT;

    Clock clock(
        .CONTROL_HALT(CONTROL_HALT),
        .clk(clk)
    );

    Program_Counter PC(
        .clk(clk),
        .pcInput(pcInput),
        .pcCurrent(pcCurrent),
        .pcPlusOne(pcPlusOne)
    );

    Program_Mux pMux(
        .clk(clk),
        .pcPlusOne(pcPlusOne),
        .CONTROL_BEQ(CONTROL_BEQ),
        .offsetExtended(offsetExtended),
        .CONTROL_JALR(CONTROL_JALR),
        .aluValA(aluValA),
        .pcOutput(pcOutput)
    );

    Instr_Memory instrM(
        .pcCurrent(pcCurrent),
        .instr(instruction)
    );

    Write_Data_Mux wdMux(
        .clk(clk),
        .memResult(memResult),
        .aluResult(aluResult),
        .pcPlusOne(pcPlusOne),
        .CONTROL_WRITE_DATA(CONTROL_WRITE_DATA),
        .write_value(write_value)
    );

    Write_Reg_Mux wrMux(
        .clk(clk),
        .regB(instruction[18:16]),
        .destReg(instruction[2:0]),
        .CONTROL_WRITE_REG(CONTROL_WRITE_REG),
        .write_reg(write_reg)
    );

    Sign_Extend sExtend(
        .offset(instruction[15:0]),
        .offsetExtended(offsetExtended)
    );

    Reg_Memory regM(
        .read_regA(instruction[21:19]),
        .read_regB(instruction[18:16]),
        .write_reg(write_reg),
        .write_value(write_value),
        .CONTROL_ENABLE_REG_WRITE(CONTROL_ENABLE_REG_WRITE),
        .aluValA(aluValA),
        .regBvalue(regBvalue)
    );

    ALU_ValB_Mux vbMux(
        .clk(clk),
        .offsetExtended(offsetExtended),
        .regBvalue(regBvalue),
        .CONTROL_ALUvalB(CONTROL_ALUvalB),
        .aluValB(aluValB)
    );

    ALU alu(
        .aluValA(aluValA),
        .aluValB(aluValB),
        .CONTROL_OPERATION(CONTROL_OPERATION),
        .aluResult(aluResult),
        .CONTROL_BEQ(CONTROL_BEQ)
    );

    Data_Memory dataM(
        .aluResult(aluResult),
        .regBvalue(regBvalue),
        .CONTROL_MEM_ACCESS(CONTROL_MEM_ACCESS),
        .CONTROL_ENABLE_MEM_WRITE(CONTROL_ENABLE_MEM_WRITE),
        .memResult(memResult)
    );

    Control_ROM cRom(
        .clk(clk),
        .opcode(instruction[24:22]),
        .CONTROL_WRITE_REG(CONTROL_WRITE_REG),
        .CONTROL_WRITE_DATA(CONTROL_WRITE_DATA),
        .CONTROL_ENABLE_REG_WRITE(CONTROL_ENABLE_REG_WRITE),
        .CONTROL_ALUvalB(CONTROL_ALUvalB),
        .CONTROL_OPERATION(CONTROL_OPERATION),
        .CONTROL_MEM_ACCESS(CONTROL_MEM_ACCESS),
        .CONTROL_ENABLE_MEM_WRITE(CONTROL_ENABLE_MEM_WRITE),
        .CONTROL_HALT(CONTROL_HALT),
        .CONTROL_JALR(CONTROL_JALR)
    );

    // initial value for PCinput

endmodule