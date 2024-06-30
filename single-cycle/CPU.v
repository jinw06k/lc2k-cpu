/*

iverilog -o dsn ALU_ValB_Mux.v ALU.v Clock.V Control_ROM.v CPU.v Data_Memory.v Instr_Memory.v Program_Counter.v Program_Mux.v Reg_Memory.v Sign_Extend.v Write_Data_Mux.v Write_Reg_Mux.v

iverilog -o dsn top.v ALU_ValB_Mux.v ALU.v Clock.V Control_ROM.v CPU.v Data_Memory.v Instr_Memory.v Program_Counter.v Program_Mux.v Reg_Memory.v Sign_Extend.v Write_Data_Mux.v Write_Reg_Mux.v

vvp dsn

*/

module CPU(
    // input clk,
    // output [31:0] reg1out
);

    wire clk;
    wire [31:0] pcInput, pcCurrent, pcPlusOne;
    wire [31:0] offsetExtended;
    wire [31:0] write_value, aluValA, regBvalue, aluValB, aluResult;
    wire [2:0] write_reg;
    wire [31:0] memResult;

    wire [31 : 0] instruction;

    wire CONTROL_WRITE_REG, CONTROL_WRITE_DATA;
    wire CONTROL_ENABLE_REG_WRITE, CONTROL_ALUvalB, CONTROL_ALU_DONE;
    wire [1:0] CONTROL_OPERATION;
    wire CONTROL_MEM_ACCESS, CONTROL_ENABLE_MEM_WRITE;
    wire CONTROL_BEQ, CONTROL_JALR, CONTROL_HALT;

    Clock clock(
        .clk(clk)
    );

    Program_Counter PC(
        .clk(clk),
        .CONTROL_HALT(CONTROL_HALT),
        .pcInput(pcInput),
        .pcCurrent(pcCurrent),
        .pcPlusOne(pcPlusOne)
    );

    Program_Mux pM(
        .pcCurrent(pcCurrent),
        .pcPlusOne(pcPlusOne),
        .CONTROL_BEQ(CONTROL_BEQ),
        .offsetExtended(offsetExtended),
        .CONTROL_JALR(CONTROL_JALR),
        .aluValA(aluValA),
        .pcOutput(pcInput)
    );

    Instr_Memory instrM(
        .pcCurrent(pcCurrent),
        .instr(instruction)
    );

    Write_Data_Mux wdMux(
        .memResult(memResult),
        .aluResult(aluResult),
        .pcPlusOne(pcPlusOne),
        .CONTROL_ALU_DONE(CONTROL_ALU_DONE),
        .CONTROL_WRITE_DATA(CONTROL_WRITE_DATA),
        .write_value(write_value)
    );

    Write_Reg_Mux wrMux(
        .regB(instruction[18:16]),
        .destReg(instruction[2:0]),
        .CONTROL_WRITE_REG(CONTROL_WRITE_REG),
        .write_reg(write_reg)
    );

    // Sign_Extend sExtend(
    //     .offset(instruction[15:0]),
    //     .offsetExtended(offsetExtended)
    // );

    assign offsetExtended = { {16{instruction[15]}}, instruction[15:0] };

    wire [31:0] reg1val;
    Reg_Memory regM(
        .read_regA(instruction[21:19]),
        .read_regB(instruction[18:16]),
        .CONTROL_ALU_DONE(CONTROL_ALU_DONE),
        .write_reg(write_reg),
        .write_value(write_value),
        .CONTROL_ENABLE_REG_WRITE(CONTROL_ENABLE_REG_WRITE),
        .aluValA(aluValA),
        .regBvalue(regBvalue),
        .reg1val(reg1val)
    );

    ALU_ValB_Mux vbMux(
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
        .clk(clk),
        .memResult(memResult)
    );

    Control_ROM cRom(
        .pcCurrent(pcCurrent),
        .opcode(instruction[24:22]),
        .instruction(instruction),
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

    // assign reg1out = reg1val;


    // Running simulation via iverilog
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,CPU);
    end

    reg [32:0] curOpcode = "ADD";

    always @(instruction[24:22]) begin
        case(instruction[24:22]) 
            3'b000:
                curOpcode = "ADD";
            3'b001:
                curOpcode = "NOR";
            3'b010:
                curOpcode = "LW";
            3'b011:
                curOpcode = "SW";
            3'b100:
                curOpcode = "BEQ";
            3'b101:
                curOpcode = "JALR";
            3'b110:
                curOpcode = "HALT";
            3'b111:
                curOpcode = "NOOP";
        endcase
    end

    initial
        $monitor("At time %t, pcCurrent = %0d, instruction = %s, reg1 value = %0d",
            $time, pcCurrent, curOpcode, reg1val);

endmodule
