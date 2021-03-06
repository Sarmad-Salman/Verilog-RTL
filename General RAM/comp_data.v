task comp_data;
integer i, comp_ptr;
begin
comp_ptr = $fopen ("output_files/compare_data.txt");
$readmemb ("output_files/ch_data.txt", comp_mem1);
$readmemb ("output_files/data_rd.txt", comp_mem2);
$fwrite (comp_ptr, "________________________________\n");
$fwrite (comp_ptr, "Location WRITE DATA <--RAM --> READ DATA Status\n");
$fwrite (comp_ptr, "--------------------------------\n");
$display ("\n\tLocation WRITE DATA <----RAM ----> READ DATA Status\n");
for (i=0; i<=(2**26)-1; i=i+1) begin
if (comp_mem1 [i] !== comp_mem2 [i]) begin
$fwrite (comp_ptr, "%d <-------------> %b ERROR \n", i, comp_mem1 [i]);
$display ("<---------------> ERROR");
end
else begin
$fwrite (comp_ptr, "%d<--------------> %b OK\n", i,  comp_mem1 [i]);
$display (" <------------------->  OK");
end
end
$fclose (comp_ptr);
end
endtask