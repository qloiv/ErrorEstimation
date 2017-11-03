function [ rt_vec ] = retransform(arms,joints)
%UNTITLED2 Summary of this function goes joint:matrix mit pro reihe die stellungen für einen punkt 
% output: rt_vec mit pro eintrag sind die koordinaten des punktes und der
% winkel
%   Detailed explanation goes here
    joint_pts = size(joints,2);
    num_joints = size(arms,2);
    rt_vec = sym([])
    for j = 1:joint_pts
        pose = joints(:,j) %j-te spalte  
        fki = fkin2(arms,pose);
        rt_vec(:,j) = fki;
       
    end
end

