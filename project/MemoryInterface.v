module MemoryInterface(
  input wire clk,
  input wire rst,
  input [31:0] address,
  input [31:0] write_data,
  input write_enable,
  output reg [31:0] read_data
);

  reg [31:0] memory [0:1023];

  always @(posedge clk or posedge rst)
    if (rst)
      memory <= {1024{32'b0}};
    else if (write_enable)
      memory[address] <= write_data;

  always @(*)
    read_data = memory[address];

endmodule

