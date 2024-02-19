`timescale 1ns / 1ps

module sign_extend(input[25:0]in,output[31:0]out);
assign out={{6{in[25]}},in};
endmodule

