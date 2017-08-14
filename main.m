
joints = [pi/2,0,0] %gelenkstellungen angeben (3)
arms = [1,1,1]
rob = planarRRR(); %roboter festlegen

rob.plot(joints,'notiles', 'top', 'noname','workspace', [-5,5,-5,5,0,5],'floorlevel', -1)
T = fkin(arms,joints);
T = rob.fkine(joints); %transformationsmatrix des toolkits

rot = tr2rpy(T); %aus transformationsmatrix die rotation um die verschieden
% achsen(eulerwinkel) berechnen,da es ein planarer roboter ist, sind y und x 
%null und nur z!=0 und z ist dann auch der rotationswinkel des greifers
angle = rot(3);
my_fkin2 = fkin2(arms,joints);
angle = my_fkin2(3); %letztes output argument ist der winkel
angle =atan2(T(1,1),T(2,1));  %das ist die formel aus dem paper

[my_ikin,my_ikin2] = ikin(my_fkin2(1),my_fkin2(2),angle,arms);
M = [1, 1, 0, 0 ,0, 1]; %mask for robot 
%from http://read.pudn.com/downloads195/ebook/919885/robotics%20toolbox%20for%20matlab/robot/ikine.m__.htm
% If the manipulator has fewer than 6 DOF then this method of solution
% will fail, since the solution space has more dimensions than can
% be spanned by the manipulator joint coordinates.  In such a case
% it is necessary to provide a mask matrix, M, which specifies the 
% Cartesian DOF (in the wrist coordinate frame) that will be ignored
% in reaching a solution.  The mask matrix has six elements that
% correspond to translation in X, Y and Z, and rotation about X, Y and
% Z respectively.  The value should be 0 (for ignore) or 1.  The number
% of non-zero elements should equal the number of manipulator DOF.
base = [0,0,0];
ikine = rob.ikine(T,base,M); %erst position, dann orientation
%rob.plot(ikine,'notiles', 'top', 'noname','workspace', [-5,5,-5,5,0,5],'floorlevel', -1)
%rob.plot(my_ikin,'notiles', 'top', 'noname','workspace', [-5,5,-5,5,0,5],'floorlevel', -1)
%rob.plot(my_ikin2,'notiles', 'top', 'noname','workspace', [-5,5,-5,5,0,5],'floorlevel', -1)

%check solutions
T_ikine_sol = fkin(arms,ikine) 
T_my_ikin_sol = fkin(arms,my_ikin)
T_my_ikin_sol2 = fkin(arms,my_ikin2)
sampleSize = 9
points = sample([0;1],[0;0],2,3); %sample points from line
pim = sym(pi)
angles = [0,0,0] %das sind die winkel der letzten armstücke an jedem punkt aus points
transformed_points = (transform(points, angles,arms)) %to joint space
 %2d plot

%build trajectory from transformed points
traj = (trajectory1(transformed_points,sampleSize)) %in joint space
pts = retransform(arms,traj) %from joint space to 
s = sampleMultiple(points(1,:), sampleSize)
ori_pts = []
ori_pts(1,:) = s
ori_pts(2,:) = sampleMultiple(points(2,:),sampleSize)
%plot(pts(1,:),pts(2,:));hold on;
%plot(ori_pts(1,:),ori_pts(2,:))
trs_pts = pts
trs_pts(3,:) = []
err = mse(trs_pts,ori_pts)
plot(err)

figure
ax1 = subplot(2,1,1);
plot(err)
title(ax1,'Error')

ax2 = subplot(2,1,2);
plot(pts(1,:),pts(2,:));
hold on;
plot(ori_pts(1,:),ori_pts(2,:))
title(ax2,'Original and Transformed Points')
hold off;