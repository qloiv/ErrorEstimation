function [ points ] = sample( start_pt, end_pt, distance, point_number )
% SAMPLE Sampelt 'point-number'-viele Punkte mit gleichem Abstand zwischen
%   start_pt und end_pt.
%
%   Dabei werden Startpunkt und Endpunkt mitgezählt. Bei vier Argumenten
%   wird 'distance' nicht beachtet, bei drei Argumenten wird aus ihr eine
%   'point_number' berechnet.

    if nargin < 4
        point_number = 1/distance*norm(end_pt-start_pt)+1; %distance im raum
    end
    direction = end_pt - start_pt;
    points = repmat(start_pt,1,point_number) + direction * linspace(0,1,point_number);

end

