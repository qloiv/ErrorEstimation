syms ox oy omega o_wrist1 o_wrist2 o_wrist3 l
syms length1 length2 length3 positive
 o_wrist1 = ox - length3*cos(omega);
 o_wrist2 = oy-length3*sin(omega);
 o_wrist3 = 0;

l = o_wrist1^2+o_wrist2^2;

stuff = (l-length1^2-length2^2)/(2*length1*length2);
%angenommen sqrt(1-stuff²) ist real. dann muss 1-stuff²>=0 sein
%dann muss 1>=abs(stuff) sein, was 1>=stuff>=-1 bedeutet
stuff_1 = stuff;
assume(stuff_1<= 1 & stuff_1 >= -1);
theta2_1 = atan2(sqrt(1-stuff_1^2),stuff_1)
IN_1 = atan2(length2*sin(theta2_1),length1+length2*cos(theta2_1)); 
%da die wurzel real ist, ergibt sin(theta2_1) = sqrt(1-stuff)
%und cos(theta2_1) = stuff
IN_1 = atan2(length2*sqrt(1-stuff^2),length1+length2*stuff);
% da beide Ausdrücke größer als 0 sind, kann man es zu atan umschreiben
IN_1 = atan(length2*sqrt(1-stuff^2)/length1+length2*stuff);
OUT_1 = atan2(o_wrist2,o_wrist1);
theta1_1=-IN_1+OUT_1
theta3_1 = omega-(theta1_1+theta2_1)

%angenommen sqrt(1-stuff²) ist nicht real. dann muss 1-stuff²<0 sein
%dann ist 1 < abs(stuff). dann ist stuff > 1 oder <-1
stuff_2_a = stuff;
assume(stuff_2_a> 1);
%dann ist real(sqrt(1-stuff²)) immer 0, da die wurzel aus einer negativen
%Zahl immer einen Realteil von 0 besitzt 
%theta2_2 ist dann 0  falls stuff_2_a > 1
theta2_2_a = atan2(0,stuff_2_a);
theta2_2_a = 0
%sin(theta2_2) ist dann auch immer 0, dann wird der ganze erste Ausdruck in
%IN_2 0 (Multiplikation mit 0)
%cos(theta2_2) ist 1
IN_2_a = atan2(0,length1+length2*1);
IN_2_a = atan(0/length1+length2);%=0
OUT_2_a = atan2(o_wrist2,o_wrist1);
theta1_2_a=-IN_2_a+OUT_2_a %= OUT_2
theta3_2_a = omega-(theta1_2_a+theta2_2_a)

stuff_2_b = stuff;
assume(stuff_2_b < -1);
%dann ist real(sqrt(1-stuff²)) immer 0, da die wurzel aus einer negativen
%Zahl immer einen Realteil von 0 besitzt 
%theta2_2 ist dann pi  falls stuff_2_a <-1
theta2_2_b = atan2(0,stuff_2_b);
theta2_2_b = pi
%sin(theta2_2) ist dann auch immer 0, dann wird der ganze erste Ausdruck in
%IN_2 0 (Multiplikation mit 0)
%cos(theta2_2) ist -1
IN_2_b = atan2(0,length1+length2*-1); %atan2 von 0,0 ist in matlab 0
OUT_2_b = atan2(o_wrist2,o_wrist1);
theta1_2_b=-IN_2_b+OUT_2_b
theta3_2_b = omega-(theta1_2_b+theta2_2_b)
