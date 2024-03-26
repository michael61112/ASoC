
//------> /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_wait_v1 (idat, rdy, ivld, dat, irdy, vld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  output             rdy;
  output             ivld;
  input  [width-1:0] dat;
  input              irdy;
  input              vld;

  wire   [width-1:0] idat;
  wire               rdy;
  wire               ivld;

  localparam stallOff = 0; 
  wire                  stall_ctrl;
  assign stall_ctrl = stallOff;

  assign idat = dat;
  assign rdy = irdy && !stall_ctrl;
  assign ivld = vld && !stall_ctrl;

endmodule


//------> /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_out_wait_v1 (dat, irdy, vld, idat, rdy, ivld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] dat;
  output             irdy;
  output             vld;
  input  [width-1:0] idat;
  input              rdy;
  input              ivld;

  wire   [width-1:0] dat;
  wire               irdy;
  wire               vld;

  localparam stallOff = 0; 
  wire stall_ctrl;
  assign stall_ctrl = stallOff;

  assign dat = idat;
  assign irdy = rdy && !stall_ctrl;
  assign vld = ivld && !stall_ctrl;

endmodule



//------> /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module mgc_io_sync_v2 (ld, lz);
    parameter valid = 0;

    input  ld;
    output lz;

    wire   lz;

    assign lz = ld;

endmodule


//------> /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_v1 (idat, dat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  input  [width-1:0] dat;

  wire   [width-1:0] idat;

  assign idat = dat;

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.2/1059873 Production Release
//  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
// 
//  Generated by:   asoc020@ee21
//  Generated date: Tue Mar 26 17:36:01 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    fir_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module fir_run_run_fsm (
  clk, rst, run_wen, fsm_output
);
  input clk;
  input rst;
  input run_wen;
  output [1:0] fsm_output;
  reg [1:0] fsm_output;


  // FSM State Type Declaration for fir_run_run_fsm_1
  parameter
    run_rlp_C_0 = 1'd0,
    main_C_0 = 1'd1;

  reg  state_var;
  reg  state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : fir_run_run_fsm_1
    case (state_var)
      main_C_0 : begin
        fsm_output = 2'b10;
        state_var_NS = main_C_0;
      end
      // run_rlp_C_0
      default : begin
        fsm_output = 2'b01;
        state_var_NS = main_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= run_rlp_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_staller
// ------------------------------------------------------------------


module fir_run_staller (
  clk, rst, run_wen, run_wten, input_rsci_wen_comp, output_rsci_wen_comp
);
  input clk;
  input rst;
  output run_wen;
  output run_wten;
  reg run_wten;
  input input_rsci_wen_comp;
  input output_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = input_rsci_wen_comp & output_rsci_wen_comp;
  always @(posedge clk) begin
    if ( rst ) begin
      run_wten <= 1'b0;
    end
    else begin
      run_wten <= ~ run_wen;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
// ------------------------------------------------------------------


module fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl (
  run_wten, coeffs_triosy_obj_iswt0, coeffs_triosy_obj_biwt
);
  input run_wten;
  input coeffs_triosy_obj_iswt0;
  output coeffs_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign coeffs_triosy_obj_biwt = (~ run_wten) & coeffs_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci_output_wait_dp
// ------------------------------------------------------------------


