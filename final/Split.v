`timescale 1ns / 1ps

module split(input [31:0] inst, output[4:0]rs,rt,output[5:0]opc,func,output[25:0]jba);
assign rs=inst[25:21];
assign rt=inst[20:16];
assign opc=inst[31:26];
assign func=inst[5:0];
assign jba=inst[25:0];
//se={{16{instruction[15]}},instruction[15:0]};
endmodule

