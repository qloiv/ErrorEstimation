function [theta,theta2] = ikin(ox,oy,omega,length) %annahme - ox und oy sind an der base 0
%berechnet inverse kinematik nur für einen RRR-Roboter
%ox,oy, Koordinaten des Greifers
%omega-Rotation des Greifers, hier Winkel zur x-Achse
%length- armlängen
%output: beide Gelenkstellungen, die möglich sind (righty lefty solution)
o_wrist = [ox-length(3)*cos(omega);oy-length(3)*sin(omega);0];
l = sqrt(o_wrist(1)^2+o_wrist(2)^2);
stuff = (l^2-length(1)^2-length(2)^2)/(2*length(1)*length(2));
theta(2) = -atan2(real(sqrt(1-stuff^2)),stuff); %minus
theta2(2) = -atan2(real(-sqrt(1-stuff^2)),stuff); %minus
IN = atan2(-length(2)*sin(theta(2)),length(1)+length(2)*cos(theta(2))); %minzs 1.arg
OUT = atan2(o_wrist(2),o_wrist(1));
IN2 = atan2(-length(2)*sin(theta2(2)),length(1)+length(2)*cos(theta2(2))); %minus 1.arg
OUT2 = atan2(o_wrist(2),o_wrist(1));
theta(1) = IN+OUT ; %vertauscht glaub ich wegen drehrichtung. 
theta2(1) = IN2+OUT2;
theta(3) = omega-(theta(1)+theta(2));
theta2(3) = omega -(theta2(1)+theta2(2));
end