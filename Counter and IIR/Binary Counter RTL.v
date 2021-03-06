//______Binary Counter Top Level Module_____________________________\\
module bin_counter_rtl #(parameter size=4)(
output[size-1:0] count_21, input enb_21,clk_21,rst_21);	//Port Declarations
wire enb_21_DP;
//Instantiating Controller Unit
//Control_unit_3 M0_Controller(enb_21_DP_21, enb_21, clk_21, rst_21); //3 cycles
Control_unit M0_Controller(enb_21_DP_21, enb_21,clk_21,rst_21);     //1 cycle
//Instantiating Datapath Unit
Datapath_unit M1_Datapath(count_21, enb_21_DP_21, clk_21, rst_21);
endmodule

//Controller Unit for Datapath for one clock cycle
module Control_unit(output enb_21_DP_21, input enb_21,clk_21,rst_21);
assign enb_21_DP_21 = enb_21;	//Enabling the datapath module
endmodule

//Datapath Module for the funationality of top level module
module Datapath_unit #(parameter size=4)(
output reg [size-1:0] count_21, input enb_21, clk_21, rst_21);  //Port Declarations
always @(posedge clk_21)		//Behavioral Logic Synchronous Block
if(rst_21==1) count_21 <=0; else
if (enb_21==1) count_21 <=next_count(count_21);	//Function called for counter
function [size-1:0] next_count;	//Creating function for coutner
input [size-1:0] count_21;		//Port Declarations
begin next_count = count_21 + 1;	//Counter formed 
end endfunction endmodule 

//Controller Unit for Datapath for 3 clock cycles
module Control_unit_3 (output reg enb_21_DP_21, input enb_21, clk_21, rst_21);
always begin: Cycle_by_3	//Name Given
@(posedge clk_21) enb_21_DP_21 <=0;
if ((rst_21==1)||(enb_21 !=1)) disable Cycle_by_3; else
@(posedge clk_21) if ((rst_21==1)||(enb_21!=1)) disable Cycle_by_3; else
@(posedge clk_21) if ((rst_21==1)||(enb_21!=1)) disable Cycle_by_3;
else enb_21_DP_21 <=1; end	//Enabled after 3 clock cycles have passed
endmodule 