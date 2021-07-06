// -------------------------------------------------------------------------
//The inverse lookup table for Galois field
//下面根据matlab运算结果生成GF(2^8)的inverse
// --------------------------------------------------------------------------

module inverse(y, x);
	input [7:0] x;
	output [7:0] y;
	reg [7:0] y;

	always @ (x)
	case (x) // synopsys full_case parallel_case
   1 : y = 1; 
   2 : y = 142; 
   3 : y = 244; 
   4 : y = 71; 
   5 : y = 167; 
   6 : y = 122; 
   7 : y = 186; 
   8 : y = 173; 
   9 : y = 157; 
   10 : y = 221; 
   11 : y = 152; 
   12 : y = 61; 
   13 : y = 170; 
   14 : y = 93; 
   15 : y = 150; 
   16 : y = 216; 
   17 : y = 114; 
   18 : y = 192; 
   19 : y = 88; 
   20 : y = 224; 
   21 : y = 62; 
   22 : y = 76; 
   23 : y = 102; 
   24 : y = 144; 
   25 : y = 222; 
   26 : y = 85; 
   27 : y = 128; 
   28 : y = 160; 
   29 : y = 131; 
   30 : y = 75; 
   31 : y = 42; 
   32 : y = 108; 
   33 : y = 237; 
   34 : y = 57; 
   35 : y = 81; 
   36 : y = 96; 
   37 : y = 86; 
   38 : y = 44; 
   39 : y = 138; 
   40 : y = 112; 
   41 : y = 208; 
   42 : y = 31; 
   43 : y = 74; 
   44 : y = 38; 
   45 : y = 139; 
   46 : y = 51; 
   47 : y = 110; 
   48 : y = 72; 
   49 : y = 137; 
   50 : y = 111; 
   51 : y = 46; 
   52 : y = 164; 
   53 : y = 195; 
   54 : y = 64; 
   55 : y = 94; 
   56 : y = 80; 
   57 : y = 34; 
   58 : y = 207; 
   59 : y = 169; 
   60 : y = 171; 
   61 : y = 12; 
   62 : y = 21; 
   63 : y = 225; 
   64 : y = 54; 
   65 : y = 95; 
   66 : y = 248; 
   67 : y = 213; 
   68 : y = 146; 
   69 : y = 78; 
   70 : y = 166; 
   71 : y = 4; 
   72 : y = 48; 
   73 : y = 136; 
   74 : y = 43; 
   75 : y = 30; 
   76 : y = 22; 
   77 : y = 103; 
   78 : y = 69; 
   79 : y = 147; 
   80 : y = 56; 
   81 : y = 35; 
   82 : y = 104; 
   83 : y = 140; 
   84 : y = 129; 
   85 : y = 26; 
   86 : y = 37; 
   87 : y = 97; 
   88 : y = 19; 
   89 : y = 193; 
   90 : y = 203; 
   91 : y = 99; 
   92 : y = 151; 
   93 : y = 14; 
   94 : y = 55; 
   95 : y = 65; 
   96 : y = 36; 
   97 : y = 87; 
   98 : y = 202; 
   99 : y = 91; 
   100 : y = 185; 
   101 : y = 196; 
   102 : y = 23; 
   103 : y = 77; 
   104 : y = 82; 
   105 : y = 141; 
   106 : y = 239; 
   107 : y = 179; 
   108 : y = 32; 
   109 : y = 236; 
   110 : y = 47; 
   111 : y = 50; 
   112 : y = 40; 
   113 : y = 209; 
   114 : y = 17; 
   115 : y = 217; 
   116 : y = 233; 
   117 : y = 251; 
   118 : y = 218; 
   119 : y = 121; 
   120 : y = 219; 
   121 : y = 119; 
   122 : y = 6; 
   123 : y = 187; 
   124 : y = 132; 
   125 : y = 205; 
   126 : y = 254; 
   127 : y = 252; 
   128 : y = 27; 
   129 : y = 84; 
   130 : y = 161; 
   131 : y = 29; 
   132 : y = 124; 
   133 : y = 204; 
   134 : y = 228; 
   135 : y = 176; 
   136 : y = 73; 
   137 : y = 49; 
   138 : y = 39; 
   139 : y = 45; 
   140 : y = 83; 
   141 : y = 105; 
   142 : y = 2; 
   143 : y = 245; 
   144 : y = 24; 
   145 : y = 223; 
   146 : y = 68; 
   147 : y = 79; 
   148 : y = 155; 
   149 : y = 188; 
   150 : y = 15; 
   151 : y = 92; 
   152 : y = 11; 
   153 : y = 220; 
   154 : y = 189; 
   155 : y = 148; 
   156 : y = 172; 
   157 : y = 9; 
   158 : y = 199; 
   159 : y = 162; 
   160 : y = 28; 
   161 : y = 130; 
   162 : y = 159; 
   163 : y = 198; 
   164 : y = 52; 
   165 : y = 194; 
   166 : y = 70; 
   167 : y = 5; 
   168 : y = 206; 
   169 : y = 59; 
   170 : y = 13; 
   171 : y = 60; 
   172 : y = 156; 
   173 : y = 8; 
   174 : y = 190; 
   175 : y = 183; 
   176 : y = 135; 
   177 : y = 229; 
   178 : y = 238; 
   179 : y = 107; 
   180 : y = 235; 
   181 : y = 242; 
   182 : y = 191; 
   183 : y = 175; 
   184 : y = 197; 
   185 : y = 100; 
   186 : y = 7; 
   187 : y = 123; 
   188 : y = 149; 
   189 : y = 154; 
   190 : y = 174; 
   191 : y = 182; 
   192 : y = 18; 
   193 : y = 89; 
   194 : y = 165; 
   195 : y = 53; 
   196 : y = 101; 
   197 : y = 184; 
   198 : y = 163; 
   199 : y = 158; 
   200 : y = 210; 
   201 : y = 247; 
   202 : y = 98; 
   203 : y = 90; 
   204 : y = 133; 
   205 : y = 125; 
   206 : y = 168; 
   207 : y = 58; 
   208 : y = 41; 
   209 : y = 113; 
   210 : y = 200; 
   211 : y = 246; 
   212 : y = 249; 
   213 : y = 67; 
   214 : y = 215; 
   215 : y = 214; 
   216 : y = 16; 
   217 : y = 115; 
   218 : y = 118; 
   219 : y = 120; 
   220 : y = 153; 
   221 : y = 10; 
   222 : y = 25; 
   223 : y = 145; 
   224 : y = 20; 
   225 : y = 63; 
   226 : y = 230; 
   227 : y = 240; 
   228 : y = 134; 
   229 : y = 177; 
   230 : y = 226; 
   231 : y = 241; 
   232 : y = 250; 
   233 : y = 116; 
   234 : y = 243; 
   235 : y = 180; 
   236 : y = 109; 
   237 : y = 33; 
   238 : y = 178; 
   239 : y = 106; 
   240 : y = 227; 
   241 : y = 231; 
   242 : y = 181; 
   243 : y = 234; 
   244 : y = 3; 
   245 : y = 143; 
   246 : y = 211; 
   247 : y = 201; 
   248 : y = 66; 
   249 : y = 212; 
   250 : y = 232; 
   251 : y = 117; 
   252 : y = 127; 
   253 : y = 255; 
   254 : y = 126; 
	endcase
endmodule

