//`include "fifo.v"
module VC0_cond #(
parameter		BW=6,	// Byte/data width
parameter [5:0]	LEN16=16,
parameter TOL = 1)
    (
	input				clk, reset_L,
	input				valid_in_vc0,
	input	 [(BW-1):0]	data_in_vc0,
	input				VC0_rd,
	input [(LEN16-1):0] UmbralV0_LOW,
	input [(LEN16-1):0] UmbralV0_HIGH,
	output	[(BW-1):0]	VC0_data_out,
	output  			VC0_error_output,
	output   				VC0_full,
	output   				VC0_empty,
	output   				VC0_almost_full,
	output   				VC0_almost_empty);

fifo16_cond #(.BW(BW), .LEN(LEN16), .TOL(TOL)) VC0  (
	 // Outputs
	 .fifo_data_out			(VC0_data_out[(BW-1):0]),
	 .error_output			(VC0_error_output),
	 .fifo_full			(VC0_full),
	 .fifo_empty			(VC0_empty),
	 .fifo_almost_full		(VC0_almost_full),
	 .fifo_almost_empty		(VC0_almost_empty),
	 // Inputs
	 .clk				(clk),
	 .reset_L			(reset_L),
	 .fifo_wr			(valid_in_vc0),
	 .umbral_bajo		(UmbralV0_LOW[(LEN16-1):0]),
	 .umbral_alto		(UmbralV0_HIGH[(LEN16-1):0]),
	 .fifo_data_in			(data_in_vc0[(BW-1):0]),
	 .fifo_rd			(VC0_rd)) ;

endmodule
