function [ trajectory ] = Copy_of_trajectory1( joint_list ,sample_size )
%UNTITLED einfach nur die punkte verbinden
%   Detailed explanation goes here
%   joint_list: {[gelenkstellungen für joint 1],[.. für joint 2],...[.. für
%   joint n]}
%   trajectory: {[mehr gelenkstellungen,gesamplet, für joint1],[..für joint
%   2],[.. für joint n]}
    joint_pts = size(joint_list,2);
    num_joints = size(joint_list,1);
    doublings = joint_pts-2;
    all_el_with_dd = (joint_pts-1)*sample_size;
    num_el = all_el_with_dd-doublings;
   % trajectory = ones(num_joints,num_el)
    for j = 1:num_joints
        joint_movements = joint_list(j,:);
        %joint list einträge sind im bereich -pi bis pi wenn das vorzeichen
        %wechselt und ein Eintrag pi oder -pi ist, ist es also besser wenn
        %dieser eintrag zu -pi oder pi wird
        %for numeric variables
        if(abs(joint_movements(end)-joint_movements(1))> pi)
            if(abs(wrapTo2Pi(joint_movements(end))-joint_movements(1))<pi)
                joint_movements(end) = wrapTo2Pi(joint_movements(end))
            else
                joint_movements(1) = wrapTo2Pi(joint_movements(1))
            end
        end
        sample_list = sample_multiple(joint_movements,sample_size);
        trajectory(j,:)= (sample_list);
    end
        

end
