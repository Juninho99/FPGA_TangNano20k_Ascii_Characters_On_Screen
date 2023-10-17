module gw_gao(
    \ascii/MemoryClk ,
    \ascii/start ,
    \ascii/LCD_DE ,
    \LCD_B[4] ,
    \LCD_B[3] ,
    \LCD_B[2] ,
    \LCD_B[1] ,
    \LCD_B[0] ,
    \ascii/PixelCount[16] ,
    \ascii/PixelCount[15] ,
    \ascii/PixelCount[14] ,
    \ascii/PixelCount[13] ,
    \ascii/PixelCount[12] ,
    \ascii/PixelCount[11] ,
    \ascii/PixelCount[10] ,
    \ascii/PixelCount[9] ,
    \ascii/PixelCount[8] ,
    \ascii/PixelCount[7] ,
    \ascii/PixelCount[6] ,
    \ascii/PixelCount[5] ,
    \ascii/PixelCount[4] ,
    \ascii/PixelCount[3] ,
    \ascii/PixelCount[2] ,
    \ascii/PixelCount[1] ,
    \ascii/PixelCount[0] ,
    \ascii/LineCount[16] ,
    \ascii/LineCount[15] ,
    \ascii/LineCount[14] ,
    \ascii/LineCount[13] ,
    \ascii/LineCount[12] ,
    \ascii/LineCount[11] ,
    \ascii/LineCount[10] ,
    \ascii/LineCount[9] ,
    \ascii/LineCount[8] ,
    \ascii/LineCount[7] ,
    \ascii/LineCount[6] ,
    \ascii/LineCount[5] ,
    \ascii/LineCount[4] ,
    \ascii/LineCount[3] ,
    \ascii/LineCount[2] ,
    \ascii/LineCount[1] ,
    \ascii/LineCount[0] ,
    \ascii/bit_counter[3] ,
    \ascii/bit_counter[2] ,
    \ascii/bit_counter[1] ,
    \ascii/bit_counter[0] ,
    \ascii/rom_addr[11] ,
    \ascii/rom_addr[10] ,
    \ascii/rom_addr[9] ,
    \ascii/rom_addr[8] ,
    \ascii/rom_addr[7] ,
    \ascii/rom_addr[6] ,
    \ascii/rom_addr[5] ,
    \ascii/rom_addr[4] ,
    \ascii/rom_addr[3] ,
    \ascii/rom_addr[2] ,
    \ascii/rom_addr[1] ,
    \ascii/rom_addr[0] ,
    \ascii/rom_dout[7] ,
    \ascii/rom_dout[6] ,
    \ascii/rom_dout[5] ,
    \ascii/rom_dout[4] ,
    \ascii/rom_dout[3] ,
    \ascii/rom_dout[2] ,
    \ascii/rom_dout[1] ,
    \ascii/rom_dout[0] ,
    \ascii/ascii_row[7] ,
    \ascii/ascii_row[6] ,
    \ascii/ascii_row[5] ,
    \ascii/ascii_row[4] ,
    \ascii/ascii_row[3] ,
    \ascii/ascii_row[2] ,
    \ascii/ascii_row[1] ,
    \ascii/ascii_row[0] ,
    \ascii/number_of_column[6] ,
    \ascii/number_of_column[5] ,
    \ascii/number_of_column[4] ,
    \ascii/number_of_column[3] ,
    \ascii/number_of_column[2] ,
    \ascii/number_of_column[1] ,
    \ascii/number_of_column[0] ,
    CLK_PIX,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \ascii/MemoryClk ;
input \ascii/start ;
input \ascii/LCD_DE ;
input \LCD_B[4] ;
input \LCD_B[3] ;
input \LCD_B[2] ;
input \LCD_B[1] ;
input \LCD_B[0] ;
input \ascii/PixelCount[16] ;
input \ascii/PixelCount[15] ;
input \ascii/PixelCount[14] ;
input \ascii/PixelCount[13] ;
input \ascii/PixelCount[12] ;
input \ascii/PixelCount[11] ;
input \ascii/PixelCount[10] ;
input \ascii/PixelCount[9] ;
input \ascii/PixelCount[8] ;
input \ascii/PixelCount[7] ;
input \ascii/PixelCount[6] ;
input \ascii/PixelCount[5] ;
input \ascii/PixelCount[4] ;
input \ascii/PixelCount[3] ;
input \ascii/PixelCount[2] ;
input \ascii/PixelCount[1] ;
input \ascii/PixelCount[0] ;
input \ascii/LineCount[16] ;
input \ascii/LineCount[15] ;
input \ascii/LineCount[14] ;
input \ascii/LineCount[13] ;
input \ascii/LineCount[12] ;
input \ascii/LineCount[11] ;
input \ascii/LineCount[10] ;
input \ascii/LineCount[9] ;
input \ascii/LineCount[8] ;
input \ascii/LineCount[7] ;
input \ascii/LineCount[6] ;
input \ascii/LineCount[5] ;
input \ascii/LineCount[4] ;
input \ascii/LineCount[3] ;
input \ascii/LineCount[2] ;
input \ascii/LineCount[1] ;
input \ascii/LineCount[0] ;
input \ascii/bit_counter[3] ;
input \ascii/bit_counter[2] ;
input \ascii/bit_counter[1] ;
input \ascii/bit_counter[0] ;
input \ascii/rom_addr[11] ;
input \ascii/rom_addr[10] ;
input \ascii/rom_addr[9] ;
input \ascii/rom_addr[8] ;
input \ascii/rom_addr[7] ;
input \ascii/rom_addr[6] ;
input \ascii/rom_addr[5] ;
input \ascii/rom_addr[4] ;
input \ascii/rom_addr[3] ;
input \ascii/rom_addr[2] ;
input \ascii/rom_addr[1] ;
input \ascii/rom_addr[0] ;
input \ascii/rom_dout[7] ;
input \ascii/rom_dout[6] ;
input \ascii/rom_dout[5] ;
input \ascii/rom_dout[4] ;
input \ascii/rom_dout[3] ;
input \ascii/rom_dout[2] ;
input \ascii/rom_dout[1] ;
input \ascii/rom_dout[0] ;
input \ascii/ascii_row[7] ;
input \ascii/ascii_row[6] ;
input \ascii/ascii_row[5] ;
input \ascii/ascii_row[4] ;
input \ascii/ascii_row[3] ;
input \ascii/ascii_row[2] ;
input \ascii/ascii_row[1] ;
input \ascii/ascii_row[0] ;
input \ascii/number_of_column[6] ;
input \ascii/number_of_column[5] ;
input \ascii/number_of_column[4] ;
input \ascii/number_of_column[3] ;
input \ascii/number_of_column[2] ;
input \ascii/number_of_column[1] ;
input \ascii/number_of_column[0] ;
input CLK_PIX;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \ascii/MemoryClk ;
wire \ascii/start ;
wire \ascii/LCD_DE ;
wire \LCD_B[4] ;
wire \LCD_B[3] ;
wire \LCD_B[2] ;
wire \LCD_B[1] ;
wire \LCD_B[0] ;
wire \ascii/PixelCount[16] ;
wire \ascii/PixelCount[15] ;
wire \ascii/PixelCount[14] ;
wire \ascii/PixelCount[13] ;
wire \ascii/PixelCount[12] ;
wire \ascii/PixelCount[11] ;
wire \ascii/PixelCount[10] ;
wire \ascii/PixelCount[9] ;
wire \ascii/PixelCount[8] ;
wire \ascii/PixelCount[7] ;
wire \ascii/PixelCount[6] ;
wire \ascii/PixelCount[5] ;
wire \ascii/PixelCount[4] ;
wire \ascii/PixelCount[3] ;
wire \ascii/PixelCount[2] ;
wire \ascii/PixelCount[1] ;
wire \ascii/PixelCount[0] ;
wire \ascii/LineCount[16] ;
wire \ascii/LineCount[15] ;
wire \ascii/LineCount[14] ;
wire \ascii/LineCount[13] ;
wire \ascii/LineCount[12] ;
wire \ascii/LineCount[11] ;
wire \ascii/LineCount[10] ;
wire \ascii/LineCount[9] ;
wire \ascii/LineCount[8] ;
wire \ascii/LineCount[7] ;
wire \ascii/LineCount[6] ;
wire \ascii/LineCount[5] ;
wire \ascii/LineCount[4] ;
wire \ascii/LineCount[3] ;
wire \ascii/LineCount[2] ;
wire \ascii/LineCount[1] ;
wire \ascii/LineCount[0] ;
wire \ascii/bit_counter[3] ;
wire \ascii/bit_counter[2] ;
wire \ascii/bit_counter[1] ;
wire \ascii/bit_counter[0] ;
wire \ascii/rom_addr[11] ;
wire \ascii/rom_addr[10] ;
wire \ascii/rom_addr[9] ;
wire \ascii/rom_addr[8] ;
wire \ascii/rom_addr[7] ;
wire \ascii/rom_addr[6] ;
wire \ascii/rom_addr[5] ;
wire \ascii/rom_addr[4] ;
wire \ascii/rom_addr[3] ;
wire \ascii/rom_addr[2] ;
wire \ascii/rom_addr[1] ;
wire \ascii/rom_addr[0] ;
wire \ascii/rom_dout[7] ;
wire \ascii/rom_dout[6] ;
wire \ascii/rom_dout[5] ;
wire \ascii/rom_dout[4] ;
wire \ascii/rom_dout[3] ;
wire \ascii/rom_dout[2] ;
wire \ascii/rom_dout[1] ;
wire \ascii/rom_dout[0] ;
wire \ascii/ascii_row[7] ;
wire \ascii/ascii_row[6] ;
wire \ascii/ascii_row[5] ;
wire \ascii/ascii_row[4] ;
wire \ascii/ascii_row[3] ;
wire \ascii/ascii_row[2] ;
wire \ascii/ascii_row[1] ;
wire \ascii/ascii_row[0] ;
wire \ascii/number_of_column[6] ;
wire \ascii/number_of_column[5] ;
wire \ascii/number_of_column[4] ;
wire \ascii/number_of_column[3] ;
wire \ascii/number_of_column[2] ;
wire \ascii/number_of_column[1] ;
wire \ascii/number_of_column[0] ;
wire CLK_PIX;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top u_ao_top(
    .control(control0[9:0]),
    .data_i({\ascii/MemoryClk ,\ascii/start ,\ascii/LCD_DE ,\LCD_B[4] ,\LCD_B[3] ,\LCD_B[2] ,\LCD_B[1] ,\LCD_B[0] ,\ascii/PixelCount[16] ,\ascii/PixelCount[15] ,\ascii/PixelCount[14] ,\ascii/PixelCount[13] ,\ascii/PixelCount[12] ,\ascii/PixelCount[11] ,\ascii/PixelCount[10] ,\ascii/PixelCount[9] ,\ascii/PixelCount[8] ,\ascii/PixelCount[7] ,\ascii/PixelCount[6] ,\ascii/PixelCount[5] ,\ascii/PixelCount[4] ,\ascii/PixelCount[3] ,\ascii/PixelCount[2] ,\ascii/PixelCount[1] ,\ascii/PixelCount[0] ,\ascii/LineCount[16] ,\ascii/LineCount[15] ,\ascii/LineCount[14] ,\ascii/LineCount[13] ,\ascii/LineCount[12] ,\ascii/LineCount[11] ,\ascii/LineCount[10] ,\ascii/LineCount[9] ,\ascii/LineCount[8] ,\ascii/LineCount[7] ,\ascii/LineCount[6] ,\ascii/LineCount[5] ,\ascii/LineCount[4] ,\ascii/LineCount[3] ,\ascii/LineCount[2] ,\ascii/LineCount[1] ,\ascii/LineCount[0] ,\ascii/bit_counter[3] ,\ascii/bit_counter[2] ,\ascii/bit_counter[1] ,\ascii/bit_counter[0] ,\ascii/rom_addr[11] ,\ascii/rom_addr[10] ,\ascii/rom_addr[9] ,\ascii/rom_addr[8] ,\ascii/rom_addr[7] ,\ascii/rom_addr[6] ,\ascii/rom_addr[5] ,\ascii/rom_addr[4] ,\ascii/rom_addr[3] ,\ascii/rom_addr[2] ,\ascii/rom_addr[1] ,\ascii/rom_addr[0] ,\ascii/rom_dout[7] ,\ascii/rom_dout[6] ,\ascii/rom_dout[5] ,\ascii/rom_dout[4] ,\ascii/rom_dout[3] ,\ascii/rom_dout[2] ,\ascii/rom_dout[1] ,\ascii/rom_dout[0] ,\ascii/ascii_row[7] ,\ascii/ascii_row[6] ,\ascii/ascii_row[5] ,\ascii/ascii_row[4] ,\ascii/ascii_row[3] ,\ascii/ascii_row[2] ,\ascii/ascii_row[1] ,\ascii/ascii_row[0] ,\ascii/number_of_column[6] ,\ascii/number_of_column[5] ,\ascii/number_of_column[4] ,\ascii/number_of_column[3] ,\ascii/number_of_column[2] ,\ascii/number_of_column[1] ,\ascii/number_of_column[0] }),
    .clk_i(CLK_PIX)
);

endmodule
