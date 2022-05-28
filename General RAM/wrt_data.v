task wrt_data;
reg [7:0] data_temp;
integer i;
begin
$readmemb ("output_files/ch_data.txt", mem_ch);
for (i=0; i<=(2**26)-1; i=i+1) begin
data_temp = mem_ch [i];
@(posedge clk) begin
din_ram=data_temp;
addr_w=i;
wrt_sig=1;
end
end
@(posedge clk)
wrt_sig=0;
end
endtask 