task rd_data_fifo;
integer j, rd_ptr1;
begin
rd_ptr1 = $fopen ("output_files/data_rd.txt");
for (j=0; j<=(2**5)-1; j=j+1) begin
@(posedge clk) begin
rd_ptr=j;
rd_sig=1;
#1 $fdisplay (rd_ptr1, "%b", dout);
end
end
$fclose (rd_ptr1);
rd_sig=0;
end
endtask