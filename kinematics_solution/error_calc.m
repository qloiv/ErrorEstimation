syms bx by omega o_wrist1 o_wrist2 o_wrist3 l stuff ax cx ay cy
syms length1 length2 length3 l positive
 o_wrist1 = bx - length3*cos(omega);
 o_wrist2 = by-length3*sin(omega);
 o_wrist3 = 0;

l = o_wrist1^2+o_wrist2^2;

stuff = (l-length1^2-length2^2)/(2*length1*length2);

theta2 = atan2(real(sqrt(1-stuff^2)),stuff);
%theta22 = atan2(real(-sqrt(1-stuff^2)),stuff); 
IN = atan2(length2*sin(theta2),length1+length2*cos(theta2)); 
OUT = atan2(o_wrist2,o_wrist1);
%IN2 = atan2(length2*sin(theta22),length1+length2*cos(theta22)); 
theta1 = -IN+OUT ; %IN, IN2 negativ 
%theta21 = -IN2+OUT;
theta3 = omega-(theta1+theta2);
%theta23 = omega -(theta21+theta22);


sub_bx = (ax+cx)/2;
sub_by = (ay+cy)/2;

theta1 = subs(theta1,bx,sub_bx);
theta2 = subs(theta2,bx,sub_bx);
theta3 = subs(theta3,bx,sub_bx);

theta1 = subs(theta1,by,sub_by);
theta2 = subs(theta2,by,sub_by);
theta3 = subs(theta3,by,sub_by);

sol1 = simplify((length1)*cos(theta1)+length2*cos(theta1+theta2)+length3*cos(theta1+theta2+theta3)); %fehlerbehafteter x wert
sol2 = simplify((length1)*sin(theta1)+length2*sin(theta1+theta2)+length3*sin(theta1+theta2+theta3)); %fehlerbehafteter y wert
sol3 = simplify((theta1+theta2+theta3)); %= omega- kein fehler

x_error = simplify(abs(sol1-sub_bx));
y_error = simplify(abs(sol2-sub_by));