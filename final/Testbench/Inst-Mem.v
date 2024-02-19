`timescale 1ns / 1ps

module testIM;
reg [31:0]pc;
reg clk;
wire [31:0]inst;
im uut(pc,clk,inst);
initial begin
clk=0;
pc=32'd0;
end
always begin
#5 clk=~clk;
#5 pc=pc+1;
end
endmodule
