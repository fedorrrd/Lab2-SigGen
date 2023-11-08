module sinegen(
    input logic [7:0] incr,
    input logic rst,
    input logic en,
    input logic clk,
    input logic [7:0] offset,
    output logic [7:0] dout1,
    output logic [7:0] dout2
);

    logic [7:0] addr1;

    counter counter(
        .clk(clk),
        .rst(rst),
        .en(en),
        .incr(incr),
        .count(addr1)
    );

    rom rom(
        .clk(clk),
        .addr1(addr1),
        .addr2(addr1 + offset),
        .dout1(dout1),
        .dout2(dout2)
    );

endmodule
