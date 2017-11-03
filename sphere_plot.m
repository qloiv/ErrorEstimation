
%kann zurzeit nur kugeln mit radius 1 plotten 
%formel für determinante: r²*sin(theta) theta ist der breitengrad
syms phi theta r
%https://de.wikipedia.org/wiki/Kugelkoordinaten#/media/File:Kugelkoord-lokale-Basis-s.svg

x = r*sin(theta)*cos(phi)
y = r*sin(theta)*sin(phi)
z = r*cos(theta)


J = [diff(x,r),diff(x,theta),diff(x,phi); 
    diff(y,r),diff(y,theta),diff(y,phi);
    diff(z,r),diff(z,theta),diff(z,phi)]

J = subs(J,r,1)
J = subs(J,phi,pi/4)
J = subs(J,theta,pi)
D = det(J)
JI = simplify(inv(J))

x = subs(x,r,1)
x = subs(x,phi,pi/4)
x = subs(x,theta,pi)

y = subs(y,r,1)
y = subs(y,phi,pi/4)
y = subs(y,theta,pi)

z = subs(z,r,1)
z = subs(z,phi,pi/4)
z = subs(z,theta,pi)
len = double(norm(J(:,1)));
dete = double(D)
tit = strcat('length = ', num2str(len), ', determinante = ', num2str(dete))
K = J*D;
[a,b,c] = sphere
figure

surf(a,b,c)
hold on
 scatter3(x,y,z,...
        'MarkerEdgeColor','k',...
        'MarkerFaceColor',[.9 .5 .2])
hold on
quiver3(x,y,z,K(1),K(2),K(3))
hold on
quiver3(x,y,z,K(4),K(5),K(6))
hold on
quiver3(x,y,z,K(7),K(8),K(9))
title(tit)
