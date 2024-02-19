`timescale 1ns / 1ps

module add(input[31:0]a,b,input funct,output reg[31:0]addres,output reg cout);
reg x;
always@(*)
    begin
    case(funct)
    2'b0:
        begin
        {cout,addres}=a+b;
        end
    2'b1:
        begin
        {x,addres}=a-b;
        cout=0;
        end
    endcase
    end
endmodule

