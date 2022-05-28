module aa(a,b,c,o);
input [7:0] a,b,c; output [7:0] o;
assign o = a~&b;
endmodule 

module taa();
reg [7:0] a,b,c; wire [7:0] o;
aa as(a,b,c,o);
initial begin
a = 8'h55;
b= 8'hAA;
c=0;
end endmodule 