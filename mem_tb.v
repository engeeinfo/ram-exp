module mem_tb;
reg cs;
reg wr;
reg[9:0] addr;
reg [7:0] data_in;
wire [7:0] data_out;
integer k,myseed;
mem uut(data_out,cs,wr,addr,data_in);
initial 
begin
for(k=0;k<=15;k=k+1)
begin
data_in = (k + k) % 256; 
wr = 1; 
cs = 1;
#2 addr = k;
 wr = 0;
 cs = 0; 
end
repeat(10)
begin
#2 addr = $random(myseed)% 1024;
wr=0; cs = 1;
$display("addr = %5d, data_in = %4d",addr,data_in);
end
end
initial myseed = 10;
endmodule
