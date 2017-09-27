error_rate = 0.00001;
sSize1 = 4; % gibt an, wieviele Punkte der Linie im kartesischen Raum ausgewählt werden
sSize2 = 20; %
angles_ori = zeros(1,sSize1);
angles = sample_multiple(angles_ori,0);
while(1)
t_obj = TransformationObject([0;0],[0;1],sSize1, sSize2, angles,[1,1,1]);
t_obj.toJSpace()
t_obj.trajGen()
t_obj.toTSpace()
t_obj.computeError();
t_obj.plot()
if(t_obj.meanError <= error_rate)
    break
end
angles = sample_multiple(angles, 1);
sSize1 = size(angles,2);
end