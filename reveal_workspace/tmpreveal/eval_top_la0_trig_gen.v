//=============================================================================
// Verilog module generated by IPExpress    08/11/2022    13:21:24         
// Filename: eval_top_la0_trig_gen.v                                          
// Copyright(c) 2006 Lattice Semiconductor Corporation. All rights reserved.   
//=============================================================================

/* WARNING - Changes to this file should be performed by re-running IPexpress
or modifying the .LPC file and regenerating the core.  Other changes may lead
to inconsistent simulation and/or implemenation results */

module eval_top_la0_trig (
    clk,
    reset_n,
    tu_in_0,
    wr_din,
    rd_dout_trig,
    addr,
    ren,
    wen,
    wen_jtck,
    capture_clk,
    clear,
    parity_err,
    te_prog_din,
    ip_enable_bit,
    jtck,
    jrstn,
    jshift,
    jshift_d1,
    jce2,
    capture_dr,
    tt_prog_en_0,
    even_parity,
    trigger
);

// PARAMETERS DEFINED BY ipEXPRESS
localparam NUM_TU = 1;
localparam NUM_TE = 1;
localparam NUM_TCNT_BITS = 3;
localparam NUM_TE_ROW_0  = 2;
localparam NUM_TE_COL_0  = 16;
localparam TE_EBR_0      = 0;
localparam NUM_TE_EVENT_CNT_BITS_0 = 0;
localparam NUM_TU_BITS_0 = 1;
localparam GSR_ENABLE  = 0;
localparam LSCC_FAMILY = "LFCPNX";

input  clk;
input  reset_n;
input  [NUM_TU_BITS_0 -1:0] tu_in_0;
input  [15:0] wr_din;
output [15:0] rd_dout_trig;
input  [15:0] addr;
input  ren;
input  wen;
input  wen_jtck;
input  capture_clk;
input  clear;
input  parity_err;
input  [15:0] te_prog_din;
input  ip_enable_bit;
input  jtck;
input  jrstn;
input  jshift;
input  jshift_d1;
input  jce2;
input  capture_dr;
output tt_prog_en_0;
output even_parity;
output trigger;

wire [NUM_TE -1 :0] tt_prog_en;
wire [NUM_TE -1 :0] tt_end;
wire [NUM_TE -1 :0] te_out;
wire clk;
wire reset_n;
wire [NUM_TU -1: 0] wen_tu;
wire [NUM_TE -1: 0] wen_te;
wire rd_tu;
wire rd_te;
wire wen_tcnt;
wire [NUM_TU -1: 0] tu_out;
wire [15:0] rd_dout_te [NUM_TE -1:0];
wire [15:0] rd_dout_tu [NUM_TU -1:0];
wire [15:0] rd_dout_tcnt;
wire [15:0] rd_dout_trig;

assign rd_dout_trig = (rd_tu) ? rd_dout_tu[addr[11:8]] : (rd_te) ? rd_dout_te[addr[11:8]] : rd_dout_tcnt; 
assign tt_prog_en_0 = tt_prog_en[0]; 

rvl_decode #(
    .NUM_TU         (NUM_TU),
    .NUM_TE         (NUM_TE)
)
decode_u (
    .addr           (addr),
    .ren            (ren),
    .wen            (wen),
    .wen_tu         (wen_tu),
    .wen_te         (wen_te),
    .wen_tcnt       (wen_tcnt),
    .rd_tu          (rd_tu),
    .rd_te          (rd_te)
);

rvl_tu #(
    .NUM_TU_BITS    (NUM_TU_BITS_0)
)
tu_0 (
    .clk            (clk),
    .reset_n        (reset_n),
    .input_a        (tu_in_0),
    .addr           (addr[5:0]),
    .wr_din         (wr_din[15:0]),
    .wen_tu         (wen_tu[0]),
    .rd_dout_tu     (rd_dout_tu[0]),
    .tu_out         (tu_out[0])
);

rvl_te #(
    .NUM_TU         (NUM_TU),
    .NUM_TE_ROW     (NUM_TE_ROW_0),
    .NUM_TE_COL     (NUM_TE_COL_0),
    .TE_EBR         (TE_EBR_0),
    .NUM_TE_EVENT_CNT_BITS (NUM_TE_EVENT_CNT_BITS_0),
    .GSR_ENABLE     (GSR_ENABLE),
    .LSCC_FAMILY    (LSCC_FAMILY)
)
te_0 (
    .clk            (clk),
    .reset_n        (reset_n),
    .clear          (clear),
    .te_prog_din    (te_prog_din),
    .te_in          ({
                      tu_out[0]}),
    .wr_din         (wr_din[15:0]),
    .rd_dout_te     (rd_dout_te[0]),
    .addr           (addr[13:0]),
    .wen_te         (wen_te[0]),
    .ip_enable_bit  (ip_enable_bit),
    .jtck           (jtck),
    .jrstn          (jrstn),
    .wen_jtck       (wen_jtck),
    .jshift         (jshift),
    .jshift_d1      (jshift_d1),
    .jce2           (jce2),
    .first_te       (
                      1'b1),
    .tt_start       (
                      capture_dr),
    .tt_prog_en     (tt_prog_en[0]),
    .tt_end         (tt_end[0]),
    .te_out         (te_out[0])
);


rvl_tcnt #(
    .NUM_TE         (NUM_TE),
    .NUM_TCNT_BITS  (NUM_TCNT_BITS)
)
tcnt_0 (
    .clk            (clk),
    .reset_n        (reset_n),
    .te_out         ({
                      te_out[0]}),
    .wr_din         (wr_din[15:0]),
    .rd_dout_tcnt   (rd_dout_tcnt),
    .addr           (addr[15:0]),
    .wen_tcnt       (wen_tcnt),
    .ren            (ren),
    .wen            (wen),
    .capture_clk    (capture_clk),
    .even_parity    (even_parity),
    .parity_err     (parity_err),
    .trigger_en     (1'b1),
    .trigger        (trigger),
    .trig_lat       (trig_lat),
    .clear          (clear)
);

endmodule