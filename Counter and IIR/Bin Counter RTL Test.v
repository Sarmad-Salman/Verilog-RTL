//__________________________________________\\
//______Testbench for Binary Counter_________\\
//____________________________________________\\
module bin_count_t();
reg clk_21, enb_21, rst_21;	//Port Declarations
wire [3:0] count_21;
//Instantiating top level module
bin_counter_rtl inst1(count_21,enb_21,clk_21,rst_21);
initial begin
#5000 $stop; end    //Total Time of simulation
initial begin
rst_21 = 1; enb_21 =0; clk_21 =1;
#10 rst_21 = 0; enb_21 = 1;	//Initializing inputs
#1000 rst_21 = 1; #100 enb_21=0;
#200 rst_21 = 0; #50 enb_21 = 1; end
always #100 clk_21=~clk_21;	//Clock Generation
endmodule 