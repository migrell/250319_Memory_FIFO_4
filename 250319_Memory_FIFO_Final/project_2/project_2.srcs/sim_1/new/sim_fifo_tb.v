`timescale 1ns / 1ps

module tb_FIFO(

    );

    reg clk,reset,wr,rd;
    reg [7:0] wdata;
    wire empty,full;
    wire [7:0] rdata;

    FIFO u_FIFO (
        .clk(clk), 
        .reset(reset),
        .wdata(wdata),
        .wr(wr), 
        .rd(rd),
        .rdata(rdata),
        .full(full), 
        .empty(empty)
);

    always #5 clk = ~clk;

    initial begin
        clk=0;
        reset = 1;
        wdata = 0;
        wr = 0;
        rd = 0;

        #10; reset=0;
        #50;
        wr=1;
        wdata = 8'haa;
        #10; 
        wdata = 8'h55;
        #10; 
        wr=0;
        rd=1;
        #10;
        $stop;
    end

endmodule
