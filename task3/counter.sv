module counter(
    input  logic clk,     //clock
    input  logic rst,     //reset
    input  logic en,      //counter enable
    input  logic [8:0] incr,    //counter start?
    output logic [8:0] count    //count output
);

always_ff @ (posedge clk)
    if (rst)    count <= incr;
    else if(en)      count <= count + incr;

endmodule
