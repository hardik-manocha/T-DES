`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:22 10/18/2015 
// Design Name: 
// Module Name:    tdes_dec 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tdes_dec(
input [63:0] ek1,ek2,ek3,
	 input [127:0] ct,
    output reg [127:0] pt,
    input rst,clk,
	 output reg [63:0]k1,k2,k3
    );

reg [63:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,l16,l0,l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15;
reg [63:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r210,r211,r212,r213,r214,r215,r216,l216,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l210,l211,l212,l213,l214,l215,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i210,i211,i212,i213,i214,i215;
reg [63:0] r30,r31,r32,r33,r34,r35,r36,r37,r38,r39,r310,r311,r312,r313,r314,r315,r316,l316,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l310,l311,l312,l313,l314,l315,i30,i31,i32,i33,i34,i35,i36,i37,i38,i39,i310,i311,i312,i313,i314,i315;
reg [63:0] k11,k12,k13,k14,k15,k16,k17,k18,k19,k110,k111,k112,k113,k114,k115,k21,k22,k23,k24,k25,k26,k27,k28,k29,k210,k211,k212,k213,k214,k215,k31,k32,k33,k34,k35,k36,k37,k38,k39,k310,k311,k312,k313,k314,k315;
reg [7:0]state;
reg [127:0]o1,o2;
reg b;


function [63:0]keydec;
input [63:0]a;
reg [15:0] t1,t2,t3,t4;
begin
t1=a[31:16]^a[15:0];
t2=a[31:16]^a[47:32];
t3=a[47:32]^a[63:48];
t4=t1^a[63:48];

keydec[63:48]=t4;
keydec[47:32]=t3;
keydec[31:16]=t2;
keydec[15:0]=t1;

end
endfunction


always @ (posedge clk) begin

if(rst) begin
state=0;
b=1;
end
else begin

case (state)
	
	//dec with ek3 starts
	0:begin
	l30=ct[127:64];
	r30=ct[63:0];
	if (b==1)begin
	state=8'b00000001;
	end
	else begin
	state=8'b00000000;
	end
	end
	
	1:begin
	r31=l30;
	if (b==1)begin
	state=8'b00000010;
	end
	else begin
	state=8'b00000001;
	end
	end
	
	2:begin
	i30=r30^ek3;
	if (b==1)begin
	state=8'b00000011;
	end
	else begin
	state=8'b00000010;
	end
	end
	
	3:begin
	l31=i30^r31;
	k31=keydec(ek3);
	if (b==1)begin
	state=8'b00000100;
	end
	else begin
	state=8'b00000011;
	end
	end
	
	
	4:begin
	r32=l31;
	if (b==1)begin
	state=8'b00000101;
	end
	else begin
	state=8'b00000100;
	end
	end
	
	5:begin
	i31=r31^k31;
	if (b==1)begin
	state=8'b00000110;
	end
	else begin
	state=8'b00000101;
	end
	end
	
	6:begin
	l32=i31^r32;
	k32=keydec(k31);
	if (b==1)begin
	state=8'b00000111;
	end
	else begin
	state=8'b00000110;
	end
	end
	
	
	7:begin
	r33=l32;
	if (b==1)begin
	state=8'b00001000;
	end
	else begin
	state=8'b00000111;
	end
	end
	
	8:begin
	i32=r32^k32;
	if (b==1)begin
	state=8'b00001001;
	end
	else begin
	state=8'b00001000;
	end
	end
	
	9:begin
	l33=i32^r33;
	k33=keydec(k32);
	if (b==1)begin
	state=8'b00001010;
	end
	else begin
	state=8'b00001001;
	end
	end
	
	10:begin
	r34=l33;
	if (b==1)begin
	state=8'b00001011;
	end
	else begin
	state=8'b00001010;
	end
	end
	
	11:begin
	i33=r33^k33;
	if (b==1)begin
	state=8'b00001100;
	end
	else begin
	state=8'b00001011;
	end
	end
	
	12:begin
	l34=i33^r34;
	k34=keydec(k33);
	if (b==1)begin
	state=8'b00001101;
	end
	else begin
	state=8'b00001100;
	end
	end
	
	
	13:begin
	r35=l34;
	if (b==1)begin
	state=8'b00001110;
	end
	else begin
	state=8'b00001101;
	end
	end
	
	14:begin
	i34=r34^k34;
	if (b==1)begin
	state=8'b00001111;
	end
	else begin
	state=8'b00001110;
	end
	end
	
	15:begin
	l35=i34^r35;
	k35=keydec(k34);
	if (b==1)begin
	state=8'b00010000;
	end
	else begin
	state=8'b00001111;
	end
	end
	
	
	16:begin
	r36=l35;
	if (b==1)begin
	state=8'b00010001;
	end
	else begin
	state=8'b00010000;
	end
	end
	
	17:begin
	i35=r35^k35;
	if (b==1)begin
	state=8'b00010010;
	end
	else begin
	state=8'b00010001;
	end
	end
	
	18:begin
	l36=i35^r36;
	k36=keydec(k35);
	if (b==1)begin
	state=8'b00010011;
	end
	else begin
	state=8'b00010010;
	end
	end
	
	
	19:begin
	r37=l36;
	if (b==1)begin
	state=8'b00010100;
	end
	else begin
	state=8'b00010011;
	end
	end
	
	20:begin
	i36=r36^k36;
	if (b==1)begin
	state=8'b00010101;
	end
	else begin
	state=8'b00010100;
	end
	end
	
	21:begin
	l37=i36^r37;
	k37=keydec(k36);
	if (b==1)begin
	state=8'b00010110;
	end
	else begin
	state=8'b00010101;
	end
	end
	
	
	22:begin
	r38=l37;
	if (b==1)begin
	state=8'b00010111;
	end
	else begin
	state=8'b00010110;
	end
	end
	
	23:begin
	i37=r37^k37;
	if (b==1)begin
	state=8'b00011000;
	end
	else begin
	state=8'b00010111;
	end
	end
	
	24:begin
	l38=i37^r38;
	k38=keydec(k37);
	if (b==1)begin
	state=8'b00011001;
	end
	else begin
	state=8'b00011000;
	end
	end
	
	25:begin
	r39=l38;
	if (b==1)begin
	state=8'b00011010;
	end
	else begin
	state=8'b00011001;
	end
	end
	
	26:begin
	i38=r38^k38;
	if (b==1)begin
	state=8'b00011011;
	end
	else begin
	state=8'b00011010;
	end
	end
	
	27:begin
	l39=i38^r39;
	k39=keydec(k38);
	if (b==1)begin
	state=8'b00011100;
	end
	else begin
	state=8'b00011011;
	end
	end
	
	28:begin
	r310=l39;
	if (b==1)begin
	state=8'b00011101;
	end
	else begin
	state=8'b00011100;
	end
	end
	
	29:begin
	i39=r39^k39;
	if (b==1)begin
	state=8'b00011110;
	end
	else begin
	state=8'b00011101;
	end
	end
	
	30:begin
	l310=i39^r310;
	k310=keydec(k39);
	if (b==1)begin
	state=8'b00011111;
	end
	else begin
	state=8'b00011110;
	end
	end
	
	31:begin
	r311=l310;
	if (b==1)begin
	state=8'b00100000;
	end
	else begin
	state=8'b00011111;
	end
	end
	
	32:begin
	i310=r310^k310;
	if (b==1)begin
	state=8'b00100001;
	end
	else begin
	state=8'b00100000;
	end
	end
	
	33:begin
	l311=i310^r311;
	k311=keydec(k310);
	if (b==1)begin
	state=8'b00100010;
	end
	else begin
	state=8'b00100001;
	end
	end
	
	
	34:begin
	r312=l311;
	if (b==1)begin
	state=8'b00100011;
	end
	else begin
	state=8'b00100010;
	end
	end
	
	35:begin
	i311=r311^k311;
	if (b==1)begin
	state=8'b00100100;
	end
	else begin
	state=8'b00100011;
	end
	end
	
	36:begin
	l312=i311^r312;
	k312=keydec(k311);
	if (b==1)begin
	state=8'b00100101;
	end
	else begin
	state=8'b00100100;
	end
	end
	
	37:begin
	r313=l312;
	if (b==1)begin
	state=8'b00100110;
	end
	else begin
	state=8'b00100101;
	end
	end
	
	38:begin
	i312=r312^k312;
	if (b==1)begin
	state=8'b00100111;
	end
	else begin
	state=8'b00100110;
	end
	end
	
	39:begin
	l313=i312^r313;
	k313=keydec(k312);
	if (b==1)begin
	state=8'b00101000;
	end
	else begin
	state=8'b00100111;
	end
	end
	
	
	40:begin
	r314=l313;
	if (b==1)begin
	state=8'b00101001;
	end
	else begin
	state=8'b00101000;
	end
	end
	
	41:begin
	i313=r313^k313;
	if (b==1)begin
	state=8'b00101010;
	end
	else begin
	state=8'b00101001;
	end
	end
	
	42:begin
	l314=i313^r314;
	k314=keydec(k313);
	if (b==1)begin
	state=8'b00101011;
	end
	else begin
	state=8'b00101010;
	end
	end
	
	
	43:begin
	r315=l314;
	if (b==1)begin
	state=8'b00101100;
	end
	else begin
	state=8'b00101011;
	end
	end
	
	44:begin
	i314=r314^k314;
	if (b==1)begin
	state=8'b00101101;
	end
	else begin
	state=8'b00101100;
	end
	end
	
	45:begin
	l315=i314^r315;
	k315=keydec(k314);
	if (b==1)begin
	state=8'b00101110;
	end
	else begin
	state=8'b00101101;
	end
	end
	
	
	46:begin
	r316=l315;
	if (b==1)begin
	state=8'b00101111;
	end
	else begin
	state=8'b00101110;
	end
	end
	
	47:begin
	i315=r315^k315;
	if (b==1)begin
	state=8'b00110000;
	end
	else begin
	state=8'b00101111;
	end
	end
	
	48:begin
	l316=i315^r316;
	if (b==1)begin
	state=8'b00110001;
	end
	else begin
	state=8'b00110000;
	end
	end
	
	49:begin
	k3=k315;
	o1[127:64]=l316;
	o1[63:0]=r316;
	if (b==1)begin
	state=8'b00110010;
	end
	else begin
	state=8'b00110001;
	end
	end
	//dec with ek3 completes
	
	
	//enc with ek2 starts here
	50:begin
	l20=o1[127:64];
	r20=o1[63:0];
	if (b==1)begin
	state=8'b00110011;
	end
	else begin
	state=8'b00110010;
	end
	end
	
	51:begin
	i20=r20^ek2;
	if (b==1)begin
	state=8'b00110100;
	end
	else begin
	state=8'b00110011;
	end
	end
	
	52:begin
	r21=l20^i20;
	l21=r20;
	if (b==1)begin
	state=8'b00110101;
	end
	else begin
	state=8'b00110100;
	end
	end
	
	53:begin
	k21=keydec(ek2);
	if (b==1)begin
	state=8'b00110110;
	end
	else begin
	state=8'b00110101;
	end
	end
	
	54:begin
	i21=r21^k21;
	if (b==1)begin
	state=8'b00110111;
	end
	else begin
	state=8'b00110110;
	end
	end
	
	55:begin
	r22=l21^i21;
	l22=r21;
	if (b==1)begin
	state=8'b00111000;
	end
	else begin
	state=8'b00110111;
	end
	end
	
	56:begin
	k22=keydec(k21);
	if (b==1)begin
	state=8'b00111001;
	end
	else begin
	state=8'b00111000;
	end
	end
	
	57:begin
	i22=r22^k22;
	if (b==1)begin
	state=8'b00111010;
	end
	else begin
	state=8'b00111001;
	end
	end
	
	58:begin
	r23=l22^i22;
	l23=r22;
	if (b==1)begin
	state=8'b00111011;
	end
	else begin
	state=8'b00111010;
	end
	end
	
	59:begin
	k23=keydec(k22);
	if (b==1)begin
	state=8'b00111100;
	end
	else begin
	state=8'b00111011;
	end
	end
	
	60:begin
	i23=r23^k23;
	if (b==1)begin
	state=8'b00111101;
	end
	else begin
	state=8'b00111100;
	end
	end
	
	61:begin
	r24=l23^i23;
	l24=r23;
	if (b==1)begin
	state=8'b00111110;
	end
	else begin
	state=8'b00111101;
	end
	end
	
	62:begin
	k24=keydec(k23);
	if (b==1)begin
	state=8'b00111111;
	end
	else begin
	state=8'b00111110;
	end
	end
	
	63:begin
	i24=r24^k24;
	if (b==1)begin
	state=8'b01000000;
	end
	else begin
	state=8'b00111111;
	end
	end
	
	64:begin
	r25=l24^i24;
	l25=r24;
	if (b==1)begin
	state=8'b01000001;
	end
	else begin
	state=8'b01000000;
	end
	end
	
	65:begin
	k25=keydec(k24);
	if (b==1)begin
	state=8'b01000010;
	end
	else begin
	state=8'b01000001;
	end
	end
	
	66:begin
	i25=r25^k25;
	if (b==1)begin
	state=8'b01000011;
	end
	else begin
	state=8'b01000010;
	end
	end
	
	67:begin
	r26=l25^i25;
	l26=r25;
	if (b==1)begin
	state=8'b01000100;
	end
	else begin
	state=8'b01000011;
	end
	end
	
	68:begin
	k26=keydec(k25);
	if (b==1)begin
	state=8'b01000101;
	end
	else begin
	state=8'b01000100;
	end
	end
	
	69:begin
	i26=r26^k26;
	if (b==1)begin
	state=8'b01000110;
	end
	else begin
	state=8'b01000101;
	end
	end
	
	70:begin
	r27=l26^i26;
	l27=r26;
	if (b==1)begin
	state=8'b01000111;
	end
	else begin
	state=8'b01000110;
	end
	end
	
	71:begin
	k27=keydec(k26);
	if (b==1)begin
	state=8'b01001000;
	end
	else begin
	state=8'b01000111;
	end
	end
	
	72:begin
	i27=r27^k27;
	if (b==1)begin
	state=8'b01001001;
	end
	else begin
	state=8'b01001000;
	end
	end
	
	73:begin
	r28=l27^i27;
	l28=r27;
	if (b==1)begin
	state=8'b01001010;
	end
	else begin
	state=8'b01001001;
	end
	end
	
	74:begin
	k28=keydec(k27);
	if (b==1)begin
	state=8'b01001011;
	end
	else begin
	state=8'b01001010;
	end
	end
	
	75:begin 
	i28=r28^k28;
	if (b==1)begin
	state=8'b01001100;
	end
	else begin
	state=8'b01001011;
	end
	end
	
	76:begin
	r29=l28^i28;
	l29=r28;
	if (b==1)begin
	state=8'b01001101;
	end
	else begin
	state=8'b01001100;
	end
	end
	
	77:begin
	k29=keydec(k28);
	if (b==1)begin
	state=8'b01001110;
	end
	else begin
	state=8'b01001101;
	end
	end
	
	78:begin
	i29=r29^k29;
	if (b==1)begin
	state=8'b01001111;
	end
	else begin
	state=8'b01001110;
	end
	end
	
	79:begin
	r210=l29^i29;
	l210=r29;
	if (b==1)begin
	state=8'b01010000;
	end
	else begin
	state=8'b01001111;
	end
	end
	
	80:begin
	k210=keydec(k29);
	if (b==1)begin
	state=8'b01010001;
	end
	else begin
	state=8'b01010000;
	end
	end
	
	81:begin
	i210=r210^k210;
	if (b==1)begin
	state=8'b01010010;
	end
	else begin
	state=8'b01010001;
	end
	end
	
	82:begin
	r211=l210^i210;
	l211=r210;
	if (b==1)begin
	state=8'b01010011;
	end
	else begin
	state=8'b01010010;
	end
	end
	
	83:begin
	k211=keydec(k210);
	if (b==1)begin
	state=8'b01010100;
	end
	else begin
	state=8'b01010011;
	end
	end
	
	84:begin
	i211=r211^k211;
	if (b==1)begin
	state=8'b01010101;
	end
	else begin
	state=8'b01010100;
	end
	end
	
	85:begin
	r212=l211^i211;
	l212=r211;
	if (b==1)begin
	state=8'b01010110;
	end
	else begin
	state=8'b01010101;
	end
	end
	
	86:begin
	k212=keydec(k211);
	if (b==1)begin
	state=8'b01010111;
	end
	else begin
	state=8'b01010110;
	end
	end
	
	87:begin
	i212=r212^k212;
	if (b==1)begin
	state=8'b01011000;
	end
	else begin
	state=8'b01010111;
	end
	end
	
	88:begin
	r213=l212^i212;
	l213=r212;
	if (b==1)begin
	state=8'b01011001;
	end
	else begin
	state=8'b01011000;
	end
	end
	
	89:begin
	k213=keydec(k212);
	if (b==1)begin
	state=8'b01011010;
	end
	else begin
	state=8'b01011001;
	end
	end
	
	90:begin
	i213=r213^k213;
	if (b==1)begin
	state=8'b01011011;
	end
	else begin
	state=8'b01011010;
	end
	end
	
	91:begin
	r214=l213^i213;
	l214=r213;
	if (b==1)begin
	state=8'b01011100;
	end
	else begin
	state=8'b01011011;
	end
	end
	
	92:begin
	k214=keydec(k213);
	if (b==1)begin
	state=8'b01011101;
	end
	else begin
	state=8'b01011100;
	end
	end
	
	93:begin
	i214=r214^k214;
	if (b==1)begin
	state=8'b01011110;
	end
	else begin
	state=8'b01011101;
	end
	end
	
	94:begin
	r215=l214^i214;
	l215=r214;
	if (b==1)begin
	state=8'b01011111;
	end
	else begin
	state=8'b01011110;
	end
	end
	
	95:begin
	k215=keydec(k214);
	if (b==1)begin
	state=8'b01100000;
	end
	else begin
	state=8'b01011111;
	end
	end
	
	96:begin
	k2=k215;
	i215=r215^k215;
	if (b==1)begin
	state=8'b01100001;
	end
	else begin
	state=8'b01100000;
	end
	end
	
	97:begin
	r216=l215^i215;
	l216=r215;
	if (b==1)begin
	state=8'b01100010;
	end
	else begin
	state=8'b01100001;
	end
	end
	
	98:begin
	k2=k215;
	o2[127:64]=l216;
	o2[63:0]=r216;
	if (b==1)begin
	state=8'b01100011;
	end
	else begin
	state=8'b01100010;
	end
	end
	//enc with k2 ends here
	
	
	//dec with ek1 starts
	99:begin
	l0=o2[127:64];
	r0=o2[63:0];
	if (b==1)begin
	state=8'b01100100;
	end
	else begin
	state=8'b01100011;
	end
	end
	
	100:begin
	r1=l0;
	if (b==1)begin
	state=8'b01100101;
	end
	else begin
	state=8'b01100100;
	end
	end
	
	101:begin
	i0=r0^ek1;
	if (b==1)begin
	state=8'b01100110;
	end
	else begin
	state=8'b01100101;
	end
	end
	
	102:begin
	l1=i0^r1;
	k11=keydec(ek1);
	if (b==1)begin
	state=8'b01100111;
	end
	else begin
	state=8'b01100110;
	end
	end
	
	
	103:begin
	r2=l1;
	if (b==1)begin
	state=8'b01101000;
	end
	else begin
	state=8'b01100111;
	end
	end
	
	104:begin
	i1=r1^k11;
	if (b==1)begin
	state=8'b01101001;
	end
	else begin
	state=8'b01101000;
	end
	end
	
	105:begin
	l2=i1^r2;
	k12=keydec(k11);
	if (b==1)begin
	state=8'b01101010;
	end
	else begin
	state=8'b01101001;
	end
	end
	
	106:begin
	r3=l2;
	if (b==1)begin
	state=8'b01101011;
	end
	else begin
	state=8'b01101010;
	end
	end
	
	107:begin
	i2=r2^k12;
	if (b==1)begin
	state=8'b01101100;
	end
	else begin
	state=8'b01101011;
	end
	end
	
	108:begin
	l3=i2^r3;
	k13=keydec(k12);
	if (b==1)begin
	state=8'b01101101;
	end
	else begin
	state=8'b01101100;
	end
	end
	
	109:begin
	r4=l3;
	if (b==1)begin
	state=8'b01101110;
	end
	else begin
	state=8'b01101101;
	end
	end
	
	110:begin
	i3=r3^k13;
	if (b==1)begin
	state=8'b01101111;
	end
	else begin
	state=8'b01101110;
	end
	end
	
	111:begin
	l4=i3^r4;
	k14=keydec(k13);
	if (b==1)begin
	state=8'b01110000;
	end
	else begin
	state=8'b01101111;
	end
	end
	
	
	112:begin
	r5=l4;
	if (b==1)begin
	state=8'b01110001;
	end
	else begin
	state=8'b01110000;
	end
	end
	
	113:begin
	i4=r4^k14;
	if (b==1)begin
	state=8'b01110010;
	end
	else begin
	state=8'b01110001;
	end
	end
	
	114:begin
	l5=i4^r5;
	k15=keydec(k14);
	if (b==1)begin
	state=8'b01110011;
	end
	else begin
	state=8'b01110010;
	end
	end
	
	
	115:begin
	r6=l5;
	if (b==1)begin
	state=8'b01110100;
	end
	else begin
	state=8'b01110011;
	end
	end
	
	116:begin
	i5=r5^k15;
	if (b==1)begin
	state=8'b01110101;
	end
	else begin
	state=8'b01110100;
	end
	end
	
	117:begin
	l6=i5^r6;
	k16=keydec(k15);
	if (b==1)begin
	state=8'b01110110;
	end
	else begin
	state=8'b01110101;
	end
	end
	
	
	118:begin
	r7=l6;
	if (b==1)begin
	state=8'b01110111;
	end
	else begin
	state=8'b01110110;
	end
	end
	
	119:begin
	i6=r6^k16;
	if (b==1)begin
	state=8'b01111000;
	end
	else begin
	state=8'b01110111;
	end
	end
	
	120:begin
	l7=i6^r7;
	k17=keydec(k16);
	if (b==1)begin
	state=8'b01111001;
	end
	else begin
	state=8'b01111000;
	end
	end
	
	
	121:begin
	r8=l7;
	if (b==1)begin
	state=8'b01111010;
	end
	else begin
	state=8'b01111001;
	end
	end
	
	122:begin
	i7=r7^k17;
	if (b==1)begin
	state=8'b01111011;
	end
	else begin
	state=8'b01111010;
	end
	end
	
	123:begin
	l8=i7^r8;
	k18=keydec(k17);
	if (b==1)begin
	state=8'b01111100;
	end
	else begin
	state=8'b01111011;
	end
	end
	
	124:begin
	r9=l8;
	if (b==1)begin
	state=8'b01111101;
	end
	else begin
	state=8'b01111100;
	end
	end
	
	125:begin
	i8=r8^k18;
	if (b==1)begin
	state=8'b01111110;
	end
	else begin
	state=8'b01111101;
	end
	end
	
	126:begin
	l9=i8^r9;
	k19=keydec(k18);
	if (b==1)begin
	state=8'b01111111;
	end
	else begin
	state=8'b01111110;
	end
	end
	
	127:begin
	r10=l9;
	if (b==1)begin
	state=8'b10000000;
	end
	else begin
	state=8'b01111111;
	end
	end
	
	128:begin
	i9=r9^k19;
	if (b==1)begin
	state=8'b10000001;
	end
	else begin
	state=8'b10000000;
	end
	end
	
	129:begin
	l10=i9^r10;
	k110=keydec(k19);
	if (b==1)begin
	state=8'b10000010;
	end
	else begin
	state=8'b10000001;
	end
	end
	
	130:begin
	r11=l10;
	if (b==1)begin
	state=8'b10000011;
	end
	else begin
	state=8'b10000010;
	end
	end
	
	131:begin
	i10=r10^k110;
	if (b==1)begin
	state=8'b10000100;
	end
	else begin
	state=8'b10000011;
	end
	end
	
	132:begin
	l11=i10^r11;
	k111=keydec(k110);
	if (b==1)begin
	state=8'b10000101;
	end
	else begin
	state=8'b10000100;
	end
	end
	
	
	133:begin
	r12=l11;
	if (b==1)begin
	state=8'b10000110;
	end
	else begin
	state=8'b10000101;
	end
	end
	
	134:begin
	i11=r11^k111;
	if (b==1)begin
	state=8'b10000111;
	end
	else begin
	state=8'b10000110;
	end
	end
	
	135:begin
	l12=i11^r12;
	k112=keydec(k111);
	if (b==1)begin
	state=8'b10001000;
	end
	else begin
	state=8'b10000111;
	end
	end
	
	136:begin
	r13=l12;
	if (b==1)begin
	state=8'b10001001;
	end
	else begin
	state=8'b10001000;
	end
	end
	
	137:begin
	i12=r12^k112;
	if (b==1)begin
	state=8'b10001010;
	end
	else begin
	state=8'b10001001;
	end
	end
	
	138:begin
	l13=i12^r13;
	k113=keydec(k112);
	if (b==1)begin
	state=8'b10001011;
	end
	else begin
	state=8'b10001010;
	end
	end
	
	
	139:begin
	r14=l13;
	if (b==1)begin
	state=8'b10001100;
	end
	else begin
	state=8'b10001011;
	end
	end
	
	140:begin
	i13=r13^k113;
	if (b==1)begin
	state=8'b10001101;
	end
	else begin
	state=8'b10001100;
	end
	end
	
	141:begin
	l14=i13^r14;
	k114=keydec(k113);
	if (b==1)begin
	state=8'b10001110;
	end
	else begin
	state=8'b10001101;
	end
	end
	
	142:begin
	r15=l14;
	if (b==1)begin
	state=8'b10001111;
	end
	else begin
	state=8'b10001110;
	end
	end
	
	143:begin
	i14=r14^k114;
	if (b==1)begin
	state=8'b10010000;
	end
	else begin
	state=8'b10001111;
	end
	end
	
	144:begin
	l15=i14^r15;
	k115=keydec(k114);
	if (b==1)begin
	state=8'b10010001;
	end
	else begin
	state=8'b10010000;
	end
	end
	
	
	145:begin
	r16=l15;
	if (b==1)begin
	state=8'b10010010;
	end
	else begin
	state=8'b10010001;
	end
	end
	
	146:begin
	i15=r15^k115;
	if (b==1)begin
	state=8'b10010011;
	end
	else begin
	state=8'b10010010;
	end
	end
	
	147:begin
	l16=i15^r16;
	if (b==1)begin
	state=8'b10010100;
	end
	else begin
	state=8'b10010011;
	end
	end
	
	148:begin
	k1=k115;
	pt[127:64]=l16;
	pt[63:0]=r16;
	if (b==1)begin
	state=8'b10010100;
	end
	else begin
	state=8'b10010100;
	end
	end
	

endcase
end
end
endmodule
