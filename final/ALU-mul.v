`timescale 1ns / 1ps

module calc(input[31:0]a,b,input funct,output reg[31:0]calres,output reg ovf);
reg [31:0]cal;
always@(*)
    begin
    case(funct)
    1'b0:
        begin
        {cal,calres}=a*b;
        if(cal==32'd0) ovf=0;
        else ovf=1;
        end
    1'b1:
       begin
       calres=a/b;
       ovf=0;
       end
    endcase
    end
endmodule

