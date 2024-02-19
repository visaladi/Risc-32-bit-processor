`timescale 1ns / 1ps
module test;
reg[31:0]a,b;
reg[3:0]funct;
wire [31:0]s;
wire zero;
alu uut(a,b,funct,s,zero);
initial begin
a=32'h000A4321;
b=32'h000A4322;
funct=4'b0000;
end
always begin
#5 funct=funct+1;
#5 a=a+1;
end
endmodule
