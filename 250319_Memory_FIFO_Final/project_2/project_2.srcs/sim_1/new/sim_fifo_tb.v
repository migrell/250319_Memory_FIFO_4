`timescale 1ns / 1ps

module tb_FIFO();
    reg clk, reset, wr, rd;
    reg [7:0] wdata;
    wire empty, full;
    wire [7:0] rdata;
    
    // FIFO 인스턴스
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
    
    // 클럭 생성
    always #5 clk = ~clk;
    
    initial begin
        // 초기화
        clk = 0;
        reset = 1;
        wdata = 0;
        wr = 0;
        rd = 0;
        
        // 리셋 해제 및 대기
        #20 reset = 0;
        #10;
        
        // 16개 레지스터 모두 쓰기 (0x10~0x1F)
        wr = 1;
        wdata = 8'h10;
        #10 wdata = 8'h11;
        #10 wdata = 8'h12;
        #10 wdata = 8'h13;
        #10 wdata = 8'h14;
        #10 wdata = 8'h15;
        #10 wdata = 8'h16;
        #10 wdata = 8'h17;
        #10 wdata = 8'h18;
        #10 wdata = 8'h19;
        #10 wdata = 8'h1A;
        #10 wdata = 8'h1B;
        #10 wdata = 8'h1C;
        #10 wdata = 8'h1D;
        #10 wdata = 8'h1E;
        #10 wdata = 8'h1F;
        #10;
        wr = 0;
        
        // full 신호 확인을 위한 대기
        #20;
        
        // 16개 레지스터 모두 읽기
        rd = 1;
        #10; // 0x10 읽기
        #10; // 0x11 읽기
        #10; // 0x12 읽기
        #10; // 0x13 읽기
        #10; // 0x14 읽기
        #10; // 0x15 읽기
        #10; // 0x16 읽기
        #10; // 0x17 읽기
        #10; // 0x18 읽기
        #10; // 0x19 읽기
        #10; // 0x1A 읽기
        #10; // 0x1B 읽기
        #10; // 0x1C 읽기
        #10; // 0x1D 읽기
        #10; // 0x1E 읽기
        #10; // 0x1F 읽기
        #10;
        rd = 0;
        
        // empty 신호 확인을 위한 대기
        #20;
        
        $finish;
    end
    
endmodule