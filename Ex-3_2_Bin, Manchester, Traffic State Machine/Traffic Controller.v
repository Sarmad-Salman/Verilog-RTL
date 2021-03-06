//_____________________________________________________________________
// _________________Traffic Controller Top_____________________________
//_____________________________________________________________________
module traffic_controller (clk,rst_n,enable,road1_out,road2_out, ped1, ped2);
input clk,rst_n, enable ;		//---- Port Declarations ----
output [2:0] road1_out, road2_out, ped1, ped2;
wire ovflw_1sec, enable_sig ; wire [5:0] counter_24 ;
// Counter having 1sec Overflow signal Instantiation
cnter_enb_ovf #(5,4) cnter_enb_ovf_i1(.clk(clk),.rst_n(rst_n),.enable(enable_sig),
					.overflow(ovflw_1sec),.cnt_val());
//  Counter 2 Instantiation
cnter_enb_ovf #(6,64) cnter_enb_ovf_i2(.clk(clk),.rst_n(rst_n),.enable(ovflw_1sec),
					.overflow(),.cnt_val(counter_24));
// State Machine for Traffic Controller
traffic_sm2 traffic_sm_inst(.clk(clk),.rst_n(rst_n),.enable(enable),
		.counter_24(counter_24),.enable_sig(enable_sig),.road1_out(road1_out),
		.road2_out(road2_out),.ped1(ped1),.ped2(ped2));
endmodule 