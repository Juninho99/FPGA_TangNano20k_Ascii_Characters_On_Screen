#include <iostream>
#include <cmath>
#include <bitset>
#include <fstream>
#include <string>
#include <cpuid.h>
#include <sstream>
#include <string>
#include <regex>

using namespace std;

int n;
string path = "C:\\Users\\Armin\\Desktop\\";

void rom_modules()
{
    std::cout << "Unesite broj recenica: ";
    std::cin >> n;
    std::cin.ignore(); // Da bismo "pojeli" prelazak u novi red nakon unosa broja n.

    std::string* sentences = new std::string[n];

    for (int i = 0; i < n; i++) {
        std::cout << "Unesite recenicu " << i + 1 << ": ";
        std::getline(std::cin, sentences[i]);
    }

    for (int i = 0; i < n; i++) {
        ofstream o(path + "Isam_slova_konacno\\fpga_project\\src\\rom_" + to_string(i) + ".v");
        o << "module rom_" + to_string(i) << endl;
        o << "(\n\tinput reg [11:0]\tad_i," << endl;
        o << "\toutput reg [7:0]\tdout_o\n);\n" << endl;
        o << "\talways_comb begin" << endl;
        o << "\t\tunique case (ad_i)" << endl;

        int brojacZaAdrese = 1185 + (79 - sentences[i].size())/2;
        for (char c : sentences[i]) {
            o << "\t\t\t12'd" << to_string(brojacZaAdrese) << ":   dout_o = 8'h" << std::hex << static_cast<int>(c) << ";" << std::dec << std::endl;
            brojacZaAdrese++;
        }
        o << "\t\t\tdefault: dout_o = '0;" << endl;
        o << "\t\tendcase" << endl;
        o << "\tend" << endl;
        o << "endmodule" << endl;
    }

    delete[] sentences;
}

