syms o u z d e f l
syms a b c l positive
 d = o- c*cos(z);
 e = u-c*sin(z);
 f = 0;

l = d^2+e^2;

s = (l-a^2-b^2)/(2*a*b);
%angenommen sqrt(1-s²) ist real. dann muss 1-s²>=0 sein
%dann muss 1>=abs(s) sein, was 1>=s>=-1 bedeutet
s_1 = s;
assume(s_1<= 1 & s_1 >= -1);
theta2_1 = atan2(sqrt(1-s_1^2),s_1);
%da wie oben angenommen sqrt(1-s^2)>= 0 ist, kann man atan2 in atan
%umschreiben
theta2_1 = atan(s_1/sqrt(1-s^2));
%da a b und l positiv sind (wolframalpha)
theta2_1 = atan((a^2+b^2-l)/(sqrt(-a^4+2*a^2*(b^2+l)-(b^2-l)^2)));
IN_1 = atan2(b*sin(theta2_1),a+b*cos(theta2_1)); 
%da die wurzel real ist, ergibt sin(theta2_1) = sqrt(1-s)
%und cos(theta2_1) = s
IN_1 = atan2(b*sqrt(1-s^2),a+b*s);
% da beide Ausdrücke größer als 0 sind, kann man es zu atan umschreiben
IN_1 = atan(b*sqrt(1-s^2)/a+b*s);
%lässt sich verinafachen zu (wa)
IN_1 = atan((2*a*b*sqrt(1-s^2))/(a^2-b^2+l));
OUT_1 = atan2(e,d);
theta1_1=-IN_1+OUT_1;
theta3_1 = z-(theta1_1+theta2_1);
%angenommen sqrt(1-s²) ist nicht real. dann muss 1-s²<0 sein
%dann ist 1 < abs(s). dann ist s > 1 oder <-1
s_2_a = s;
assume(s_2_a> 1);
%dann ist real(sqrt(1-s²)) immer 0, da die wurzel aus einer negativen
%Zahl immer einen Realteil von 0 besitzt 
%theta2_2 ist dann 0  falls s_2_a > 1
theta2_2_a = atan2(0,s_2_a);
theta2_2_a = 0;
%sin(theta2_2) ist dann auch immer 0, dann wird der ganze erste Ausdruck in
%IN_2 0 (Multiplikation mit 0)
%cos(theta2_2) ist 1
IN_2_a = atan2(0,a+b*1);
IN_2_a = atan(0/a+b);%=0
OUT_2_a = atan2(e,d);
theta1_2_a=-IN_2_a+OUT_2_a; %= OUT_2
theta3_2_a = z-(theta1_2_a+theta2_2_a);

s_2_b = s;
assume(s_2_b < -1);
%dann ist real(sqrt(1-s²)) immer 0, da die wurzel aus einer negativen
%Zahl immer einen Realteil von 0 besitzt 
%theta2_2 ist dann pi  falls s_2_a <-1
theta2_2_b = atan2(0,s_2_b);
theta2_2_b = pi;
%sin(theta2_2) ist dann auch immer 0, dann wird der ganze erste Ausdruck in
%IN_2 0 (Multiplikation mit 0)
%cos(theta2_2) ist -1
IN_2_b = atan2(0,a+b*-1); %atan2 von 0,0 ist in matlab 0
OUT_2_b = atan2(e,d);
theta1_2_b=-IN_2_b+OUT_2_b;
theta3_2_b = z-(theta1_2_b+theta2_2_b);

fall1 = [theta1_1;theta2_1;theta3_1]
fall2a = [theta1_2_a;theta2_2_a;theta3_2_a]
fall2b = [theta1_2_b;theta2_2_b;theta3_2_b]