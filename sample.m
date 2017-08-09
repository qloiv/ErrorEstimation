function [ points ] = sample( start_pt, end_pt, distance, point_number )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if nargin < 4
        point_number = 1/distance*norm(end_pt-start_pt)+1; %distance im raum
    end
    direction = end_pt - start_pt;
    points = start_pt + direction * linspace(0,1,point_number);

end

