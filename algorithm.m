error_rate = 0.00001;
sSize1 = 2;
sSize2 = 20;

while(1)
t_obj = TransformationObject([0;0],[0;1],sSize1, sSize2, [0,0],[1,1,1]);

t_obj.toJSpace()
t_obj.trajGen()
t_obj.toTSpace()
t_obj.computeError()
if(obj.error <= error_rate)
    break
end
sSize1 = sSize*2;
end