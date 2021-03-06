module update_fifo_top(clk, rst_n, wrt_sig, rd_sig, din, dout, full_sig, empty_sig, over_flow, under_flow);
input clk, rst_n, wrt_sig, rd_sig;
input [7:0] din;
output [7:0] dout;
wire [25:0] rd_ptr, wrt_ptr;
output full_sig, empty_sig, over_flow, under_flow;
ram_ctrl inst2(clk, rst_n, wrt_sig, rd_sig, din, full_sig, empty_sig, over_flow, under_flow, dout, rd_ptr, wrt_ptr);
ram_general inst1 (clk, wrt_sig, wrt_ptr, rd_ptr, din, dout);
endmodule 