module ram (
    input logic clk,     
    input logic wr_en,
    input logic rd_en,
    input logic [8:0] wr_addr,    
    input logic [8:0] rd_addr,
    input logic [8:0] din,
    output logic [8:0] dout     
); 

    logic [8:0] ram_array [511:0];

    always_ff @(posedge clk) begin
        if (wr_en)
            ram_array[wr_addr] <= din;
        if (rd_en)
            dout <= ram_array[rd_addr];
    end
endmodule
