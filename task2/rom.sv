module rom (
    input logic clk,     //input clock
    input logic [7:0] addr1,     //address 
    input logic [7:0] addr2,
    output logic [7:0] dout1,
    output logic [7:0] dout2     
); 

    logic [7:0] rom_array [255:0];

    initial begin
            $display("loading rom");
            $readmemh("sinerom.mem", rom_array);
    end;

    always_ff @(posedge clk) begin
        //output is synchronos
        dout1<=rom_array[addr1];
        dout2<=rom_array[addr2];
    end
endmodule
