//`include "fifo.v"
module Main #(
parameter		BW4=6,	// Byte/data width
parameter [5:0]	LEN=4,
parameter TOL = 1)
    (
	input				clk, reset_L,
	input				Main_wr,
	input	 [(BW4-1):0]	Main_data_in,
	input				Main_rd,
	output	[(BW4-1):0]	Main_data_out,
	output  			Main_error_output,
	output   				Main_full,
	output   				Main_empty,
	output   				Main_almost_full,
	output   				Main_almost_empty);

fifo #(.BW(BW4), .LEN(LEN), .TOL(TOL)) Main  (
	 // Outputs
	 .fifo_data_out			(Main_data_out[(BW4-1):0]),
	 .error_output			(Main_error_output),
	 .fifo_full			(Main_full),
	 .fifo_empty			(Main_empty),
	 .fifo_almost_full		(Main_almost_full),
	 .fifo_almost_empty		(Main_almost_empty),
	 // Inputs
	 .clk				(clk),
	 .reset_L			(reset_L),
	 .fifo_wr			(Main_wr),
	 .fifo_data_in			(Main_data_in[(BW4-1):0]),
	 .fifo_rd			(Main_rd)) ;

endmodule
