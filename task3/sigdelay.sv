module sigdelay(
    input logic rst,
    input logic wr,
    input logic rd,
    input logic clk,
    input logic [8:0] offset,
    input logic [8:0] mic_signal,
    output logic [8:0] delayed_signal 
);

    logic [8:0] addr1;

    counter counter(
        .clk(clk),
        .rst(rst),
        .en(wr),
        .incr(mic_signal),
        .count(addr1)
    );

    ram ram(
        .clk(clk),
        .wr_en(wr),
        .rd_en(rd),
        .wr_addr(addr1),
        .rd_addr(addr1 + offset),
        .din(mic_signal),
        .dout(delayed_signal)
    );

endmodule
