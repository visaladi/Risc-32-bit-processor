`timescale 1ns / 1ps

module test_mip;
reg clk, rst;
wire [31:0] alures, npc, in, da, md;
processor uut(clk,rst,alures,npc,in,da,md);
initial
    begin
    clk=0;
    rst=1;
    #5 clk=1;
    #5 rst=0;
    end
always
    begin
    #10 clk=~clk;
    end
endmodule
