module ALU(
  input [31:0] operand1,
  input [31:0] operand2,
  input [2:0] opcode,
  output reg [31:0] result,
  output reg zero,
  output reg overflow,
  output reg carry
);

  always @(*)
    case (opcode)
      3'b000: result = operand1 + operand2; // ADD
      3'b001: result = operand1 - operand2; // SUB
      3'b010: result = operand1 & operand2; // AND
      3'b011: result = operand1 | operand2; // OR
      3'b100: result = operand1 ^ operand2; // XOR
      3'b101: result = ~operand1; // NOT
      3'b110: result = operand1 << operand2[4:0]; // Shift left
      3'b111: result = operand1 >> operand2[4:0]; // Shift right
      default: result = 32'b0; // Default case
    endcase

  assign zero = (result == 32'b0);
  assign overflow = (operand1[31] & operand2[31] & ~result[31]) | (~operand1[31] & ~operand2[31] & result[31]);
  assign carry = (result < operand1) | (result < operand2);

endmodule