module fir_run_output_rsci_output_wait_dp (
  clk, rst, output_rsci_oswt, output_rsci_wen_comp, output_rsci_biwt, output_rsci_bdwt,
      output_rsci_bcwt
);
  input clk;
  input rst;
  input output_rsci_oswt;
  output output_rsci_wen_comp;
  input output_rsci_biwt;
  input output_rsci_bdwt;
  output output_rsci_bcwt;
  reg output_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign output_rsci_wen_comp = (~ output_rsci_oswt) | output_rsci_biwt | output_rsci_bcwt;
  always @(posedge clk) begin
    if ( rst ) begin
      output_rsci_bcwt <= 1'b0;
    end
    else begin
      output_rsci_bcwt <= ~((~(output_rsci_bcwt | output_rsci_biwt)) | output_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci_output_wait_ctrl
// ------------------------------------------------------------------


module fir_run_output_rsci_output_wait_ctrl (
  run_wen, output_rsci_oswt, output_rsci_biwt, output_rsci_bdwt, output_rsci_bcwt,
      output_rsci_irdy, output_rsci_ivld_run_sct
);
  input run_wen;
  input output_rsci_oswt;
  output output_rsci_biwt;
  output output_rsci_bdwt;
  input output_rsci_bcwt;
  input output_rsci_irdy;
  output output_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire output_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign output_rsci_bdwt = output_rsci_oswt & run_wen;
  assign output_rsci_biwt = output_rsci_ogwt & output_rsci_irdy;
  assign output_rsci_ogwt = output_rsci_oswt & (~ output_rsci_bcwt);
  assign output_rsci_ivld_run_sct = output_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci_input_wait_dp
// ------------------------------------------------------------------


module fir_run_input_rsci_input_wait_dp (
  clk, rst, input_rsci_oswt, input_rsci_wen_comp, input_rsci_idat_mxwt, input_rsci_biwt,
      input_rsci_bdwt, input_rsci_bcwt, input_rsci_idat
);
  input clk;
  input rst;
  input input_rsci_oswt;
  output input_rsci_wen_comp;
  output [7:0] input_rsci_idat_mxwt;
  input input_rsci_biwt;
  input input_rsci_bdwt;
  output input_rsci_bcwt;
  reg input_rsci_bcwt;
  input [7:0] input_rsci_idat;


  // Interconnect Declarations
  reg [7:0] input_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign input_rsci_wen_comp = (~ input_rsci_oswt) | input_rsci_biwt | input_rsci_bcwt;
  assign input_rsci_idat_mxwt = MUX_v_8_2_2(input_rsci_idat, input_rsci_idat_bfwt,
      input_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      input_rsci_bcwt <= 1'b0;
    end
    else begin
      input_rsci_bcwt <= ~((~(input_rsci_bcwt | input_rsci_biwt)) | input_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      input_rsci_idat_bfwt <= 8'b00000000;
    end
    else if ( input_rsci_biwt ) begin
      input_rsci_idat_bfwt <= input_rsci_idat;
    end
  end

  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci_input_wait_ctrl
// ------------------------------------------------------------------


module fir_run_input_rsci_input_wait_ctrl (
  run_wen, input_rsci_oswt, input_rsci_biwt, input_rsci_bdwt, input_rsci_bcwt, input_rsci_irdy_run_sct,
      input_rsci_ivld
);
  input run_wen;
  input input_rsci_oswt;
  output input_rsci_biwt;
  output input_rsci_bdwt;
  input input_rsci_bcwt;
  output input_rsci_irdy_run_sct;
  input input_rsci_ivld;


  // Interconnect Declarations
  wire input_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign input_rsci_bdwt = input_rsci_oswt & run_wen;
  assign input_rsci_biwt = input_rsci_ogwt & input_rsci_ivld;
  assign input_rsci_ogwt = input_rsci_oswt & (~ input_rsci_bcwt);
  assign input_rsci_irdy_run_sct = input_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeffs_triosy_obj
// ------------------------------------------------------------------


module fir_run_coeffs_triosy_obj (
  coeffs_triosy_lz, run_wten, coeffs_triosy_obj_iswt0
);
  output coeffs_triosy_lz;
  input run_wten;
  input coeffs_triosy_obj_iswt0;


  // Interconnect Declarations
  wire coeffs_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) coeffs_triosy_obj (
      .ld(coeffs_triosy_obj_biwt),
      .lz(coeffs_triosy_lz)
    );
  fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .coeffs_triosy_obj_iswt0(coeffs_triosy_obj_iswt0),
      .coeffs_triosy_obj_biwt(coeffs_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci
// ------------------------------------------------------------------


module fir_run_output_rsci (
  clk, rst, output_rsc_dat, output_rsc_vld, output_rsc_rdy, run_wen, output_rsci_oswt,
      output_rsci_wen_comp, output_rsci_idat
);
  input clk;
  input rst;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;
  input run_wen;
  input output_rsci_oswt;
  output output_rsci_wen_comp;
  input [7:0] output_rsci_idat;


  // Interconnect Declarations
  wire output_rsci_biwt;
  wire output_rsci_bdwt;
  wire output_rsci_bcwt;
  wire output_rsci_irdy;
  wire output_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd3),
  .width(32'sd8)) output_rsci (
      .irdy(output_rsci_irdy),
      .ivld(output_rsci_ivld_run_sct),
      .idat(output_rsci_idat),
      .rdy(output_rsc_rdy),
      .vld(output_rsc_vld),
      .dat(output_rsc_dat)
    );
  fir_run_output_rsci_output_wait_ctrl fir_run_output_rsci_output_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .output_rsci_oswt(output_rsci_oswt),
      .output_rsci_biwt(output_rsci_biwt),
      .output_rsci_bdwt(output_rsci_bdwt),
      .output_rsci_bcwt(output_rsci_bcwt),
      .output_rsci_irdy(output_rsci_irdy),
      .output_rsci_ivld_run_sct(output_rsci_ivld_run_sct)
    );
  fir_run_output_rsci_output_wait_dp fir_run_output_rsci_output_wait_dp_inst (
      .clk(clk),
      .rst(rst),
      .output_rsci_oswt(output_rsci_oswt),
      .output_rsci_wen_comp(output_rsci_wen_comp),
      .output_rsci_biwt(output_rsci_biwt),
      .output_rsci_bdwt(output_rsci_bdwt),
      .output_rsci_bcwt(output_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci
// ------------------------------------------------------------------


module fir_run_input_rsci (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, run_wen, input_rsci_oswt,
      input_rsci_wen_comp, input_rsci_idat_mxwt
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input run_wen;
  input input_rsci_oswt;
  output input_rsci_wen_comp;
  output [7:0] input_rsci_idat_mxwt;


  // Interconnect Declarations
  wire input_rsci_biwt;
  wire input_rsci_bdwt;
  wire input_rsci_bcwt;
  wire input_rsci_irdy_run_sct;
  wire input_rsci_ivld;
  wire [7:0] input_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd1),
  .width(32'sd8)) input_rsci (
      .rdy(input_rsc_rdy),
      .vld(input_rsc_vld),
      .dat(input_rsc_dat),
      .irdy(input_rsci_irdy_run_sct),
      .ivld(input_rsci_ivld),
      .idat(input_rsci_idat)
    );
  fir_run_input_rsci_input_wait_ctrl fir_run_input_rsci_input_wait_ctrl_inst (
      .run_wen(run_wen),
      .input_rsci_oswt(input_rsci_oswt),
      .input_rsci_biwt(input_rsci_biwt),
      .input_rsci_bdwt(input_rsci_bdwt),
      .input_rsci_bcwt(input_rsci_bcwt),
      .input_rsci_irdy_run_sct(input_rsci_irdy_run_sct),
      .input_rsci_ivld(input_rsci_ivld)
    );
  fir_run_input_rsci_input_wait_dp fir_run_input_rsci_input_wait_dp_inst (
      .clk(clk),
      .rst(rst),
      .input_rsci_oswt(input_rsci_oswt),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .input_rsci_idat_mxwt(input_rsci_idat_mxwt),
      .input_rsci_biwt(input_rsci_biwt),
      .input_rsci_bdwt(input_rsci_bdwt),
      .input_rsci_bcwt(input_rsci_bcwt),
      .input_rsci_idat(input_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run
// ------------------------------------------------------------------


module fir_run (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, coeffs_rsc_dat, coeffs_triosy_lz,
      output_rsc_dat, output_rsc_vld, output_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input [63:0] coeffs_rsc_dat;
  output coeffs_triosy_lz;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;


  // Interconnect Declarations
  wire run_wen;
  wire run_wten;
  wire input_rsci_wen_comp;
  wire [7:0] input_rsci_idat_mxwt;
  wire [63:0] coeffs_rsci_idat;
  wire output_rsci_wen_comp;
  reg [7:0] output_rsci_idat;
  wire [1:0] fsm_output;
  reg reg_coeffs_triosy_obj_iswt0_cse;
  reg reg_input_rsci_iswt0_cse;
  wire and_18_cse;
  reg [7:0] regs_1_sva;
  reg [7:0] regs_0_sva;
  reg [7:0] MAC_asn_1_itm;
  reg [7:0] MAC_asn_3_itm;
  reg [7:0] MAC_asn_4_itm;
  reg [7:0] MAC_asn_5_itm;
  reg [7:0] MAC_asn_6_itm;

  wire[18:0] MAC_8_acc_1_nl;
  wire[21:0] nl_MAC_8_acc_1_nl;
  wire[15:0] MAC_3_mul_nl;
  wire signed [15:0] nl_MAC_3_mul_sgnd;
  wire[15:0] MAC_4_mul_nl;
  wire signed [15:0] nl_MAC_4_mul_sgnd;
  wire[15:0] MAC_7_mul_nl;
  wire signed [15:0] nl_MAC_7_mul_sgnd;
  wire[15:0] MAC_8_mul_nl;
  wire signed [15:0] nl_MAC_8_mul_sgnd;
  wire[15:0] MAC_5_mul_nl;
  wire signed [15:0] nl_MAC_5_mul_sgnd;
  wire[15:0] MAC_6_mul_nl;
  wire signed [15:0] nl_MAC_6_mul_sgnd;
  wire[15:0] MAC_1_mul_nl;
  wire signed [15:0] nl_MAC_1_mul_sgnd;
  wire[15:0] MAC_2_mul_nl;
  wire signed [15:0] nl_MAC_2_mul_sgnd;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd64)) coeffs_rsci (
      .dat(coeffs_rsc_dat),
      .idat(coeffs_rsci_idat)
    );
  fir_run_input_rsci fir_run_input_rsci_inst (
      .clk(clk),
      .rst(rst),
      .input_rsc_dat(input_rsc_dat),
      .input_rsc_vld(input_rsc_vld),
      .input_rsc_rdy(input_rsc_rdy),
      .run_wen(run_wen),
      .input_rsci_oswt(reg_input_rsci_iswt0_cse),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .input_rsci_idat_mxwt(input_rsci_idat_mxwt)
    );
  fir_run_output_rsci fir_run_output_rsci_inst (
      .clk(clk),
      .rst(rst),
      .output_rsc_dat(output_rsc_dat),
      .output_rsc_vld(output_rsc_vld),
      .output_rsc_rdy(output_rsc_rdy),
      .run_wen(run_wen),
      .output_rsci_oswt(reg_coeffs_triosy_obj_iswt0_cse),
      .output_rsci_wen_comp(output_rsci_wen_comp),
      .output_rsci_idat(output_rsci_idat)
    );
  fir_run_coeffs_triosy_obj fir_run_coeffs_triosy_obj_inst (
      .coeffs_triosy_lz(coeffs_triosy_lz),
      .run_wten(run_wten),
      .coeffs_triosy_obj_iswt0(reg_coeffs_triosy_obj_iswt0_cse)
    );
  fir_run_staller fir_run_staller_inst (
      .clk(clk),
      .rst(rst),
      .run_wen(run_wen),
      .run_wten(run_wten),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .output_rsci_wen_comp(output_rsci_wen_comp)
    );
  fir_run_run_fsm fir_run_run_fsm_inst (
      .clk(clk),
      .rst(rst),
      .run_wen(run_wen),
      .fsm_output(fsm_output)
    );
  assign and_18_cse = run_wen & (~ (fsm_output[0]));
  always @(posedge clk) begin
    if ( rst ) begin
      reg_coeffs_triosy_obj_iswt0_cse <= 1'b0;
      reg_input_rsci_iswt0_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      reg_coeffs_triosy_obj_iswt0_cse <= fsm_output[1];
      reg_input_rsci_iswt0_cse <= 1'b1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      output_rsci_idat <= 8'b00000000;
      regs_0_sva <= 8'b00000000;
      MAC_asn_1_itm <= 8'b00000000;
      regs_1_sva <= 8'b00000000;
      MAC_asn_3_itm <= 8'b00000000;
      MAC_asn_4_itm <= 8'b00000000;
      MAC_asn_5_itm <= 8'b00000000;
      MAC_asn_6_itm <= 8'b00000000;
    end
    else if ( and_18_cse ) begin
      output_rsci_idat <= readslicef_19_8_11(MAC_8_acc_1_nl);
      regs_0_sva <= input_rsci_idat_mxwt;
      MAC_asn_1_itm <= regs_1_sva;
      regs_1_sva <= regs_0_sva;
      MAC_asn_3_itm <= MAC_asn_4_itm;
      MAC_asn_4_itm <= MAC_asn_1_itm;
      MAC_asn_5_itm <= MAC_asn_6_itm;
      MAC_asn_6_itm <= MAC_asn_3_itm;
    end
  end
  assign nl_MAC_3_mul_sgnd = $signed((coeffs_rsci_idat[47:40])) * $signed(MAC_asn_3_itm);
  assign MAC_3_mul_nl = $unsigned(nl_MAC_3_mul_sgnd);
  assign nl_MAC_4_mul_sgnd = $signed((coeffs_rsci_idat[39:32])) * $signed(MAC_asn_4_itm);
  assign MAC_4_mul_nl = $unsigned(nl_MAC_4_mul_sgnd);
  assign nl_MAC_7_mul_sgnd = $signed((coeffs_rsci_idat[15:8])) * $signed(regs_0_sva);
  assign MAC_7_mul_nl = $unsigned(nl_MAC_7_mul_sgnd);
  assign nl_MAC_8_mul_sgnd = $signed((coeffs_rsci_idat[7:0])) * $signed((input_rsci_idat_mxwt));
  assign MAC_8_mul_nl = $unsigned(nl_MAC_8_mul_sgnd);
  assign nl_MAC_5_mul_sgnd = $signed((coeffs_rsci_idat[31:24])) * $signed(MAC_asn_1_itm);
  assign MAC_5_mul_nl = $unsigned(nl_MAC_5_mul_sgnd);
  assign nl_MAC_6_mul_sgnd = $signed((coeffs_rsci_idat[23:16])) * $signed(regs_1_sva);
  assign MAC_6_mul_nl = $unsigned(nl_MAC_6_mul_sgnd);
  assign nl_MAC_1_mul_sgnd = $signed((coeffs_rsci_idat[63:56])) * $signed(MAC_asn_5_itm);
  assign MAC_1_mul_nl = $unsigned(nl_MAC_1_mul_sgnd);
  assign nl_MAC_2_mul_sgnd = $signed((coeffs_rsci_idat[55:48])) * $signed(MAC_asn_6_itm);
  assign MAC_2_mul_nl = $unsigned(nl_MAC_2_mul_sgnd);
  assign nl_MAC_8_acc_1_nl = conv_s2s_16_19(MAC_3_mul_nl) + conv_s2s_16_19(MAC_4_mul_nl)
      + conv_s2s_16_19(MAC_7_mul_nl) + conv_s2s_16_19(MAC_8_mul_nl) + conv_s2s_16_19(MAC_5_mul_nl)
      + conv_s2s_16_19(MAC_6_mul_nl) + conv_s2s_16_19(MAC_1_mul_nl) + conv_s2s_16_19(MAC_2_mul_nl);
  assign MAC_8_acc_1_nl = nl_MAC_8_acc_1_nl[18:0];

  function automatic [7:0] readslicef_19_8_11;
    input [18:0] vector;
    reg [18:0] tmp;
  begin
    tmp = vector >> 11;
    readslicef_19_8_11 = tmp[7:0];
  end
  endfunction


  function automatic [18:0] conv_s2s_16_19 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_19 = {{3{vector[15]}}, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir
// ------------------------------------------------------------------


module fir (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, coeffs_rsc_dat, coeffs_triosy_lz,
      output_rsc_dat, output_rsc_vld, output_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input [63:0] coeffs_rsc_dat;
  output coeffs_triosy_lz;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;



  // Interconnect Declarations for Component Instantiations 
  fir_run fir_run_inst (
      .clk(clk),
      .rst(rst),
      .input_rsc_dat(input_rsc_dat),
      .input_rsc_vld(input_rsc_vld),
      .input_rsc_rdy(input_rsc_rdy),
      .coeffs_rsc_dat(coeffs_rsc_dat),
      .coeffs_triosy_lz(coeffs_triosy_lz),
      .output_rsc_dat(output_rsc_dat),
      .output_rsc_vld(output_rsc_vld),
      .output_rsc_rdy(output_rsc_rdy)
    );
endmodule



