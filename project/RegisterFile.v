module RegisterFile(
  input wire clk,
  input wire rst,
  input [4:0] read_reg1,
  input [4:0] read_reg2,
  input [4:0] write_reg,
  input [31:0] write_data,
  input write_enable,
  output reg [31:0] read_data1,
  output reg [31:0] read_data2
);

  reg [31:0] registers [31:0];

  always @(posedge clk or posedge rst)
    if (rst)
      registers <= {32{32'b0}};
    else if (write_enable)
      registers[write_reg] <= write_data;

  assign read_data1 = registers[read_reg1];
  assign read_data2 = registers[read_reg2];

endmodule

