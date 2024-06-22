module Program_Counter(
  input clk,
  input [31:0] pcInput,
  input reset,

  output reg [31:0] pcCurrent,
  output reg [31:0] pcPlusOne
);

  always @(posedge clk) begin
    if(reset == 1) begin
      pcCurrent = 0;
      pcPlusOne = 1;
    end 
    else begin
      pcCurrent = pcInput;
      pcPlusOne = pcInput + 1;
    end
  end
  
endmodule