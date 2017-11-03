function T = fkin(length,theta)
length = sym(length)
theta = sym(theta)
rotation_m_1 = [cos(theta(1)),-sin(theta(1));sin(theta(1)),cos(theta(1))];
rotation_m_2 = [cos(theta(2)),-sin(theta(2));sin(theta(2)),cos(theta(2))];
rotation_m_3 = [cos(theta(3)),-sin(theta(3));sin(theta(3)),cos(theta(3))];

T01 = eye(4);
T01(1:2,1:2) = rotation_m_1;
T12 = eye(4);
T12(1:2,1:2) = rotation_m_2;
T12(1,4) = length(1);
T23 = eye(4);
T23(1:2,1:2) = rotation_m_3;
T23(1,4) = length(2);
T34 = eye(4);
T34(1,4) = length(3);
T04 = T01*T12*T23*T34;

T =  T04;

 