`timescale 1ns / 1ps

module testpc;
reg[31:0]pcin,pc0;
reg[25:0]inst;
reg clk,rst,wen;
reg[1:0]cnt;
wire[31:0]pcout;
prog_cnt uut(pcin,pc0,inst,clk,rst,wen,cnt,pcout);
initial begin
pcin=32'h00011223;
pc0=32'h00000000;
inst=26'b00110011001100110010000111;
cnt=2'b00;
clk=0;
rst=1;
wen=0;
#1 clk=1;
#1 rst=0;
end
always begin
#10 clk=0;
cnt=cnt+1;
#10 clk=1;#10 clk=0;
wen=~wen;
#10 clk=1;#10 clk=0;
inst=inst+1;
#10 clk=1;
end
endmodule
