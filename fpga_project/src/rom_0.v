module rom_0
(
	input reg [11:0]	ad_i,
	output reg [7:0]	dout_o
);

	always_comb begin
		unique case (ad_i)
			12'd1207:   dout_o = 8'h41;
			12'd1208:   dout_o = 8'h73;
			12'd1209:   dout_o = 8'h63;
			12'd1210:   dout_o = 8'h69;
			12'd1211:   dout_o = 8'h69;
			12'd1212:   dout_o = 8'h20;
			12'd1213:   dout_o = 8'h6e;
			12'd1214:   dout_o = 8'h61;
			12'd1215:   dout_o = 8'h20;
			12'd1216:   dout_o = 8'h65;
			12'd1217:   dout_o = 8'h6b;
			12'd1218:   dout_o = 8'h72;
			12'd1219:   dout_o = 8'h61;
			12'd1220:   dout_o = 8'h6e;
			12'd1221:   dout_o = 8'h75;
			12'd1222:   dout_o = 8'h21;
			12'd1223:   dout_o = 8'h20;
			12'd1224:   dout_o = 8'h47;
			12'd1225:   dout_o = 8'h69;
			12'd1226:   dout_o = 8'h74;
			12'd1227:   dout_o = 8'h68;
			12'd1228:   dout_o = 8'h75;
			12'd1229:   dout_o = 8'h62;
			12'd1230:   dout_o = 8'h20;
			12'd1231:   dout_o = 8'h2d;
			12'd1232:   dout_o = 8'h20;
			12'd1233:   dout_o = 8'h4a;
			12'd1234:   dout_o = 8'h75;
			12'd1235:   dout_o = 8'h6e;
			12'd1236:   dout_o = 8'h69;
			12'd1237:   dout_o = 8'h6e;
			12'd1238:   dout_o = 8'h68;
			12'd1239:   dout_o = 8'h6f;
			12'd1240:   dout_o = 8'h39;
			12'd1241:   dout_o = 8'h39;
			default: dout_o = '0;
		endcase
	end
endmodule
