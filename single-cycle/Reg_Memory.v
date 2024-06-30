module Reg_Memory(
    input [2:0] read_regA,
    input [2:0] read_regB,
    input [2:0] write_reg,
    input [31:0] write_value,
    input CONTROL_ENABLE_REG_WRITE,
    input CONTROL_ALU_DONE,

    output reg [31:0] aluValA,
    output reg [31:0] regBvalue,
    output reg [31:0] reg1val
);

  reg [7:0] Register [31:0];

  integer ii;

  initial begin
      for (ii = 0; ii < 8; ii = ii + 1) begin
        Register[ii] = 0;
      end
  end

  always @(read_regA, read_regB, write_reg, write_value, CONTROL_ENABLE_REG_WRITE, CONTROL_ALU_DONE) begin
      if (CONTROL_ALU_DONE == 1) begin
        Register[write_reg] = write_value;
      end
      else begin
      aluValA <= Register[read_regA];
      regBvalue <= Register[read_regB]; 
        if (CONTROL_ENABLE_REG_WRITE == 1) begin
          Register[write_reg] = write_value;
        end
      end
      reg1val <= Register[1];
  end

endmodule


// add, nor 일때 reg A or B 가 destReg랑 같으면 오류.
// write value 계산이 아직 안되어서.. ALU쪽에서 CONTROL 하나 더 보내줘야할듯
