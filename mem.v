module mem(
    input [addr_size-1:0] addr,       // Memory address input
    input [word_size-1:0] data_in,    // Data input to write
    input wr,                          // Write enable
    input cs,                          // Chip select
    output [word_size-1:0] data_out   // Data output
);
    // Parameter definitions
    parameter addr_size = 10;          // Address size (10 bits)
    parameter word_size = 8;           // Word size (8 bits)
    parameter mem_size = 1024;         // Memory size (1024 words)

    // Declare memory as an array of size 'mem_size' with each element of size 'word_size'
    reg [word_size-1:0] mem [mem_size-1:0];

    // Assign data output from memory at the given address
    assign data_out = mem[addr];

    // Always block triggered by address, write enable, or chip select
    always @(posedge wr or posedge cs) begin
        if (wr && cs) begin
            mem[addr] = data_in;  // Write data to memory at the given address
        end
    end
endmodule
