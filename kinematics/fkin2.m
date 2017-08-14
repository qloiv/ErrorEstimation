function sol = fkin2(length,theta)
sol(1) = length(1)*cos(theta(1))+length(2)*cos(theta(1)+theta(2))+length(3)*cos(theta(1)+theta(2)+theta(3));
sol(2) = length(1)*sin(theta(1))+length(2)*sin(theta(1)+theta(2))+length(3)*sin(theta(1)+theta(2)+theta(3));
sol(3) = wrapToPi(theta(1)+theta(2)+theta(3));


