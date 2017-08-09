function lbr = planarRRR()

% DH-Parameters
a1 = 1;
a2 = 1;
a3 = 1;

% Joint Limits
limits =  [-2.9671, 2.9671; ...
           -2.0944, 2.0944; ...
           -2.9671, 2.9671];

% create links
L(1) = Link('offset', 0, 'd', 0, 'alpha', 0, 'a', a1, 'standard'); 
L(2) = Link('offset', 0, 'd', 0, 'alpha', 0, 'a', a2, 'standard');
L(3) = Link('offset', 0, 'd', 0, 'alpha', 0, 'a', a3, 'standard');

% create robot
lbr = SerialLink(L, 'name', 'lbr4', 'qlim', limits);

end



