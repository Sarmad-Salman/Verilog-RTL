module slowClock(clk, reset, en, clk_1Hz);
input clk, reset, en;
output clk_1Hz;
reg clk_1Hz = 1'b0;
reg [27:0] counter;
always@(posedge clk)
begin
 if (reset == 1 || en==0)
 begin
 clk_1Hz <= 1;
 counter <= 0;
 end
 else
 begin
 counter <= counter + 1;
 if ( counter == 25000000)
 begin
 counter <= 0;
 clk_1Hz <= ~clk_1Hz;
 end
 end
end
endmodule