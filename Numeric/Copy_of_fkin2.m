function sol = fkin2(length,theta)
length = sym(length)
theta = sym(theta)
%vpa variable precision arithmetic - if at least one input uses it, all
%others also use it
sol(1) = (length(1))*cos(theta(1))+length(2)*cos(theta(1)+theta(2))+length(3)*cos(theta(1)+theta(2)+theta(3));
sol(2) = (length(1))*sin(theta(1))+length(2)*sin(theta(1)+theta(2))+length(3)*sin(theta(1)+theta(2)+theta(3));
sol(3) = wrapToPi((theta(1))+theta(2)+theta(3));


