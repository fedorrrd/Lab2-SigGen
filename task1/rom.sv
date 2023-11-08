module rom (
    input logic clk,     //input clock
    input logic [7:0] addr,     //address 
    output logic [7:0] dout     
); 

    logic [7:0] rom_array [255:0];

    initial begin
            $display("loading rom");
            $readmemh("sinerom.mem", rom_array);
    end;

    always_ff @(posedge clk)
        //output is synchronos
        dout<=rom_array[addr];
endmodule
