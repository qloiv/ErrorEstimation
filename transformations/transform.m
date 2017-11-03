function [ t_vec ] = transform( points, angles,length )
% Inverse Kinematik von mehreren Punkten
% erzeugt von jedem Punkt aus points die dazu notwendige Gelenkstellung
% (als tripel)

t_vec = sym(ones(3,size(angles,2)));

for i = 1:size(angles,2)
    iki = ikin(points(1,i),points(2,i),angles(i),length);

    t_vec(1,i) =(iki(1));
    t_vec(2,i) = (iki(2));
    t_vec(3,i) = (iki(3));
end
end

