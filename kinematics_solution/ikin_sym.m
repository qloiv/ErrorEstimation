syms ox oy omega length1 length2 length3 o_wrist1 o_wrist2 o_wrist3

 o_wrist1 = ox - length3*cos(omega);
 o_wrist2 = oy-length3*sin(omega);
 o_wrist3 = 0;

l = sqrt(o_wrist1^2+o_wrist2^2)

stuff = (l^2-length1^2-length2^2)/(2*length1*length2)
%angenommen stuff^2 >= 1, dh 1-stuff^2 < 0. dann ist sqrt(1-stuff^2)
%imaginär, also real(sqrt(1-stuff^2)) = 0. dann ist theta2 = atan2(0,stuff)
%= pifür stuff<0, 0 für stuff>0
%für stuff^2<1 ist sqrt(1-stuff^2) real 

theta2 = atan2(sqrt(1-stuff^2),stuff)
IN = atan2(length2*sqrt(1-stuff^2),length1+length2*stuff); 

IN2 = atan2(length2*sin(theta2),length1+length2*cos(theta2)); 
OUT = atan2(o_wrist2,o_wrist1);
theta1=-IN+OUT
theta3 = omega-(theta1+theta2)
