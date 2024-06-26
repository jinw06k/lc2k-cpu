module Reg_Memory(
    input [2:0] read_regA,
    input [2:0] read_regB,
    input [2:0] write_reg,
    input [31:0] write_value,
    input CONTROL_ENABLE_REG_WRITE,

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

  always @(read_regA, read_regB, write_reg, write_value, CONTROL_ENABLE_REG_WRITE) begin
      if (CONTROL_ENABLE_REG_WRITE == 1) begin
        Register[write_reg] = write_value;
      end
      
      aluValA = Register[read_regA];
      regBvalue = Register[read_regB]; 
      reg1val = Register[1];
  end

endmodule
