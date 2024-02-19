`timescale 1ns / 1ps

module testALU_co;
reg[1:0]opcode;
reg[5:0]funct;
reg sel;
wire[3:0]alu_cnt;
alu_control uut(opcode,funct,sel,alu_cnt);
initial
    begin
    opcode=2'b00;
    funct=5'b00000;
    sel=1'b0;
    end
always
    begin
    #5 opcode=opcode+1;
    #5 funct=funct+1;
    #5 sel=~sel;
    end
endmodule
