module probador (
	output reg reset_L,
    output reg clk,
    output reg fifo_wr,
    output reg fifo_rd,
    output reg [(BW-1):0] fifo_data_in,
    input [(BW-1):0] fifo_data_out,
    input [(BW-1):0] fifo_data_out_estr,
    input error_output,
    input error_output_estr,
    input fifo_full,
    input fifo_empty,
    input fifo_full_estr,
    input fifo_empty_estr,
    input fifo_almost_full,
    input fifo_almost_empty,
    input fifo_almost_full_estr,
    input fifo_almost_empty_estr);
    parameter BW=16;

initial begin
    $dumpfile("./dump/memory.vcd");
    $dumpvars;

    fifo_wr<=0;
    fifo_rd<=0;
    fifo_data_in<=6'h00;
    reset_L<=0;
    @(posedge clk);
    @(posedge clk);
    reset_L<=1;
    @(posedge clk);

    fifo_data_in<=6'h0A;
    @(posedge clk);
    fifo_data_in<=6'h0B;
    @(posedge clk);
    fifo_data_in<=6'h0C;
    @(posedge clk);
    fifo_data_in<=6'h0D;
    @(posedge clk);
    fifo_data_in<=6'h0E;
    @(posedge clk);
    fifo_data_in<=6'h0F;
    @(posedge clk);
    fifo_data_in<=6'h09;
    @(posedge clk);
    fifo_data_in<=6'h00;
    @(posedge clk);

    fifo_rd<=1;
    repeat (7) begin
    @(posedge clk);
    end
    fifo_rd <=0;
    repeat (6) begin
    @(posedge clk);
    end
    fifo_rd <=1;
    repeat (6) begin
    @(posedge clk);
    end


    $finish;
end

    always @ (*) begin
        if (reset_L && ~fifo_full && fifo_data_in) begin
            fifo_wr <= 1;
            @(posedge clk);
        end
        else begin
            fifo_wr <= 0;
            @(posedge clk);
        end
    end

initial clk <= 0; 
always #8 clk <= ~clk;

endmodule