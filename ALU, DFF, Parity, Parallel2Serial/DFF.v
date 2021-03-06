//________________________________________________
//____DFF Module without parameters_______________
//________________________________________________
module dff_4(d, clk, q);
input [3:0] d; input clk;	//Port declaration
output reg [3:0] q;
always @(posedge clk)	//Synchronous Reset
q<=d;
endmodule 

module dff_2(d, clk, q);
input [1:0] d; input clk;	//Port declaration
output reg [1:0] q;
always @(posedge clk)	//Synchronous Reset
q<=d;
endmodule 