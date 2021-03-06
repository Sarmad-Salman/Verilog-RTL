//________________________________________________________\\
//___Testbench for IIR with output not exceedin_21g 20 bits___\\
//__________________________________________________________\\
module iir_tb();
reg clk_21, rst_21, data_valid_21; reg  [7:0] din_21; 
wire [19:0] dout_21;	//Port Declarations
    // Instantiate the Unit Under Test
discrete_sys_core inst1(clk_21,rst_21,data_valid_21,din_21,dout_21);
always #50 clk_21=~clk_21;	//Initializing Clock
initial begin
rst_21=1; clk_21=0; data_valid_21=0;	//Initializing Inputs
#20 rst_21=0; data_valid_21=1; 
//Checking for different inputs
din_21=8'd255; #500 din_21=8'd150; #750 din_21=8'd68; end
initial begin
#2000 $stop;end		//Stop simulation 
endmodule 