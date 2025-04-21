module mem_tb;
    reg cs;                 // Chip Select
    reg wr;                 // Write Enable
    reg [9:0] addr;        // 10-bit address (from 0 to 1023)
    reg [7:0] data_in;     // 8-bit data input
    wire [7:0] data_out;   // 8-bit data output from memory
    integer k, myseed;

    // Instantiate the Unit Under Test (UUT)
    mem uut (
        .data_out(data_out),
        .cs(cs),
        .wr(wr),
        .addr(addr),
        .data_in(data_in)
    );

    // Initial block to perform memory writes and reads
    initial begin
        // Write to memory for the first 16 addresses
        for(k = 0; k < 16; k = k + 1) begin
            data_in = (k + k) % 256;  // Assign data to write (e.g., doubling the address value modulo 256)
            wr = 1;                   // Enable write
            cs = 1;                   // Enable chip select
            addr = k;                 // Set address to k
            #2;                       // Wait for 2 time units
            wr = 0;                   // Disable write
            cs = 0;                   // Disable chip select
            #2;                       // Wait for 2 time units before the next iteration
        end

        // Now perform random reads from memory
        repeat(10) begin
            #2;
            addr = $random(myseed) % 1024; // Generate random address between 0 and 1023
            wr = 0;                        // Disable write
            cs = 1;                        // Enable chip select for read operation
            $display("addr = %5d, data_out = %4d", addr, data_out); // Display the data read from memory
            #2;
            cs = 0; // Disable chip select
        end
    end

    // Initialize random seed
    initial myseed = 10;

endmodule
