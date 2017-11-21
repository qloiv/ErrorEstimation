syms length1 length2 length3 positive
syms theta1 theta2 theta3 
% length1= 1
% length2 = 1
% length3 = 1

sol1 = (length1)*cos(theta1)+length2*cos(theta1+theta2)+length3*cos(theta1+theta2+theta3); %x
sol2 = (length1)*sin(theta1)+length2*sin(theta1+theta2)+length3*sin(theta1+theta2+theta3); %y
sol3 = (theta1+theta2+theta3); %groß theta

J = [diff(sol1,theta1),diff(sol1,theta2),diff(sol1,theta3); 
    diff(sol2,theta1),diff(sol2,theta2),diff(sol2,theta3);
    diff(sol3,theta1),diff(sol3,theta2),diff(sol3,theta3)]
J_sub = subs(J,theta1,0)
J_sub = subs(J_sub,theta2,0)
J_sub = subs(J_sub,theta3,pi/2)
D = det(J_sub)
JI = simplify(inv(J))
JI_sub = inv(J_sub)
% JI_sub = subs(JI,theta1,0)
% JI_sub = subs(JI,theta2,0)
% JI_sub = subs(JI,theta3,pi/2)

%JI_pseudo = inv(J'*J)*J'
JI_pseudo = pinv(J)
JI_pseudo_sub=pinv(J_sub)

%det0_solution = sin(theta2)*length1*length2 = 0
%det0_solution = sin(theta2) = 0
%singulariätät falls sin(theta2) == 0
%das bedeutet dass man wahrscheinlich dann mehr samplepunkte braucht