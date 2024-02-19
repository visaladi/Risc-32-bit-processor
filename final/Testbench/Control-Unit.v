`timescale 1ns / 1ps

module testcu;
reg[5:0]opcode;
wire reg_src,reg_wen,alu_src,w_src,mem_wen,check_immed;
wire [1:0]alu_cnt,pc_cnt;
control uut(opcode,reg_src,reg_wen,alu_src,w_src,mem_wen,check_immed,alu_cnt,pc_cnt);
initial begin
opcode=6'b000000;
end
always begin
#10 opcode=opcode+1;
end
endmodule
