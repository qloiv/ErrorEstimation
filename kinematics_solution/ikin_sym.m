syms bx by omega o_wrist1 o_wrist2 o_wrist3 l stuff
syms length1 length2 length3 l positive
 o_wrist1 = bx - length3*cos(omega);
 o_wrist2 = by-length3*sin(omega);
 o_wrist3 = 0;

l = o_wrist1^2+o_wrist2^2;

stuff = (l-length1^2-length2^2)/(2*length1*length2);
%angenommen sqrt(1-stuff²) ist real. dann muss 1-stuff²>=0 sein
%dann muss 1>=abs(stuff) sein, was 1>=stuff>=-1 bedeutet
stuff_1 = stuff;
assume(stuff_1<= 1 & stuff_1 >= -1);
theta2_1 = atan2(sqrt(1-stuff_1^2),stuff_1);
%da wie oben angenommen sqrt(1-stuff^2)>= 0 ist, kann man atan2 in atan
%umschreiben, kann man nict, da vom 2. argument abhängig
IN_1 = atan2(length2*sin(theta2_1),length1+length2*cos(theta2_1)); 
%da die wurzel real ist, ergibt sin(theta2_1) = sqrt(1-stuff)
%und cos(theta2_1) = stuff
IN_1 = atan2(length2*sqrt(1-stuff^2),length1+length2*stuff);
% da beide Ausdrücke größer als 0 sind, kann man es zu atan umschreiben,
% nein, kann 0 werden
%IN_1 = atan(length2*sqrt(1-stuff^2)/length1+length2*stuff);
%lässt sich verinafachen zu (wa)
%IN_1 = atan((2*length1*length2*sqrt(1-stuff^2))/(length1^2-length2^2+l));
OUT_1 = atan2(o_wrist2,o_wrist1);
theta1_1=-IN_1+OUT_1;
theta3_1 = omega-(theta1_1+theta2_1);

%angenommen sqrt(1-stuff²) ist nicht real. dann muss 1-stuff²<0 sein
%dann ist 1 < abs(stuff). dann ist stuff > 1 oder <-1
stuff_2_a = stuff;
assume(stuff_2_a> 1);
%dann ist real(sqrt(1-stuff²)) immer 0, da die wurzel aus einer negativen
%Zahl immer einen Realteil von 0 besitzt 
%theta2_2 ist dann 0  falls stuff_2_a > 1
theta2_2_a = atan2(0,stuff_2_a);
theta2_2_a = 0;
%sin(theta2_2) ist dann auch immer 0, dann wird der ganze erste Ausdruck in
%IN_2 0 (Multiplikation mit 0)
%cos(theta2_2) ist 1
IN_2_a = atan2(0,length1+length2*1);
IN_2_a = atan(0/length1+length2);%=0
OUT_2_a = atan2(o_wrist2,o_wrist1);
theta1_2_a=-IN_2_a+OUT_2_a; %= OUT_2
theta3_2_a = omega-(theta1_2_a+theta2_2_a);

stuff_2_b = stuff;
assume(stuff_2_b < -1);
%dann ist real(sqrt(1-stuff²)) immer 0, da die wurzel aus einer negativen
%Zahl immer einen Realteil von 0 besitzt 
%theta2_2 ist dann pi  falls stuff_2_a <-1
theta2_2_b = atan2(0,stuff_2_b);
theta2_2_b = pi;
%sin(theta2_2) ist dann auch immer 0, dann wird der ganze erste Ausdruck in
%IN_2 0 (Multiplikation mit 0)
%cos(theta2_2) ist -1
IN_2_b = atan2(0,length1+length2*-1); %atan2 von 0,0 ist in matlab 0
OUT_2_b = atan2(o_wrist2,o_wrist1);
theta1_2_b=-IN_2_b+OUT_2_b;
theta3_2_b = omega-(theta1_2_b+theta2_2_b);

