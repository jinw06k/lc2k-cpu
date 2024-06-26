module Program_Counter(
  input clk,
  input [31:0] pcInput,
  input reset,
  input CONTROL_HALT,

  output reg [31:0] pcCurrent,
  output reg [31:0] pcPlusOne
);

  always @(posedge clk) begin
    if (CONTROL_HALT == 1) begin
      $finish;
    end
    else if(reset == 1) begin
      pcCurrent <= 0;
      pcPlusOne <= 1;
    end 
    else begin
      pcCurrent <= pcInput;
      pcPlusOne <= pcInput + 1;
    end
  end
  
endmodule