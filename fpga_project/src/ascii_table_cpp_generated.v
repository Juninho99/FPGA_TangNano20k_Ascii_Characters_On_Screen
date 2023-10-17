module ascii_table_cpp_generated
(
	input			PixelClk,
	input			MemoryClk,
	output			LCD_DE,
	output			LCD_HSYNC,
	output			LCD_VSYNC,

	output	[4:0]	LCD_B,
	output	[5:0]	LCD_G,
	output	[4:0]	LCD_R
);

	localparam      V_BackPorch = 17'd0; //6
	localparam      V_Pluse 	= 17'd5;
	localparam      HightPixel  = 17'd480;
	localparam      V_FrontPorch= 17'd45; //62

	localparam      H_BackPorch = 17'd0;
	localparam      H_Pluse 	= 17'd1;
	localparam      WidthPixel  = 17'd800;
	localparam      H_FrontPorch= 17'd209;

	localparam      PixelForHS  =   WidthPixel + H_BackPorch + H_FrontPorch;
	localparam      LineForVS   =   HightPixel + V_BackPorch + V_FrontPorch;

	localparam      ImageWidth  = 10'd10;
	localparam      ImageHeight = 10'd16;

	localparam      SignsPerRow = 10'd79;
	localparam      Rows        = 10'd30;

	reg	[16:0]	PixelCount;
	reg	[16:0]	LineCount;

	reg	[7:0]	ascii_row;
	reg	[3:0]	bit_counter;
	reg	[6:0]	number_of_column;

	reg	[11:0]	rom_addr;
	reg	[7:0]	rom_dout;

	Gowin_pROM_ascii promAscii(
		.dout(ascii_row),
		.clk(MemoryClk),
		.oce(1'b0),
		.ce(1'b1),
		.reset(1'b0),
		.ad(LineCount%ImageHeight + rom_dout*ImageHeight)// + rom_dout*ImageHeight
	);

	rom_0 inst_rom(
		.dout_o	(rom_dout),
		.ad_i	(rom_addr)
	);

	reg			start;
	reg	[3:0]	start_clocks;

	initial begin
		start = 1'b0;
	end

	always @(posedge MemoryClk) begin
		start_clocks <= start_clocks + 4'd1;
		if (start_clocks == 4'd5)
			start <= 1'b1;
	end

	always @(posedge PixelClk) begin
		if (start == 1'b1) begin
			if(  LineCount  == LineForVS  && PixelCount  ==  PixelForHS) begin
				LineCount       <=  17'b0;
				PixelCount      <=  17'b0;
				end
			else if(  PixelCount  ==  PixelForHS ) begin
				PixelCount      <=  17'b0;
				LineCount       <=  LineCount + 1'b1;
				end
			else
				PixelCount      <=  PixelCount + 1'b1;

			if ( bit_counter == 4'd9) begin
				bit_counter <= 4'd0;
				end
			else
				bit_counter <= bit_counter + 4'd1;
		end
	end

	always @(posedge MemoryClk)begin
		if (start == 1'b1) begin
			if ( number_of_column == 7'd100 )
				number_of_column <= 7'd0;
			else
				number_of_column <= number_of_column + 7'd1;
		end
	end

	assign rom_addr = (LineCount/ImageHeight)*SignsPerRow + number_of_column;

	assign  LCD_HSYNC   = 	(( PixelCount >= H_Pluse)&&( PixelCount <= (PixelForHS-H_FrontPorch))) ? 1'b0 : 1'b1;
	assign  LCD_VSYNC   = 	((( LineCount  >= V_Pluse )&&( LineCount  <= (LineForVS-V_FrontPorch) )) ) ? 1'b0 : 1'b1;
	assign  LCD_DE      = 	( ( PixelCount >= H_BackPorch )&&
							( PixelCount < PixelForHS-H_FrontPorch ) &&
							( LineCount >= V_BackPorch ) &&
							( LineCount < LineForVS-V_FrontPorch ))  ? 1'b1 : 1'b0;

	assign LCD_B    = (PixelCount >= (rom_addr%SignsPerRow)*ImageWidth && PixelCount < (rom_addr%SignsPerRow)*ImageWidth + 10'd8 && LineCount >= (rom_addr/SignsPerRow)*ImageHeight && LineCount < ((rom_addr/SignsPerRow)+ 1'd1)*ImageHeight && bit_counter < 4'd8 && ascii_row[4'd7 - bit_counter] == 1'b1) ? 5'b11111 : 5'b00000;
	assign LCD_G    = 6'b000000;
	assign LCD_R    = 5'b00000;

endmodule