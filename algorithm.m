error_rate = 0.00001;
sSize1 = 2;
sSize2 = 2;
angles_ori = zeros(1,2);
angles = angles_ori
t_obj = TransformationObject([0;0],[0;1],sSize1, sSize2, angles,[1,1,1]);
t_obj.toJSpace()
t_obj.trajGen()
t_obj.toTSpace()
t_obj.computeError();
t_obj.plot()
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
sSize1 = sSize1*2;
angles = sampleMultiple(angles_ori,sSize1);
end