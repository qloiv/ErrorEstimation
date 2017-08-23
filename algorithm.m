error_rate = 0.0001;
sSize1 = 2;
sSize2 = 20;
angles_ori = zeros(1,sSize1);
i = 2;
angles = sampleMultiple(angles_ori,i);
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
i = i+1;
angles = sampleMultiple(angles, 3);
sSize1 = size(angles,2)
end