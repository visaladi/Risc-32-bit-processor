module RegisterFile(
  input [4:0] read_reg1,
  input [4:0] read_reg2,
  input [4:0] write_reg,
  input [31:0] write_data,
  input write_enable,
  input clk,
  input rst,
  output reg [31:0] read_data1,
  output reg [31:0] read_data2
);

  reg [31:0] registers [31:0];

  assign read_data1 = registers[read_reg1];
  assign read_data2 = registers[read_reg2];

  always @(posedge clk or posedge rst)
    if (rst)
      for (int i = 0; i < 32; i++)
        registers[i] <= 32'b0;
    else if (write_enable)
      registers[write_reg] <= write_data;

endmodule

