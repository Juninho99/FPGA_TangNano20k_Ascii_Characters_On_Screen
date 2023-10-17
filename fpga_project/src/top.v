module TOP
(
    input			Reset_Button,
    input           User_Button,
    input           XTAL_IN,

	output			LCD_CLK,
	output			LCD_HYNC,
	output			LCD_SYNC,
	output			LCD_DEN,
	output	[4:0]	LCD_R,
	output	[5:0]	LCD_G,
	output	[4:0]	LCD_B
);

	wire		CLK_MEM;
	wire		CLK_PIX;

    Gowin_rPLL chip_pll_ascii(
        .clkout(CLK_PIX), //33MHz
        .clkoutd(CLK_MEM), //3.3MHz
        .clkin(XTAL_IN) //27MHz
    );

    ascii_table_cpp_generated	ascii
	(
		.PixelClk	(	CLK_PIX		),
        .MemoryClk  (   CLK_MEM     ),
		.LCD_DE		(	LCD_DEN	 	),
		.LCD_HSYNC	(	LCD_HYNC 	),
    	.LCD_VSYNC	(	LCD_SYNC 	),

		.LCD_B		(	LCD_B		),
		.LCD_G		(	LCD_G		),
		.LCD_R		(	LCD_R		)
	);

	assign		LCD_CLK		=	CLK_PIX;

endmodule