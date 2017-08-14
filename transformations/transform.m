function [ t_vec ] = transform( points, angles,length )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
t_vec = ones(3,size(angles,2))
for i = 1:size(angles,2)
    iki = ikin(points(1,i),points(2,i),angles(i),length);
    t_vec(1,i) = iki(1)
    t_vec(2,i) = iki(2)
    t_vec(3,i) = iki(3)
end
end

