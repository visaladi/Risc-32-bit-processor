module ControlUnit(
  input [5:0] opcode,
  output reg [2:0] alu_opcode,
  output reg reg_write_enable
);

  always @(*)
    case (opcode)
      6'b000000: begin // ADD
        alu_opcode = 3'b000;
        reg_write_enable = 1;
      end
      6'b000001: begin // SUB
        alu_opcode = 3'b001;
        reg_write_enable = 1;
      end
      6'b000010: begin // AND
        alu_opcode = 3'b010;
        reg_write_enable = 1;
      end
      6'b000011: begin // OR
        alu_opcode = 3'b011;
        reg_write_enable = 1;
      end
      6'b000100: begin // XOR
        alu_opcode = 3'b100;
        reg_write_enable = 1;
      end
      6'b000101: begin // NOT
        alu_opcode = 3'b101;
        reg_write_enable = 1;
      end
      6'b000110: begin // Shift Left
        alu_opcode = 3'b110;
        reg_write_enable = 1;
      end
      6'b000111: begin // Shift Right
        alu_opcode = 3'b111;
        reg_write_enable = 1;
      end
      default: begin
        alu_opcode = 3'b000;
        reg_write_enable = 0;
      end
    endcase

endmodule

