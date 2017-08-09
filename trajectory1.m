function [ trajectory ] = trajectory1( joint_list ,sample_size )
%UNTITLED einfach nur die punkte verbinden
%   Detailed explanation goes here
%   joint_list: {[gelenkstellungen für joint 1],[.. für joint 2],...[.. für
%   joint n]}
%   trajectory: {[mehr gelenkstellungen,gesamplet, für joint1],[..für joint
%   2],[.. für joint n]}
    joint_pts = size(joint_list,2)
    num_joints = size(joint_list,1)
    doublings = joint_pts-2
    all_el_with_dd = (joint_pts-1)*sample_size
    num_el = all_el_with_dd-doublings
    trajectory = ones(num_joints,num_el)
    for j = 1:num_joints
        joint_movements = joint_list(j,:)
        
        sample_list = sampleMultiple(joint_movements,sample_size)
        trajectory(j,:)= (sample_list)
    end
        

end
