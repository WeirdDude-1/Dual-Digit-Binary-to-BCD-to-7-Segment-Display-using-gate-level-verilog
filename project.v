module and_gate(a,b,y);
input a,b;
output y;

and(y,a,b);
                
endmodule

module not_gate(a,y);
input a;
output y;

not(y,a);
                
endmodule

module or_gate(a,b,y);
input a,b;
output y;

or(y,a,b);
                
endmodule

module and_gate_three(a,b,c,y);
input a,b,c;
output y;

wire j;

and_gate and1(a,b,j);
and_gate and2(c,j,y);

endmodule

module or_gate_three(a,b,c,y);
input a,b,c;
output y;

wire j;

or_gate or1(a,b,j);
or_gate or2(c,j,y);

endmodule

module add3(A3, A2, A1, A0, S3, S2, S1, S0);

input A3,A2,A1,A0;
output S3,S2,S1,S0;

wire w1,w2,w3,w4,w5,w6,w7,w8, w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24;

//connect wires to inputs
assign w1 = A3;
assign w3 = A2;
assign w5 = A1;
assign w7 = A0;

//nots
not_gate not1(A3,w2);
not_gate not2(A2, w4);
not_gate not3(A1, w6);
not_gate not4(A0, w8);

//S3
and_gate and1(w3, w5, w9);
and_gate and2(w3, w7, w10);
or_gate or1(w9, w10, w11);
or_gate or2(w11, w1, S3);

//S2  
and_gate and3(w1,w6,w13);
and_gate_three three_and1(w3,w6,w8,w14);
or_gate or3(w13,w14,S2);

//S1
and_gate and4(w1,w7,w16);
and_gate and5(w4,w5,w17);
and_gate and6(w5,w7,w18);
or_gate_three three_or1(w16,w17,w18,S1);

//S0
and_gate and7(w1,w8,w19);
and_gate_three three_and2(w2,w7,w4,w20);
and_gate_three three_and3(w3,w5,w8,w21);
or_gate_three three_or2(w19,w20,w21,S0);

endmodule

module bintobcd(B8,B7,B6,B5,B4,B3,B2,B1,B0,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0);
input B8,B7,B6,B5,B4,B3,B2,B1,B0;
output P9,P8,P7,P6,P5,P4,P3,P2,P1,P0;

wire w1,w2,w3,w4,w5,w6,w7,w8, w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29;


assign w1=B0;
assign w2=B1;
assign w3=B2;
assign w4=B3;
assign w5=B4;
assign w6=B5;
assign w7=B6;
assign w8=B7;
assign w9=B8;

add3 c1(w9,w8,w7,w6,w10,w11,w12,w13);
add3 c2(w11,w12,w13,w5,w14,w15,w16,w17);
add3 c3(w15,w16,w17,w4,w18,w19,w20,w21);
add3 c4(w19,w20,w21,w3,w22,w23,w24,w25);
add3 c5(w23,w24,w25,w2,P4,P3,P2,P1);
add3 c6(w9,w10,w14,w18,P9,w26,w27,w28);
add3 c7(w26,w27,w28,w22,P8,P7,P6,P5);

endmodule

module bcdtosev(A,B,C,D,a,b,c,d,e,f,g);

input A,B,C,D;
output a,b,c,d,e,f,g;

wire w1,w2,w3,w4,w5,w6,w7,w8, w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22;

assign w1 = A;
assign w3 = B;
assign w5 = C;
assign w7 = D;

not_gate not1(A, w2);
not_gate not2(B, w4);
not_gate not3(B, w6);
not_gate not4(D, w8);

//a
and_gate and1(w3,w7,w9);
and_gate and2(w4,w8,w10);
or_gate_three or3_1(w9,w10,w1,w11);
or_gate or1(w11,w5,a);

//b
and_gate and3(w5,w7,w12);
and_gate and4(w6,w8,w13);
or_gate_three or3_2(w12,w4,w13,b);


//c
or_gate_three or3_3(w3,w6,w7,c);

//d
and_gate and5(w5,w8,w14);
and_gate and6(w4,w5,w15);
and_gate and7(w3,w6,w16);
and_gate and8(w7,w16,w17);
or_gate_three or3_4(w1,w10,w14,w18);
or_gate or2(w15,w17,w19);
or_gate or3(w19,w18,d);

//e
or_gate or4(w14,w10,e);

//f
and_gate and9(w3,w8,w20);
or_gate_three or3_5(w13,w20,w16,w21);
or_gate or5(w21,w1,f);

//g
or_gate_three or3_6(w10,w16,w1,w22);
or_gate or6(w22,w15,g);


endmodule


module project(B8,B7,B6,B5,B4,B3,B2,B1,B0, a10,b10,c10,d10,e10,f10,g10,a1,b1,c1,d1,e1,f1,g1);
input B8,B7,B6,B5,B4,B3,B2,B1,B0;
output a10,b10,c10,d10,e10,f10,g10,a1,b1,c1,d1,e1,f1,g1;

wire hund_a,hund_b,ten_a,ten_b,ten_c,ten_d,one_a,one_b,one_c,one_d;

bintobcd bintobcd(B8,B7,B6,B5,B4,B3,B2,B1,B0,hund_a,hund_b,ten_a,ten_b,ten_c,ten_d,one_a,one_b,one_c,one_d);
bcdtosev bsevtens(ten_a,ten_b,ten_c,ten_d,a10,b10,c10,d10,e10,f10,g10);
bcdtosev bsevones(one_a,one_b,one_c,one_d,a1,b1,c1,d1,e1,f1,g1);

endmodule







