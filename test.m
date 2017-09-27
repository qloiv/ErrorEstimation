%Beispiel für drei Punkte
p1 = [-1;0]
p2 = [0;0]
p3 = [1;0] %[0;2] geht nicht, da der Punkt mit winkel 0 garnicht erreichbar ist (bei armlängen von 1)
sSize1 = 3;
sSize2 = 2;
angles_ori = zeros(1,sSize1);
angles = sampleMultiple(angles_ori,2);
angles = [0*sym(pi),0*sym(pi),0*sym(pi)]
angles = [0,0,0]
arms = [1,1,1]

% p1_ikin = ikin(p1(1),p1(2),angles(1),arms)
% p1_fkin = fkin2(arms, p1_ikin)
% 
% %p1_transformed_jsp = transform([0;1], 0*sym(pi), [1,1,1]);
% p1_transformed_jsp = transform(p1, angles(1), arms)
% p1_traj = trajectory1(p1_transformed_jsp,1);
% p1_transformed_tsp = retransform(arms,p1_traj);

t_obj = TransformationObject(p1,p3,sSize1, sSize2, angles,[1,1,1]);
t_obj.toJSpace()
t_obj.trajGen()
t_obj.toTSpace()
t_obj.computeError();
t_obj.plot()