fall1 = [theta1_1;theta2_1;theta3_1]
fall2a = [theta1_2_a;theta2_2_a;theta3_2_a]
fall2b = [theta1_2_b;theta2_2_b;theta3_2_b]

%für fall1 
sol(1) = length1*cos(theta1_1)+length2*cos(theta1_1+theta2_1)+length3*cos(theta1_1+theta2_1+theta3_1)
sol(2) = (length1)*sin(theta1_1)+length2*sin(theta1_1+theta2_1)+length3*sin(theta1_1+theta2_1+theta3_1)
sol(3) = (theta1_1+theta2_1+theta3_1)
% 
% %teste. bx by = 0 und 0.5
% test_stuff_b = subs(stuff, bx, 1);
% test_stuff_b = subs(test_stuff_b,by, 1);
% 
% test_stuff_b = subs(test_stuff_b, length1,0.5);
% test_stuff_b = subs(test_stuff_b, length2,0.5);
% test_stuff_b = subs(test_stuff_b, length3,0.5);
% 
% test_stuff_b = subs(test_stuff_b, omega,0);
% 
% if(1-test_stuff_b^2 >= 0)
%     fprintf('%s\n', 'Fall 1');
%     testb = subs(fall1,bx,1);
%     testb = subs(testb,by,1);
%     testb = subs(testb, length1,1);
%     testb = subs(testb, length2,1);
%     testb = subs(testb, length3,1);
%     testb = subs(testb, omega, 0);
%     fprintf('%f\n', testb);
%     
% else
%     if(test_stuff_b>1)
%         testb = subs(fall2a,bx,1);
%         testb = subs(testb,by,1);
%         testb = subs(testb, length1,0.5);
%         testb = subs(testb, length2,0.5);
%         testb = subs(testb, length3,0.5);
%         testb = subs(testb, omega, 0);
%         fprintf('%f\n', testb);    
%         fprintf('%s\n','Fall 2a')
%     else
%       
%     fprintf('%s\n','Fall 2b')
%     end
% end

% syms ax ay cx cy
% %setze statt bx und by (ax+cx)/2 und (ay+cy)/2
% 
% sub_bx = (ax+cx)/2;
% sub_by = (ay+cy)/2;
% 
% test_stuff = subs(stuff, bx, sub_bx)
% test_stuff = subs(test_stuff, by, sub_by)
% 
% test_fall1 = subs(fall1,bx,sub_bx)
% test_fall1 = subs(test_fall1,by,sub_by)
% 
% test_fall2a = subs(fall2a,bx,sub_bx)
% test_fall2a = subs(test_fall2a,by,sub_by)
% 
% test_fall2b = subs(fall2b,bx,sub_bx)
% test_fall2b = subs(test_fall2b,by,sub_by)
% 
% %teste. cx cy = 0 und 1
% test_stuff_ac = subs(test_stuff, cx, 0);
% test_stuff_ac = subs(test_stuff_ac,cy, 1);
% test_stuff_ac = subs(test_stuff_ac, ax, 0);
% test_stuff_ac = subs(test_stuff_ac,ay, 0);
% test_stuff_ac = subs(test_stuff_ac, length1,1);
% test_stuff_ac = subs(test_stuff_ac, length2,1);
% test_stuff_ac = subs(test_stuff_ac, length3,1);
% 
% test_stuff_ac = subs(test_stuff_ac, omega,0);
% 
% if(1-test_stuff_ac^2 >= 0)
%     fprintf('%s\n', 'Fall 1');
%     testac = subs(test_fall1,ax,0);
%     testac = subs(testac,ay,0);
%     testac = subs(testac,cx,0);
%     testac = subs(testac,cy,1);
%     testac = subs(testac, length1,1);
%     testac = subs(testac, length2,1);
%     testac = subs(testac, length3,1);
%     testac = subs(testac, omega, 0);
%     fprintf('%f\n', testac);
% end
