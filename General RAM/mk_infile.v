task mk_infile;
reg [7:0] random_data;
integer i, f_ch;
begin
 f_ch = $fopen ("output_files/ch_data.txt");
 for (i=0; i<=(2**26)-1; i=i+1)
  begin
  random_data = $random %536870912;
  $fdisplay (f_ch, "%b", random_data);
  end
  $fclose (f_ch);
end
endtask 