void ascii_table_module()
{
    ofstream o(path + "Isam_slova_konacno\\fpga_project\\src\\ascii_table_cpp_generated.v");
    o << "module ascii_table_cpp_generated" << endl;
    o << "(\n\tinput\t\t\tPixelClk," << endl;
    o << "\tinput\t\t\tMemoryClk," << endl;
    o << "\toutput\t\t\tLCD_DE," << endl;
    o << "\toutput\t\t\tLCD_HSYNC," << endl;
    o << "\toutput\t\t\tLCD_VSYNC,\n" << endl;
    o << "\toutput\t[4:0]\tLCD_B," << endl;
    o << "\toutput\t[5:0]\tLCD_G," << endl;
    o << "\toutput\t[4:0]\tLCD_R\n);\n" << endl;

    o << "\tlocalparam      V_BackPorch = 17'd0; //6" << endl;
    o << "\tlocalparam      V_Pluse 	= 17'd5;" << endl;
    o << "\tlocalparam      HightPixel  = 17'd480;" << endl;
    o << "\tlocalparam      V_FrontPorch= 17'd45; //62\n" << endl;

    o << "\tlocalparam      H_BackPorch = 17'd0;" << endl;
    o << "\tlocalparam      H_Pluse 	= 17'd1;" << endl;
    o << "\tlocalparam      WidthPixel  = 17'd800;" << endl;
    o << "\tlocalparam      H_FrontPorch= 17'd209;\n" << endl;

    o << "\tlocalparam      PixelForHS  =   WidthPixel + H_BackPorch + H_FrontPorch;" << endl;
    o << "\tlocalparam      LineForVS   =   HightPixel + V_BackPorch + V_FrontPorch;\n" << endl;

    o << "\tlocalparam      ImageWidth  = 10'd10;" << endl;
    o << "\tlocalparam      ImageHeight = 10'd16;\n" << endl;

    o << "\tlocalparam      SignsPerRow = 10'd79;" << endl;
    o << "\tlocalparam      Rows        = 10'd30;\n" << endl;

    o << "\treg\t[16:0]\tPixelCount;" << endl;
    o << "\treg\t[16:0]\tLineCount;\n" << endl;

    o << "\treg\t[7:0]\tascii_row;" << endl;
    o << "\treg\t[3:0]\tbit_counter;" << endl;
    o << "\treg\t[6:0]\tnumber_of_column;\n" << endl;

    o << "\treg\t[11:0]\trom_addr;" << endl;
    o << "\treg\t[7:0]\trom_dout;\n" << endl;
    if (n > 1)
    {
        for(int i = 0; i < n; i++)
            o << "\treg\t[7:0]\trom_dout_" + to_string(i) + ";" << endl;

        o << "\treg\t[" + to_string(int(log2(n))) + ":0]\tindex_trazene_rijeci;\n" << endl;
    }

    o << "\tGowin_pROM_ascii promAscii(" << endl;
    o << "\t\t.dout(ascii_row)," << endl;
    o << "\t\t.clk(MemoryClk)," << endl;
    o << "\t\t.oce(1'b0)," << endl;
    o << "\t\t.ce(1'b1)," << endl;
    o << "\t\t.reset(1'b0)," << endl;
    o << "\t\t.ad(LineCount%ImageHeight + rom_dout*ImageHeight)// + rom_dout*ImageHeight\n\t);\n" << endl;

    if (n > 1)
    {
        o << "\tassign rom_dout = \tindex_trazene_rijeci == 4'd0 ? rom_dout_0 :\n";
        for(int i = 1; i < n-1; i++)
            o << "\t\t\t\t\t\tindex_trazene_rijeci == 4'd" + to_string(i) + " ? rom_dout_" + to_string(i) + " :\n";

        o << "\t\t\t\t\t\trom_dout_" + to_string(n-1) + ";\n" << endl;

        for(int i = 0; i < n; i++)
        {
            o << "\trom_" + to_string(i) + " inst_rom_" + to_string(i) + "(" << endl;
            o << "\t\t.dout_o\t(rom_dout_" + to_string(i) + ")," << endl;
            o << "\t\t.ad_i\t(rom_addr)\n\t);\n" << endl;
        }
    }
    else
    {
        o << "\trom_0 inst_rom(" << endl;
        o << "\t\t.dout_o\t(rom_dout)," << endl;
        o << "\t\t.ad_i\t(rom_addr)\n\t);\n" << endl;
    }

    o << "\treg\t\t\tstart;" << endl;
    o << "\treg\t[3:0]\tstart_clocks;\n" << endl;

    o << "\tinitial begin" << endl;
    o << "\t\tstart = 1'b0;" << endl;
    if (n > 1)
        o << "\t\tindex_trazene_rijeci = " + to_string(int(log2(n)+1)) + "'d0;" << endl;
    o << "\tend\n" << endl;

    o << "\talways @(posedge MemoryClk) begin" << endl;
    o << "\t\tstart_clocks <= start_clocks + 4'd1;" << endl;
    o << "\t\tif (start_clocks == 4'd5)" << endl;
    o << "\t\t\tstart <= 1'b1;" << endl;
    o << "\tend\n" << endl;

    o << "\talways @(posedge PixelClk) begin" << endl;
    o << "\t\tif (start == 1'b1) begin" << endl;
    o << "\t\t\tif(  LineCount  == LineForVS  && PixelCount  ==  PixelForHS) begin" << endl;
    o << "\t\t\t\tLineCount       <=  17'b0;" << endl;
    o << "\t\t\t\tPixelCount      <=  17'b0;" << endl;
    o << "\t\t\t\tend" << endl;
    o << "\t\t\telse if(  PixelCount  ==  PixelForHS ) begin" << endl;
    o << "\t\t\t\tPixelCount      <=  17'b0;" << endl;
    o << "\t\t\t\tLineCount       <=  LineCount + 1'b1;" << endl;
    o << "\t\t\t\tend" << endl;
    o << "\t\t\telse" << endl;
    o << "\t\t\t\tPixelCount      <=  PixelCount + 1'b1;\n" << endl;

    o << "\t\t\tif ( bit_counter == 4'd9) begin" << endl;
    o << "\t\t\t\tbit_counter <= 4'd0;" << endl;
    o << "\t\t\t\tend" << endl;
    o << "\t\t\telse" << endl;
    o << "\t\t\t\tbit_counter <= bit_counter + 4'd1;" << endl;
    o << "\t\tend" << endl;
    o << "\tend\n" << endl;

    o << "\talways @(posedge MemoryClk)begin" << endl;
    o << "\t\tif (start == 1'b1) begin" << endl;
    o << "\t\t\tif ( number_of_column == 7'd100 )" << endl;
    o << "\t\t\t\tnumber_of_column <= 7'd0;" << endl;
    o << "\t\t\telse" << endl;
    o << "\t\t\t\tnumber_of_column <= number_of_column + 7'd1;" << endl;
    o << "\t\tend" << endl;
    o << "\tend\n" << endl;

    o << "\tassign rom_addr = (LineCount/ImageHeight)*SignsPerRow + number_of_column;\n" << endl;

    o << "\tassign  LCD_HSYNC   = \t(( PixelCount >= H_Pluse)&&( PixelCount <= (PixelForHS-H_FrontPorch))) ? 1'b0 : 1'b1;" << endl;
    o << "\tassign  LCD_VSYNC   = \t((( LineCount  >= V_Pluse )&&( LineCount  <= (LineForVS-V_FrontPorch) )) ) ? 1'b0 : 1'b1;" << endl;
    o << "\tassign  LCD_DE      = \t( ( PixelCount >= H_BackPorch )&&" << endl;
    o << "\t\t\t\t\t\t\t( PixelCount < PixelForHS-H_FrontPorch ) &&" << endl;
    o << "\t\t\t\t\t\t\t( LineCount >= V_BackPorch ) &&" << endl;
    o << "\t\t\t\t\t\t\t( LineCount < LineForVS-V_FrontPorch ))  ? 1'b1 : 1'b0;\n" << endl;

    o << "\tassign LCD_B    = (PixelCount >= (rom_addr%SignsPerRow)*ImageWidth && PixelCount < (rom_addr%SignsPerRow)*ImageWidth + 10'd8 && LineCount >= (rom_addr/SignsPerRow)*ImageHeight && LineCount < ((rom_addr/SignsPerRow)+ 1'd1)*ImageHeight && bit_counter < 4'd8 && ascii_row[4'd7 - bit_counter] == 1'b1) ? 5'b11111 : 5'b00000;" << endl;
    o << "\tassign LCD_G    = 6'b000000;" << endl;
    o << "\tassign LCD_R    = 5'b00000;\n" << endl;

    o << "endmodule";
}


int main() {
    rom_modules();
    ascii_table_module();
    return 0;
}
