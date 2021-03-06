//__________________________________________________________________
//__________________NRZ to Manchester Testbench_____________________
//__________________________________________________________________
module manchestertest();
reg clk, clk2, rst, inp;		//Port definition
wire outp;
reg [6:0] sequence;			//For the internal 7-bits
integer i;
manchester dut(inp,outp, clk, rst);		//Calling the instance
initial begin
clk = 1; clk2=0; rst = 1; #2 clk = 0; 
 end
initial begin
#5 rst = 0;
sequence = 7'b0110010;		//For Manchestor transition of seven times
for (i=0; i<=7; i=i+1) begin
inp = sequence[i];			//All the input bits
#2 clk = 1; clk2 =1; #2 clk = 0;
#2 clk = 1; clk2= 0; #2 clk = 0;
end end endmodule 