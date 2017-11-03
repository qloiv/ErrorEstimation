%syms length1 length2 length3 positive
syms theta1 theta2 theta3 
length1= 1
length2 = 1
length3 = 1

sol1 = (length1)*cos(theta1)+length2*cos(theta1+theta2)+length3*cos(theta1+theta2+theta3); %x
sol2 = (length1)*sin(theta1)+length2*sin(theta1+theta2)+length3*sin(theta1+theta2+theta3); %y
sol3 = (theta1+theta2+theta3); %groß theta

J = [diff(sol1,theta1),diff(sol1,theta2),diff(sol1,theta3); 
    diff(sol2,theta1),diff(sol2,theta2),diff(sol2,theta3);
    diff(sol3,theta1),diff(sol3,theta2),diff(sol3,theta3)]
D = det(J_sub)
size = 40
%theta geht von 0 bis 2pi
%die det = sin(theta1 + theta2)*cos(theta1) - cos(theta1 + theta2)*sin(theta1)
degrees = linspace(0,2*pi,size)
array = zeros(size,size);
for x = linspace(1,size,size)
    for y = linspace(1,size,size)
            J_sub = subs(J,theta1,degrees(x));
            J_sub = subs(J_sub,theta2,degrees(y));
            array(x,y)= det(J_sub);
    end
end

surf(linspace(1,size,size),linspace(1,size,size),array)
    