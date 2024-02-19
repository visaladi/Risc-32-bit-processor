module InstructionFetchUnit(
  input wire clk,
  input wire rst,
  input [31:0] pc,
  input [31:0] instruction_memory [0:2^16-1],
  output reg [31:0] instruction
);

  always @(posedge clk or posedge rst)
    if (rst)
      instruction <= 32'b0;
    else
      instruction = instruction_memory[pc];

endmodule

