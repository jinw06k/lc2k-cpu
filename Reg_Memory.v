module Reg_Memory(
    input [2:0] read_regA,
    input [2:0] read_regB,
    input [2:0] write_reg,
    input write_value,
    input CONTROL_ENABLE_REG_WRITE,

    output reg aluValA,
    output reg regBvalue
);

  reg [7:0] Register [31:0];

  integer ii;

  initial begin
      for (ii = 0; ii < 8; ii = ii + 1) begin
        Register[ii] = ii;
      end
  end

  always @(read_regA, read_regB, write_reg, write_value, CONTROL_ENABLE_REG_WRITE) begin
      if (CONTROL_ENABLE_REG_WRITE == 1) begin
        Register[write_reg] = write_value;
      end
      
      aluValA = Register[read_regA];
      regBvalue = Register[read_regB];   
  end

endmodule
