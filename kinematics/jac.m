function [ jacobi_matrix, determinante ] = jac( length1,length2,length3,theta_vector1,theta_vector2,theta_vector3 )
%JAC Summary of this function goes here
%   gibt für eine Konfiguration an einem Punkt des workspaces
%   Detailed explanation goes here

syms theta1 theta2 theta3 
sol1 = (length1)*cos(theta1)+length2*cos(theta1+theta2)+length3*cos(theta1+theta2+theta3); %x
sol2 = (length1)*sin(theta1)+length2*sin(theta1+theta2)+length3*sin(theta1+theta2+theta3); %y
sol3 = (theta1+theta2+theta3); %groß theta

J = [diff(sol1,theta1),diff(sol1,theta2),diff(sol1,theta3); 
    diff(sol2,theta1),diff(sol2,theta2),diff(sol2,theta3);
    diff(sol3,theta1),diff(sol3,theta2),diff(sol3,theta3)]
J_sub = subs(J,theta1,theta_vector1)
J_sub = subs(J_sub,theta2,theta_vector2)
J_sub = subs(J_sub,theta3,theta_vector3)
D = det(J_sub)
jacobi_matrix = J_sub
determinante = double(D)
end
