`timescale 1ns / 1ps

module shift(input[31:0]a,input[4:0]b, input funct, output reg[31:0]shtres);
always@(*)
begin
case(funct)
2'b0:shtres=a>>b;
2'b1:shtres=a<<b;
endcase
end
endmodule

