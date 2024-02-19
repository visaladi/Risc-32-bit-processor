`timescale 1ns / 1ps

module sign_ext(input[15:0]in,output[31:0]out);
assign out={{16{in[15]}},in};
endmodule

