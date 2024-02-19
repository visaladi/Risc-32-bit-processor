`timescale 1ns / 1ps

module shift_unit(input[31:0]tbsh,s,output[31:0]sh);
assign sh=tbsh<<s;
endmodule

