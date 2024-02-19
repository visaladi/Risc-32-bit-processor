`timescale 1ns / 1ps
module dm_test;
reg[31:0]data_in,add;
reg clk,wen;  
wire[31:0]data_out;   
dm uut(add,data_in,clk,wen,data_out);
initial begin
clk=0;
data_in=32'd12;
add=32'd2;
wen=1;
end
always begin
#5 clk=~clk;
wen=~wen;
data_in=data_in+1;
add=add+1;
end
endmodule
