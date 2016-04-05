`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:51 10/18/2015 
// Design Name: 
// Module Name:    tdes_enc 
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
module tdes_enc(
    input [63:0] k1,k2,k3,
	 input [127:0] pt,
    output reg [127:0] ct,
    input rst,clk,
	 output reg [63:0] ek1,ek2,ek3
    );

reg [63:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,l16,l0,l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15;
reg [63:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r210,r211,r212,r213,r214,r215,r216,l216,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l210,l211,l212,l213,l214,l215,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i210,i211,i212,i213,i214,i215;
reg [63:0] r30,r31,r32,r33,r34,r35,r36,r37,r38,r39,r310,r311,r312,r313,r314,r315,r316,l316,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l310,l311,l312,l313,l314,l315,i30,i31,i32,i33,i34,i35,i36,i37,i38,i39,i310,i311,i312,i313,i314,i315;
reg [63:0] k11,k12,k13,k14,k15,k16,k17,k18,k19,k110,k111,k112,k113,k114,k115,k21,k22,k23,k24,k25,k26,k27,k28,k29,k210,k211,k212,k213,k214,k215,k31,k32,k33,k34,k35,k36,k37,k38,k39,k310,k311,k312,k313,k314,k315;
reg [7:0]state;
reg [127:0]o1,o2;
reg b;


function [63:0]keygen;
input [63:0]key;
reg [15:0] t1,t2,t3,t4;
begin
t1=key[63:48]^key[13:0];
t2=t1^key[47:32];
t3=t2^key[31:16];
t4=t3^key[15:0];

keygen[63:48]=t1;
keygen[47:32]=t2;
keygen[31:16]=t3;
keygen[15:0]=t4;
end
endfunction



always @ (posedge clk) begin

if(rst) begin
state=0;
b=1;
end
else begin

case (state)
	
	//enc with k1 starts
	
	0:begin
	l0=pt[127:64];
	r0=pt[63:0];
	if (b==1)begin
	state=6'b000001;
	end
	else begin
	state=6'b000000;
	end
	end
	
	1:begin
	i0=r0^k1;
	if (b==1)begin
	state=6'b000010;
	end
	else begin
	state=6'b000001;
	end
	end
	
	2:begin
	r1=l0^i0;
	l1=r0;
	if (b==1)begin
	state=6'b000011;
	end
	else begin
	state=6'b000010;
	end
	end
	
	3:begin
	k11=keygen(k1);
	if (b==1)begin
	state=6'b000100;
	end
	else begin
	state=6'b000011;
	end
	end
	
	4:begin
	i1=r1^k11;
	if (b==1)begin
	state=6'b000101;
	end
	else begin
	state=6'b000100;
	end
	end
	
	5:begin
	r2=l1^i1;
	l2=r1;
	if (b==1)begin
	state=6'b000110;
	end
	else begin
	state=6'b000101;
	end
	end
	
	6:begin
	k12=keygen(k11);
	if (b==1)begin
	state=6'b000111;
	end
	else begin
	state=6'b000110;
	end
	end
	
	7:begin
	i2=r2^k12;
	if (b==1)begin
	state=6'b001000;
	end
	else begin
	state=6'b000111;
	end
	end
	
	8:begin
	r3=l2^i2;
	l3=r2;
	if (b==1)begin
	state=6'b001001;
	end
	else begin
	state=6'b001000;
	end
	end
	
	9:begin
	k13=keygen(k12);
	if (b==1)begin
	state=6'b001010;
	end
	else begin
	state=6'b001001;
	end
	end
	
	10:begin
	i3=r3^k13;
	if (b==1)begin
	state=6'b001011;
	end
	else begin
	state=6'b001010;
	end
	end
	
	11:begin
	r4=l3^i3;
	l4=r3;
	if (b==1)begin
	state=6'b001100;
	end
	else begin
	state=6'b001011;
	end
	end
	
	12:begin
	k14=keygen(k13);
	if (b==1)begin
	state=6'b001101;
	end
	else begin
	state=6'b001100;
	end
	end
	
	13:begin
	i4=r4^k14;
	if (b==1)begin
	state=6'b001110;
	end
	else begin
	state=6'b001101;
	end
	end
	
	14:begin
	r5=l4^i4;
	l5=r4;
	if (b==1)begin
	state=6'b001111;
	end
	else begin
	state=6'b001110;
	end
	end
	
	15:begin
	k15=keygen(k14);
	if (b==1)begin
	state=6'b010000;
	end
	else begin
	state=6'b001111;
	end
	end
	
	16:begin
	i5=r5^k15;
	if (b==1)begin
	state=6'b010001;
	end
	else begin
	state=6'b010000;
	end
	end
	
	17:begin
	r6=l5^i5;
	l6=r5;
	if (b==1)begin
	state=6'b010010;
	end
	else begin
	state=6'b010001;
	end
	end
	
	18:begin
	k16=keygen(k15);
	if (b==1)begin
	state=6'b010011;
	end
	else begin
	state=6'b010010;
	end
	end
	
	19:begin
	i6=r6^k16;
	if (b==1)begin
	state=6'b010100;
	end
	else begin
	state=6'b010011;
	end
	end
	
	20:begin
	r7=l6^i6;
	l7=r6;
	if (b==1)begin
	state=6'b010101;
	end
	else begin
	state=6'b010100;
	end
	end
	
	21:begin
	k17=keygen(k16);
	if (b==1)begin
	state=6'b010110;
	end
	else begin
	state=6'b010101;
	end
	end
	
	22:begin
	i7=r7^k17;
	if (b==1)begin
	state=6'b010111;
	end
	else begin
	state=6'b010110;
	end
	end
	
	23:begin
	r8=l7^i7;
	l8=r7;
	if (b==1)begin
	state=6'b011000;
	end
	else begin
	state=6'b010111;
	end
	end
	
	24:begin
	k18=keygen(k17);
	if (b==1)begin
	state=6'b011001;
	end
	else begin
	state=6'b011000;
	end
	end
	
	25:begin 
	i8=r8^k18;
	if (b==1)begin
	state=6'b011010;
	end
	else begin
	state=6'b011001;
	end
	end
	
	26:begin
	r9=l8^i8;
	l9=r8;
	if (b==1)begin
	state=6'b011011;
	end
	else begin
	state=6'b011010;
	end
	end
	
	27:begin
	k19=keygen(k18);
	if (b==1)begin
	state=6'b011100;
	end
	else begin
	state=6'b011011;
	end
	end
	
	28:begin
	i9=r9^k19;
	if (b==1)begin
	state=6'b011101;
	end
	else begin
	state=6'b011100;
	end
	end
	
	29:begin
	r10=l9^i9;
	l10=r9;
	if (b==1)begin
	state=6'b011110;
	end
	else begin
	state=6'b011101;
	end
	end
	
	30:begin
	k110=keygen(k19);
	if (b==1)begin
	state=6'b011111;
	end
	else begin
	state=6'b011110;
	end
	end
	
	31:begin
	i10=r10^k110;
	if (b==1)begin
	state=6'b100000;
	end
	else begin
	state=6'b011111;
	end
	end
	
	32:begin
	r11=l10^i10;
	l11=r10;
	if (b==1)begin
	state=6'b100001;
	end
	else begin
	state=6'b100000;
	end
	end
	
	33:begin
	k111=keygen(k110);
	if (b==1)begin
	state=6'b100010;
	end
	else begin
	state=6'b100001;
	end
	end
	
	34:begin
	i11=r11^k111;
	if (b==1)begin
	state=6'b100011;
	end
	else begin
	state=6'b100010;
	end
	end
	
	35:begin
	r12=l11^i11;
	l12=r11;
	if (b==1)begin
	state=6'b100100;
	end
	else begin
	state=6'b100011;
	end
	end
	
	36:begin
	k112=keygen(k111);
	if (b==1)begin
	state=6'b100101;
	end
	else begin
	state=6'b100100;
	end
	end
	
	37:begin
	i12=r12^k112;
	if (b==1)begin
	state=6'b100110;
	end
	else begin
	state=6'b100101;
	end
	end
	
	38:begin
	r13=l12^i12;
	l13=r12;
	if (b==1)begin
	state=6'b100111;
	end
	else begin
	state=6'b100110;
	end
	end
	
	39:begin
	k113=keygen(k112);
	if (b==1)begin
	state=6'b101000;
	end
	else begin
	state=6'b100111;
	end
	end
	
	40:begin
	i13=r13^k113;
	if (b==1)begin
	state=6'b101001;
	end
	else begin
	state=6'b101000;
	end
	end
	
	41:begin
	r14=l13^i13;
	l14=r13;
	if (b==1)begin
	state=6'b101010;
	end
	else begin
	state=6'b101001;
	end
	end
	
	42:begin
	k114=keygen(k113);
	if (b==1)begin
	state=6'b101011;
	end
	else begin
	state=6'b101010;
	end
	end
	
	43:begin
	i14=r14^k114;
	if (b==1)begin
	state=6'b101100;
	end
	else begin
	state=6'b101011;
	end
	end
	
	44:begin
	r15=l14^i14;
	l15=r14;
	if (b==1)begin
	state=6'b101101;
	end
	else begin
	state=6'b101100;
	end
	end
	
	45:begin
	k115=keygen(k114);
	if (b==1)begin
	state=6'b101110;
	end
	else begin
	state=6'b101101;
	end
	end
	
	46:begin
	ek1=k115;
	i15=r15^k115;
	if (b==1)begin
	state=6'b101111;
	end
	else begin
	state=6'b101110;
	end
	end
	
	47:begin
	r16=l15^i15;
	l16=r15;
	if (b==1)begin
	state=6'b110000;
	end
	else begin
	state=6'b101111;
	end
	end
	
	48:begin
	o1[127:64]=l16;
	o1[63:0]=r16;
	if (b==1)begin
	state=6'b110001;
	end
	else begin
	state=6'b110000;
	end
	end
	
	//enc with k1 complete
	
		//dec with k2 starts
		
	49:begin
	l20=o1[127:64];
	r20=o1[63:0];
	if (b==1)begin
	state=8'b00110010;
	end
	else begin
	state=8'b00110001;
	end
	end
	
	50:begin
	r21=l20;
	if (b==1)begin
	state=8'b00110011;
	end
	else begin
	state=8'b00110010;
	end
	end
	
	51:begin
	i20=r20^k2;
	if (b==1)begin
	state=8'b00110100;
	end
	else begin
	state=8'b00110011;
	end
	end
	
	52:begin
	l21=i20^r21;
	k21=keygen(k2);
	if (b==1)begin
	state=8'b00110101;
	end
	else begin
	state=8'b00110100;
	end
	end
	
	
	53:begin
	r22=l21;
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
	l22=i21^r22;
	k22=keygen(k21);
	if (b==1)begin
	state=8'b00111000;
	end
	else begin
	state=8'b00110111;
	end
	end
	
	
	56:begin
	r23=l22;
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
	l23=i22^r23;
	k23=keygen(k22);
	if (b==1)begin
	state=8'b00111011;
	end
	else begin
	state=8'b00111010;
	end
	end
	
	
	59:begin
	r24=l23;
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
	l24=i23^r24;
	k24=keygen(k23);
	if (b==1)begin
	state=8'b00111110;
	end
	else begin
	state=8'b00111101;
	end
	end
	
	
	62:begin
	r25=l24;
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
	state=8'b00110011;
	end
	end
	
	64:begin
	l25=i24^r25;
	k25=keygen(k24);
	if (b==1)begin
	state=8'b01000001;
	end
	else begin
	state=8'b01000000;
	end
	end
	
	
	65:begin
	r26=l25;
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
	l26=i25^r26;
	k26=keygen(k25);
	if (b==1)begin
	state=8'b01000100;
	end
	else begin
	state=8'b01000011;
	end
	end
	
	
	68:begin
	r27=l26;
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
	l27=i26^r27;
	k27=keygen(k26);
	if (b==1)begin
	state=8'b01000111;
	end
	else begin
	state=8'b01000110;
	end
	end
	
	
	71:begin
	r28=l27;
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
	l28=i27^r28;
	k28=keygen(k27);
	if (b==1)begin
	state=8'b01001010;
	end
	else begin
	state=8'b01001001;
	end
	end
	
	74:begin
	r29=l28;
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
	l29=i28^r29;
	k29=keygen(k28);
	if (b==1)begin
	state=8'b01001101;
	end
	else begin
	state=8'b01001100;
	end
	end
	
	77:begin
	r210=l29;
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
	l210=i29^r210;
	k210=keygen(k29);
	if (b==1)begin
	state=8'b01010000;
	end
	else begin
	state=8'b01001111;
	end
	end
	
	80:begin
	r211=l210;
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
	l211=i210^r211;
	k211=keygen(k210);
	if (b==1)begin
	state=8'b01010011;
	end
	else begin
	state=8'b01010010;
	end
	end
	
	
	83:begin
	r212=l211;
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
	l212=i211^r212;
	k212=keygen(k211);
	if (b==1)begin
	state=8'b01010110;
	end
	else begin
	state=8'b01010101;
	end
	end
	
	86:begin
	r213=l212;
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
	l213=i212^r213;
	k213=keygen(k212);
	if (b==1)begin
	state=8'b01011001;
	end
	else begin
	state=8'b01011000;
	end
	end
	
	
	89:begin
	r214=l213;
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
	l214=i213^r214;
	k214=keygen(k213);
	if (b==1)begin
	state=8'b01011100;
	end
	else begin
	state=8'b01011011;
	end
	end
	
	
	92:begin
	r215=l214;
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
	l215=i214^r215;
	k215=keygen(k214);
	if (b==1)begin
	state=8'b01011111;
	end
	else begin
	state=8'b01011110;
	end
	end
	
	
	95:begin
	r216=l215;
	if (b==1)begin
	state=8'b01100000;
	end
	else begin
	state=8'b01011111;
	end
	end
	
	96:begin
	i215=r215^k215;
	if (b==1)begin
	state=8'b01100001;
	end
	else begin
	state=8'b01100000;
	end
	end
	
	97:begin
	l216=i215^r216;
	ek2=k215;
	//k216=keygen(k214);
	if (b==1)begin
	state=8'b01100010;
	end
	else begin
	state=8'b01100001;
	end
	end
	
	98:begin
	o2[127:64]=l216;
	o2[63:0]=r216;
	if (b==1)begin
	state=8'b01100011;
	end
	else begin
	state=8'b01100010;
	end
	end
	
	//dec with k2 completes
	
	//enc with k3 starts here
	
	99:begin
	l30=o2[127:64];
	r30=o2[63:0];
	if (b==1)begin
	state=8'b01100100;
	end
	else begin
	state=8'b01100011;
	end
	end
	
	100:begin
	i30=r30^k3;
	if (b==1)begin
	state=8'b01100101;
	end
	else begin
	state=8'b01100100;
	end
	end
	
	101:begin
	r31=l30^i30;
	l31=r30;
	if (b==1)begin
	state=8'b01100110;
	end
	else begin
	state=8'b01100101;
	end
	end
	
	102:begin
	k31=keygen(k3);
	if (b==1)begin
	state=8'b01100111;
	end
	else begin
	state=8'b01100110;
	end
	end
	
	103:begin
	i31=r31^k31;
	if (b==1)begin
	state=8'b01101000;
	end
	else begin
	state=8'b01100111;
	end
	end
	
	104:begin
	r32=l31^i31;
	l32=r31;
	if (b==1)begin
	state=8'b01101001;
	end
	else begin
	state=8'b01101000;
	end
	end
	
	105:begin
	k32=keygen(k31);
	if (b==1)begin
	state=8'b01101010;
	end
	else begin
	state=8'b01101001;
	end
	end
	
	106:begin
	i32=r32^k32;
	if (b==1)begin
	state=8'b01101011;
	end
	else begin
	state=8'b01101010;
	end
	end
	
	107:begin
	r33=l32^i32;
	l33=r32;
	if (b==1)begin
	state=8'b01101100;
	end
	else begin
	state=8'b01101011;
	end
	end
	
	108:begin
	k33=keygen(k32);
	if (b==1)begin
	state=8'b01101101;
	end
	else begin
	state=8'b01101100;
	end
	end
	
	109:begin
	i33=r33^k33;
	if (b==1)begin
	state=8'b01101110;
	end
	else begin
	state=8'b01101101;
	end
	end
	
	110:begin
	r34=l33^i33;
	l34=r33;
	if (b==1)begin
	state=8'b01101111;
	end
	else begin
	state=8'b01101110;
	end
	end
	
	111:begin
	k34=keygen(k33);
	if (b==1)begin
	state=8'b01110000;
	end
	else begin
	state=8'b01101111;
	end
	end
	
	112:begin
	i34=r34^k34;
	if (b==1)begin
	state=8'b01110001;
	end
	else begin
	state=8'b01110000;
	end
	end
	
	113:begin
	r35=l34^i34;
	l35=r34;
	if (b==1)begin
	state=8'b01110010;
	end
	else begin
	state=8'b01110001;
	end
	end
	
	114:begin
	k35=keygen(k34);
	if (b==1)begin
	state=8'b01110011;
	end
	else begin
	state=8'b01110010;
	end
	end
	
	115:begin
	i35=r35^k35;
	if (b==1)begin
	state=8'b01110100;
	end
	else begin
	state=8'b01110011;
	end
	end
	
	116:begin
	r36=l35^i35;
	l36=r35;
	if (b==1)begin
	state=8'b01110101;
	end
	else begin
	state=8'b01110100;
	end
	end
	
	117:begin
	k36=keygen(k35);
	if (b==1)begin
	state=8'b01110110;
	end
	else begin
	state=8'b01110101;
	end
	end
	
	118:begin
	i36=r36^k36;
	if (b==1)begin
	state=8'b01110111;
	end
	else begin
	state=8'b01110110;
	end
	end
	
	119:begin
	r37=l36^i36;
	l37=r36;
	if (b==1)begin
	state=8'b01111000;
	end
	else begin
	state=8'b01110111;
	end
	end
	
	120:begin
	k37=keygen(k36);
	if (b==1)begin
	state=8'b01111001;
	end
	else begin
	state=8'b01111000;
	end
	end
	
	121:begin
	i37=r37^k37;
	if (b==1)begin
	state=8'b01111010;
	end
	else begin
	state=8'b01111001;
	end
	end
	
	122:begin
	r38=l37^i37;
	l38=r37;
	if (b==1)begin
	state=8'b01111011;
	end
	else begin
	state=8'b01111010;
	end
	end
	
	123:begin
	k38=keygen(k37);
	if (b==1)begin
	state=8'b01111100;
	end
	else begin
	state=8'b01111101;
	end
	end
	
	124:begin 
	i38=r38^k38;
	if (b==1)begin
	state=8'b01111101;
	end
	else begin
	state=8'b01111100;
	end
	end
	
	125:begin
	r39=l38^i38;
	l39=r38;
	if (b==1)begin
	state=8'b01111110;
	end
	else begin
	state=8'b01111101;
	end
	end
	
	126:begin
	k39=keygen(k38);
	if (b==1)begin
	state=8'b01111111;
	end
	else begin
	state=8'b01111110;
	end
	end
	
	127:begin
	i39=r39^k39;
	if (b==1)begin
	state=8'b10000000;
	end
	else begin
	state=8'b01111111;
	end
	end
	
	128:begin
	r310=l39^i39;
	l310=r39;
	if (b==1)begin
	state=8'b10000001;
	end
	else begin
	state=8'b10000000;
	end
	end
	
	129:begin
	k310=keygen(k39);
	if (b==1)begin
	state=8'b10000010;
	end
	else begin
	state=8'b10000001;
	end
	end
	
	130:begin
	i310=r310^k310;
	if (b==1)begin
	state=8'b10000011;
	end
	else begin
	state=8'b10000010;
	end
	end
	
	131:begin
	r311=l310^i310;
	l311=r310;
	if (b==1)begin
	state=8'b10000100;
	end
	else begin
	state=8'b10000011;
	end
	end
	
	132:begin
	k311=keygen(k310);
	if (b==1)begin
	state=8'b10000101;
	end
	else begin
	state=8'b10000100;
	end
	end
	
	133:begin
	i311=r311^k311;
	if (b==1)begin
	state=8'b10000110;
	end
	else begin
	state=8'b10000101;
	end
	end
	
	134:begin
	r312=l311^i311;
	l312=r311;
	if (b==1)begin
	state=8'b10000111;
	end
	else begin
	state=8'b10000110;
	end
	end
	
	135:begin
	k312=keygen(k311);
	if (b==1)begin
	state=8'b10001000;
	end
	else begin
	state=8'b10000111;
	end
	end
	
	136:begin
	i312=r312^k312;
	if (b==1)begin
	state=8'b10001001;
	end
	else begin
	state=8'b10001000;
	end
	end
	
	137:begin
	r313=l312^i312;
	l313=r312;
	if (b==1)begin
	state=8'b10001010;
	end
	else begin
	state=8'b10001001;
	end
	end
	
	138:begin
	k313=keygen(k312);
	if (b==1)begin
	state=8'b10001011;
	end
	else begin
	state=8'b10001010;
	end
	end
	
	139:begin
	i313=r313^k313;
	if (b==1)begin
	state=8'b10001100;
	end
	else begin
	state=8'b10001011;
	end
	end
	
	140:begin
	r314=l313^i313;
	l314=r313;
	if (b==1)begin
	state=8'b10001101;
	end
	else begin
	state=8'b10001100;
	end
	end
	
	141:begin
	k314=keygen(k313);
	if (b==1)begin
	state=8'b10001110;
	end
	else begin
	state=8'b10001101;
	end
	end
	
	142:begin
	i314=r314^k314;
	if (b==1)begin
	state=8'b10001111;
	end
	else begin
	state=8'b10001110;
	end
	end
	
	143:begin
	r315=l314^i314;
	l315=r314;
	if (b==1)begin
	state=8'b10010000;
	end
	else begin
	state=8'b10001111;
	end
	end
	
	144:begin
	k315=keygen(k314);
	if (b==1)begin
	state=8'b10010001;
	end
	else begin
	state=8'b10010000;
	end
	end
	
	145:begin
	i315=r315^k315;
	ek3=k315;
	if (b==1)begin
	state=8'b10010010;
	end
	else begin
	state=8'b10010001;
	end
	end
	
	146:begin
	r316=l315^i315;
	l316=r315;
	if (b==1)begin
	state=8'b10010011;
	end
	else begin
	state=8'b10010010;
	end
	end
	
	147:begin
	ct[127:64]=l316;
	ct[63:0]=r316;
	if (b==1)begin
	state=8'b10010011;
	end
	else begin
	state=8'b10010011;
	end
	end
	//enc with k3 completes	
	
	
endcase
end

end
endmodule
