function [ jacobi_matrix, determinante ] = jac( length1 ,length2,length3,theta1,theta2,theta3 )
%JAC Summary of this function goes here
%   gibt für eine Konfiguration an einem Punkt des workspaces die jakobi
%   matrix und ihre determinante zurück
%   Detailed explanation goes here
jacobi_matrix = [ - length2*sin(theta1 + theta2) - length1*sin(theta1) - length3*sin(theta1 + theta2 + theta3), ...
    - length2*sin(theta1 + theta2) - length3*sin(theta1 + theta2 + theta3), ...
    -length3*sin(theta1 + theta2 + theta3);
   length2*cos(theta1 + theta2) + length1*cos(theta1) + length3*cos(theta1 + theta2 + theta3), ...
   length2*cos(theta1 + theta2) + length3*cos(theta1 + theta2 + theta3), ...
   length3*cos(theta1 + theta2 + theta3);
   1,1,1];
determinante = det(jacobi_matrix)
end

