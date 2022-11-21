

module reveal_coretop(
    clk,
    reset_n,
    trigger_din,
    jtck,
    jtdi,
    jshift,
    jupdate,
    jrstn,
    jce2,
    ip_enable0,
    er2_tdo0,
    trigger_en,
    
    trace_din
)/* synthesis syn_hier="hard" */;

///////// PARAMETERS for IO port///////////////
parameter NUM_CORES   = 1;
parameter TOTAL_TRIGGER_DIN= 1;
parameter TOTAL_TRACE_DIN= 387;

///////// IO port define //////////
input  [NUM_CORES-1:0] clk;
input  [NUM_CORES-1:0] reset_n;

input  [TOTAL_TRIGGER_DIN-1:0] trigger_din;
input  [TOTAL_TRACE_DIN -1:0] trace_din;

// other io ports defines, including the triggered out signals
input jtck, jtdi, jshift, jupdate, jrstn, jce2;
input ip_enable0;
output er2_tdo0;
input [0:0] trigger_en;



/// wires for interconnection ///
wire [NUM_CORES-1:0] trigger_out;
wire [386:0] trace_din_net;
wire [0:0] trigger_din_net;

assign trace_din_net[0] = trace_din[0];
assign trace_din_net[1] = trace_din[1];
assign trace_din_net[2] = trace_din[2];
assign trace_din_net[3] = trace_din[3];
assign trace_din_net[4] = trace_din[4];
assign trace_din_net[5] = trace_din[5];
assign trace_din_net[6] = trace_din[6];
assign trace_din_net[7] = trace_din[7];
assign trace_din_net[8] = trace_din[8];
assign trace_din_net[9] = trace_din[9];
assign trace_din_net[10] = trace_din[10];
assign trace_din_net[11] = trace_din[11];
assign trace_din_net[12] = trace_din[12];
assign trace_din_net[13] = trace_din[13];
assign trace_din_net[14] = trace_din[14];
assign trace_din_net[15] = trace_din[15];
assign trace_din_net[16] = trace_din[16];
assign trace_din_net[17] = trace_din[17];
assign trace_din_net[18] = trace_din[18];
assign trace_din_net[19] = trace_din[19];
assign trace_din_net[20] = trace_din[20];
assign trace_din_net[21] = trace_din[21];
assign trace_din_net[22] = trace_din[22];
assign trace_din_net[23] = trace_din[23];
assign trace_din_net[24] = trace_din[24];
assign trace_din_net[25] = trace_din[25];
assign trace_din_net[26] = trace_din[26];
assign trace_din_net[27] = trace_din[27];
assign trace_din_net[28] = trace_din[28];
assign trace_din_net[29] = trace_din[29];
assign trace_din_net[30] = trace_din[30];
assign trace_din_net[31] = trace_din[31];
assign trace_din_net[32] = trace_din[32];
assign trace_din_net[33] = trace_din[33];
assign trace_din_net[34] = trace_din[34];
assign trace_din_net[35] = trace_din[35];
assign trace_din_net[36] = trace_din[36];
assign trace_din_net[37] = trace_din[37];
assign trace_din_net[38] = trace_din[38];
assign trace_din_net[39] = trace_din[39];
assign trace_din_net[40] = trace_din[40];
assign trace_din_net[41] = trace_din[41];
assign trace_din_net[42] = trace_din[42];
assign trace_din_net[43] = trace_din[43];
assign trace_din_net[44] = trace_din[44];
assign trace_din_net[45] = trace_din[45];
assign trace_din_net[46] = trace_din[46];
assign trace_din_net[47] = trace_din[47];
assign trace_din_net[48] = trace_din[48];
assign trace_din_net[49] = trace_din[49];
assign trace_din_net[50] = trace_din[50];
assign trace_din_net[51] = trace_din[51];
assign trace_din_net[52] = trace_din[52];
assign trace_din_net[53] = trace_din[53];
assign trace_din_net[54] = trace_din[54];
assign trace_din_net[55] = trace_din[55];
assign trace_din_net[56] = trace_din[56];
assign trace_din_net[57] = trace_din[57];
assign trace_din_net[58] = trace_din[58];
assign trace_din_net[59] = trace_din[59];
assign trace_din_net[60] = trace_din[60];
assign trace_din_net[61] = trace_din[61];
assign trace_din_net[62] = trace_din[62];
assign trace_din_net[63] = trace_din[63];
assign trace_din_net[64] = trace_din[64];
assign trace_din_net[65] = trace_din[65];
assign trace_din_net[66] = trace_din[66];
assign trace_din_net[67] = trace_din[67];
assign trace_din_net[68] = trace_din[68];
assign trace_din_net[69] = trace_din[69];
assign trace_din_net[70] = trace_din[70];
assign trace_din_net[71] = trace_din[71];
assign trace_din_net[72] = trace_din[72];
assign trace_din_net[73] = trace_din[73];
assign trace_din_net[74] = trace_din[74];
assign trace_din_net[75] = trace_din[75];
assign trace_din_net[76] = trace_din[76];
assign trace_din_net[77] = trace_din[77];
assign trace_din_net[78] = trace_din[78];
assign trace_din_net[79] = trace_din[79];
assign trace_din_net[80] = trace_din[80];
assign trace_din_net[81] = trace_din[81];
assign trace_din_net[82] = trace_din[82];
assign trace_din_net[83] = trace_din[83];
assign trace_din_net[84] = trace_din[84];
assign trace_din_net[85] = trace_din[85];
assign trace_din_net[86] = trace_din[86];
assign trace_din_net[87] = trace_din[87];
assign trace_din_net[88] = trace_din[88];
assign trace_din_net[89] = trace_din[89];
assign trace_din_net[90] = trace_din[90];
assign trace_din_net[91] = trace_din[91];
assign trace_din_net[92] = trace_din[92];
assign trace_din_net[93] = trace_din[93];
assign trace_din_net[94] = trace_din[94];
assign trace_din_net[95] = trace_din[95];
assign trace_din_net[96] = trace_din[96];
assign trace_din_net[97] = trace_din[97];
assign trace_din_net[98] = trace_din[98];
assign trace_din_net[99] = trace_din[99];
assign trace_din_net[100] = trace_din[100];
assign trace_din_net[101] = trace_din[101];
assign trace_din_net[102] = trace_din[102];
assign trace_din_net[103] = trace_din[103];
assign trace_din_net[104] = trace_din[104];
assign trace_din_net[105] = trace_din[105];
assign trace_din_net[106] = trace_din[106];
assign trace_din_net[107] = trace_din[107];
assign trace_din_net[108] = trace_din[108];
assign trace_din_net[109] = trace_din[109];
assign trace_din_net[110] = trace_din[110];
assign trace_din_net[111] = trace_din[111];
assign trace_din_net[112] = trace_din[112];
assign trace_din_net[113] = trace_din[113];
assign trace_din_net[114] = trace_din[114];
assign trace_din_net[115] = trace_din[115];
assign trace_din_net[116] = trace_din[116];
assign trace_din_net[117] = trace_din[117];
assign trace_din_net[118] = trace_din[118];
assign trace_din_net[119] = trace_din[119];
assign trace_din_net[120] = trace_din[120];
assign trace_din_net[121] = trace_din[121];
assign trace_din_net[122] = trace_din[122];
assign trace_din_net[123] = trace_din[123];
assign trace_din_net[124] = trace_din[124];
assign trace_din_net[125] = trace_din[125];
assign trace_din_net[126] = trace_din[126];
assign trace_din_net[127] = trace_din[127];
assign trace_din_net[128] = trace_din[128];
assign trace_din_net[129] = trace_din[129];
assign trace_din_net[130] = trace_din[130];
assign trace_din_net[131] = trace_din[131];
assign trace_din_net[132] = trace_din[132];
assign trace_din_net[133] = trace_din[133];
assign trace_din_net[134] = trace_din[134];
assign trace_din_net[135] = trace_din[135];
assign trace_din_net[136] = trace_din[136];
assign trace_din_net[137] = trace_din[137];
assign trace_din_net[138] = trace_din[138];
assign trace_din_net[139] = trace_din[139];
assign trace_din_net[140] = trace_din[140];
assign trace_din_net[141] = trace_din[141];
assign trace_din_net[142] = trace_din[142];
assign trace_din_net[143] = trace_din[143];
assign trace_din_net[144] = trace_din[144];
assign trace_din_net[145] = trace_din[145];
assign trace_din_net[146] = trace_din[146];
assign trace_din_net[147] = trace_din[147];
assign trace_din_net[148] = trace_din[148];
assign trace_din_net[149] = trace_din[149];
assign trace_din_net[150] = trace_din[150];
assign trace_din_net[151] = trace_din[151];
assign trace_din_net[152] = trace_din[152];
assign trace_din_net[153] = trace_din[153];
assign trace_din_net[154] = trace_din[154];
assign trace_din_net[155] = trace_din[155];
assign trace_din_net[156] = trace_din[156];
assign trace_din_net[157] = trace_din[157];
assign trace_din_net[158] = trace_din[158];
assign trace_din_net[159] = trace_din[159];
assign trace_din_net[160] = trace_din[160];
assign trace_din_net[161] = trace_din[161];
assign trace_din_net[162] = trace_din[162];
assign trace_din_net[163] = trace_din[163];
assign trace_din_net[164] = trace_din[164];
assign trace_din_net[165] = trace_din[165];
assign trace_din_net[166] = trace_din[166];
assign trace_din_net[167] = trace_din[167];
assign trace_din_net[168] = trace_din[168];
assign trace_din_net[169] = trace_din[169];
assign trace_din_net[170] = trace_din[170];
assign trace_din_net[171] = trace_din[171];
assign trace_din_net[172] = trace_din[172];
assign trace_din_net[173] = trace_din[173];
assign trace_din_net[174] = trace_din[174];
assign trace_din_net[175] = trace_din[175];
assign trace_din_net[176] = trace_din[176];
assign trace_din_net[177] = trace_din[177];
assign trace_din_net[178] = trace_din[178];
assign trace_din_net[179] = trace_din[179];
assign trace_din_net[180] = trace_din[180];
assign trace_din_net[181] = trace_din[181];
assign trace_din_net[182] = trace_din[182];
assign trace_din_net[183] = trace_din[183];
assign trace_din_net[184] = trace_din[184];
assign trace_din_net[185] = trace_din[185];
assign trace_din_net[186] = trace_din[186];
assign trace_din_net[187] = trace_din[187];
assign trace_din_net[188] = trace_din[188];
assign trace_din_net[189] = trace_din[189];
assign trace_din_net[190] = trace_din[190];
assign trace_din_net[191] = trace_din[191];
assign trace_din_net[192] = trace_din[192];
assign trace_din_net[193] = trace_din[193];
assign trace_din_net[194] = trace_din[194];
assign trace_din_net[195] = trace_din[195];
assign trace_din_net[196] = trace_din[196];
assign trace_din_net[197] = trace_din[197];
assign trace_din_net[198] = trace_din[198];
assign trace_din_net[199] = trace_din[199];
assign trace_din_net[200] = trace_din[200];
assign trace_din_net[201] = trace_din[201];
assign trace_din_net[202] = trace_din[202];
assign trace_din_net[203] = trace_din[203];
assign trace_din_net[204] = trace_din[204];
assign trace_din_net[205] = trace_din[205];
assign trace_din_net[206] = trace_din[206];
assign trace_din_net[207] = trace_din[207];
assign trace_din_net[208] = trace_din[208];
assign trace_din_net[209] = trace_din[209];
assign trace_din_net[210] = trace_din[210];
assign trace_din_net[211] = trace_din[211];
assign trace_din_net[212] = trace_din[212];
assign trace_din_net[213] = trace_din[213];
assign trace_din_net[214] = trace_din[214];
assign trace_din_net[215] = trace_din[215];
assign trace_din_net[216] = trace_din[216];
assign trace_din_net[217] = trace_din[217];
assign trace_din_net[218] = trace_din[218];
assign trace_din_net[219] = trace_din[219];
assign trace_din_net[220] = trace_din[220];
assign trace_din_net[221] = trace_din[221];
assign trace_din_net[222] = trace_din[222];
assign trace_din_net[223] = trace_din[223];
assign trace_din_net[224] = trace_din[224];
assign trace_din_net[225] = trace_din[225];
assign trace_din_net[226] = trace_din[226];
assign trace_din_net[227] = trace_din[227];
assign trace_din_net[228] = trace_din[228];
assign trace_din_net[229] = trace_din[229];
assign trace_din_net[230] = trace_din[230];
assign trace_din_net[231] = trace_din[231];
assign trace_din_net[232] = trace_din[232];
assign trace_din_net[233] = trace_din[233];
assign trace_din_net[234] = trace_din[234];
assign trace_din_net[235] = trace_din[235];
assign trace_din_net[236] = trace_din[236];
assign trace_din_net[237] = trace_din[237];
assign trace_din_net[238] = trace_din[238];
assign trace_din_net[239] = trace_din[239];
assign trace_din_net[240] = trace_din[240];
assign trace_din_net[241] = trace_din[241];
assign trace_din_net[242] = trace_din[242];
assign trace_din_net[243] = trace_din[243];
assign trace_din_net[244] = trace_din[244];
assign trace_din_net[245] = trace_din[245];
assign trace_din_net[246] = trace_din[246];
assign trace_din_net[247] = trace_din[247];
assign trace_din_net[248] = trace_din[248];
assign trace_din_net[249] = trace_din[249];
assign trace_din_net[250] = trace_din[250];
assign trace_din_net[251] = trace_din[251];
assign trace_din_net[252] = trace_din[252];
assign trace_din_net[253] = trace_din[253];
assign trace_din_net[254] = trace_din[254];
assign trace_din_net[255] = trace_din[255];
assign trace_din_net[256] = trace_din[256];
assign trace_din_net[257] = trace_din[257];
assign trace_din_net[258] = trace_din[258];
assign trace_din_net[259] = trace_din[259];
assign trace_din_net[260] = trace_din[260];
assign trace_din_net[261] = trace_din[261];
assign trace_din_net[262] = trace_din[262];
assign trace_din_net[263] = trace_din[263];
assign trace_din_net[264] = trace_din[264];
assign trace_din_net[265] = trace_din[265];
assign trace_din_net[266] = trace_din[266];
assign trace_din_net[267] = trace_din[267];
assign trace_din_net[268] = trace_din[268];
assign trace_din_net[269] = trace_din[269];
assign trace_din_net[270] = trace_din[270];
assign trace_din_net[271] = trace_din[271];
assign trace_din_net[272] = trace_din[272];
assign trace_din_net[273] = trace_din[273];
assign trace_din_net[274] = trace_din[274];
assign trace_din_net[275] = trace_din[275];
assign trace_din_net[276] = trace_din[276];
assign trace_din_net[277] = trace_din[277];
assign trace_din_net[278] = trace_din[278];
assign trace_din_net[279] = trace_din[279];
assign trace_din_net[280] = trace_din[280];
assign trace_din_net[281] = trace_din[281];
assign trace_din_net[282] = trace_din[282];
assign trace_din_net[283] = trace_din[283];
assign trace_din_net[284] = trace_din[284];
assign trace_din_net[285] = trace_din[285];
assign trace_din_net[286] = trace_din[286];
assign trace_din_net[287] = trace_din[287];
assign trace_din_net[288] = trace_din[288];
assign trace_din_net[289] = trace_din[289];
assign trace_din_net[290] = trace_din[290];
assign trace_din_net[291] = trace_din[291];
assign trace_din_net[292] = trace_din[292];
assign trace_din_net[293] = trace_din[293];
assign trace_din_net[294] = trace_din[294];
assign trace_din_net[295] = trace_din[295];
assign trace_din_net[296] = trace_din[296];
assign trace_din_net[297] = trace_din[297];
assign trace_din_net[298] = trace_din[298];
assign trace_din_net[299] = trace_din[299];
assign trace_din_net[300] = trace_din[300];
assign trace_din_net[301] = trace_din[301];
assign trace_din_net[302] = trace_din[302];
assign trace_din_net[303] = trace_din[303];
assign trace_din_net[304] = trace_din[304];
assign trace_din_net[305] = trace_din[305];
assign trace_din_net[306] = trace_din[306];
assign trace_din_net[307] = trace_din[307];
assign trace_din_net[308] = trace_din[308];
assign trace_din_net[309] = trace_din[309];
assign trace_din_net[310] = trace_din[310];
assign trace_din_net[311] = trace_din[311];
assign trace_din_net[312] = trace_din[312];
assign trace_din_net[313] = trace_din[313];
assign trace_din_net[314] = trace_din[314];
assign trace_din_net[315] = trace_din[315];
assign trace_din_net[316] = trace_din[316];
assign trace_din_net[317] = trace_din[317];
assign trace_din_net[318] = trace_din[318];
assign trace_din_net[319] = trace_din[319];
assign trace_din_net[320] = trace_din[320];
assign trace_din_net[321] = trace_din[321];
assign trace_din_net[322] = trace_din[322];
assign trace_din_net[323] = trace_din[323];
assign trace_din_net[324] = trace_din[324];
assign trace_din_net[325] = trace_din[325];
assign trace_din_net[326] = trace_din[326];
assign trace_din_net[327] = trace_din[327];
assign trace_din_net[328] = trace_din[328];
assign trace_din_net[329] = trace_din[329];
assign trace_din_net[330] = trace_din[330];
assign trace_din_net[331] = trace_din[331];
assign trace_din_net[332] = trace_din[332];
assign trace_din_net[333] = trace_din[333];
assign trace_din_net[334] = trace_din[334];
assign trace_din_net[335] = trace_din[335];
assign trace_din_net[336] = trace_din[336];
assign trace_din_net[337] = trace_din[337];
assign trace_din_net[338] = trace_din[338];
assign trace_din_net[339] = trace_din[339];
assign trace_din_net[340] = trace_din[340];
assign trace_din_net[341] = trace_din[341];
assign trace_din_net[342] = trace_din[342];
assign trace_din_net[343] = trace_din[343];
assign trace_din_net[344] = trace_din[344];
assign trace_din_net[345] = trace_din[345];
assign trace_din_net[346] = trace_din[346];
assign trace_din_net[347] = trace_din[347];
assign trace_din_net[348] = trace_din[348];
assign trace_din_net[349] = trace_din[349];
assign trace_din_net[350] = trace_din[350];
assign trace_din_net[351] = trace_din[351];
assign trace_din_net[352] = trace_din[352];
assign trace_din_net[353] = trace_din[353];
assign trace_din_net[354] = trace_din[354];
assign trace_din_net[355] = trace_din[355];
assign trace_din_net[356] = trace_din[356];
assign trace_din_net[357] = trace_din[357];
assign trace_din_net[358] = trace_din[358];
assign trace_din_net[359] = trace_din[359];
assign trace_din_net[360] = trace_din[360];
assign trace_din_net[361] = trace_din[361];
assign trace_din_net[362] = trace_din[362];
assign trace_din_net[363] = trace_din[363];
assign trace_din_net[364] = trace_din[364];
assign trace_din_net[365] = trace_din[365];
assign trace_din_net[366] = trace_din[366];
assign trace_din_net[367] = trace_din[367];
assign trace_din_net[368] = trace_din[368];
assign trace_din_net[369] = trace_din[369];
assign trace_din_net[370] = trace_din[370];
assign trace_din_net[371] = trace_din[371];
assign trace_din_net[372] = trace_din[372];
assign trace_din_net[373] = trace_din[373];
assign trace_din_net[374] = trace_din[374];
assign trace_din_net[375] = trace_din[375];
assign trace_din_net[376] = trace_din[376];
assign trace_din_net[377] = trace_din[377];
assign trace_din_net[378] = trace_din[378];
assign trace_din_net[379] = trace_din[379];
assign trace_din_net[380] = trace_din[380];
assign trace_din_net[381] = trace_din[381];
assign trace_din_net[382] = trace_din[382];
assign trace_din_net[383] = trace_din[383];
assign trace_din_net[384] = trace_din[384];
assign trace_din_net[385] = trace_din[385];
assign trace_din_net[386] = trace_din[386];


assign trigger_din_net[0] = trigger_din[0];






////// core instances //////

eval_top_la0 eval_top_la0_inst_0(
   .clk    (clk[0]),
   .reset_n    (reset_n[0]),
   .jtck    (jtck),
   .jrstn    (jrstn),
   .jce2    (jce2),
   .jtdi    (jtdi),
   .er2_tdo    (er2_tdo0),
   .jshift    (jshift),
   .jupdate    (jupdate),
   .trigger_din_0    (trigger_din_net[0:0]),
   .trace_din    (trace_din_net[386:0]),
   .trigger_en    (trigger_en[0]),
   .ip_enable    (ip_enable0)
)/*synthesis syn_noprune=1*/; 


endmodule