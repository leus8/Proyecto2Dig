`timescale 1ns / 100ps

`include "VC0.v"
`include "VC0_estr.v"

`include "cmos_cells.v"

`include "probador.v"


module testbench;

    //PARAMS
    parameter BW=16;
	parameter BW16=16;

    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		VC0_almost_empty;	// From VC0_cond of VC0.v
    wire		VC0_almost_full;	// From VC0_cond of VC0.v
    wire [(BW-1):0]	VC0_data_in;		// From prb of probador.v
    wire [(BW16-1):0]	VC0_data_out;		// From VC0_cond of VC0.v
    wire		VC0_empty;		// From VC0_cond of VC0.v
    wire		VC0_full;		// From VC0_cond of VC0.v
    wire		VC0_rd;			// From prb of probador.v
    wire		VC0_wr;			// From prb of probador.v
    wire		clk;			// From prb of probador.v
    wire		error_output;		// From VC0_cond of VC0.v
    wire		reset_L;		// From prb of probador.v
    // End of automatics

    // ----------------> Estructurales >----------------
    wire [(BW-1):0] VC0_estr_data_out;
    wire error_estr_output;
    wire VC0_estr_full, VC0_estr_empty;
    wire VC0_estr_almost_full, VC0_estr_almost_empty;
    // ------------------------------------------------>

    VC0 VC0_cond(/*AUTOINST*/
		 // Outputs
		 .VC0_data_out		(VC0_data_out[(BW16-1):0]),
		 .error_output		(error_output),
		 .VC0_full		(VC0_full),
		 .VC0_empty		(VC0_empty),
		 .VC0_almost_full	(VC0_almost_full),
		 .VC0_almost_empty	(VC0_almost_empty),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .VC0_wr		(VC0_wr),
		 .VC0_data_in		(VC0_data_in[(BW16-1):0]),
		 .VC0_rd		(VC0_rd));

    VC0_estr VC0_synth(
		       // Outputs
		       .VC0_estr_almost_empty(VC0_estr_almost_empty),
		       .VC0_estr_almost_full(VC0_estr_almost_full),
		       .VC0_estr_data_out(VC0_estr_data_out[(BW-1):0]),
		       .VC0_estr_empty	(VC0_estr_empty),
		       .VC0_estr_full	(VC0_estr_full),
		       .error_output	(error_estr_output),
		       // Inputs
		       .VC0_estr_data_in(VC0_data_in[(BW-1):0]),
		       .VC0_estr_rd	(VC0_rd),
		       .VC0_estr_wr	(VC0_wr),
		       .clk		(clk),
		       .reset_L		(reset_L));
//
    probador prb(/*AUTOINST*/
		 // Outputs
		 .reset_L		(reset_L),
		 .clk			(clk),
		 .VC0_wr		(VC0_wr),
		 .VC0_rd		(VC0_rd),
		 .VC0_data_in		(VC0_data_in[(BW-1):0]),
		 // Inputs
		 .VC0_data_out		(VC0_data_out[(BW-1):0]),
		 .VC0_estr_data_out	(VC0_estr_data_out[(BW-1):0]),
		 .error_output		(error_output),
		 .error_estr_output	(error_estr_output),
		 .VC0_full		(VC0_full),
		 .VC0_empty		(VC0_empty),
		 .VC0_estr_full		(VC0_estr_full),
		 .VC0_almost_full	(VC0_almost_full),
		 .VC0_estr_empty	(VC0_estr_empty),
		 .VC0_estr_almost_full	(VC0_estr_almost_full),
		 .VC0_estr_almost_empty	(VC0_estr_almost_empty));

endmodule
