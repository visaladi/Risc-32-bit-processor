`timescale 1ns / 1ps

module logical(input[31:0]a,b,input[1:0]funct,output reg[31:0]logres);
always@(*)
begin
case(funct[1:0])
2'b00:logres=(a|b);
2'b01:logres=(a&b);
2'b10:logres=(a^b);
2'b11:logres=(~a);
endcase
end
endmodule

