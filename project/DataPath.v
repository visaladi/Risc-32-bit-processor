module DataPath(
  input wire clk,
  input wire rst,
  input [31:0] pc,
  input [31:0] instruction_memory [0:2^16-1],
  output reg [31:0] result,
  output reg zero,
  output reg overflow,
  output reg carry,
  output reg [31:0] read_data1,
  output reg [31:0] read_data2
);

  wire [5:0] opcode;
  wire [4:0] read_reg1, read_reg2, write_reg;
  wire [31:0] write_data;
  wire [31:0] alu_result;
  wire alu_zero, alu_overflow, alu_carry;

  // Extract opcode and operands from the instruction
  assign opcode = instruction_memory[pc][31:26];
  assign read_reg1 = instruction_memory[pc][25:21];
  assign read_reg2 = instruction_memory[pc][20:16];
  assign write_reg = instruction_memory[pc][15:11];
  assign write_data = instruction_memory[pc][15:0];

  // Instantiate components
  RegisterFile regFile (
    .clk(clk),
    .rst(rst),
    .read_reg1(read_reg1),
    .read_reg2(read_reg2),
    .write_reg(write_reg),
    .write_data(write_data),
    .write_enable(1),
    .read_data1(read_data1),
    .read_data2(read_data2)
  );

  ControlUnit ctrlUnit (
    .opcode(opcode),
    .alu_opcode(alu_opcode),
    .reg_write_enable(reg_write_enable)
  );

  ALU alu (
    .operand1(read_data1),
    .operand2(read_data2),
    .opcode(alu_opcode),
    .result(alu_result),
    .zero(alu_zero),
    .overflow(alu_overflow),
    .carry(alu_carry)
  );

  MemoryInterface memInterface (
    .clk(clk),
    .rst(rst),
    .address(mem_address),
    .write_data(mem_write_data),
    .write_enable(mem_write_enable),
    .read_data(mem_read_data)
  );

  InstructionFetchUnit instFetchUnit (
    .clk(clk),
    .rst(rst),
    .pc(pc),
    .instruction_memory(instruction_memory),
    .instruction(instruction)
  );

  // Data path connections
  always @(*)
    if (ctrlUnit.reg_write_enable)
      regFile.write_reg <= write_reg;

  always @(*)
    if (ctrlUnit.alu_opcode == 3'b110 || ctrlUnit.alu_opcode == 3'b111)
      // For shift operations, set write_data to shift amount
      regFile.write_data <= write_data;

  always @(*)
    if (ctrlUnit.alu_opcode == 3'b110 || ctrlUnit.alu_opcode == 3'b111)
      // For shift operations, set ALU operand2 to shift amount
      alu.operand2 <= write_data;

  always @(*)
    if (ctrlUnit.reg_write_enable)
      regFile.write_data <= alu.result;

endmodule

