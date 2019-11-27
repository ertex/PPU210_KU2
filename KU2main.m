%% hej

P = 1; %Power to the system
v = 1; % wind speed
h_torn = 3; % m height of the tower
d_hole = 1; % m holepattern diameter
t_flange = 1; %flange thickness
R_a = 7.5e-6; %surface 

c_s = E_s * pi*d_1^2/4 / t_flange;	% = E_s*A_s/L_k
x = (t_flange/(t_flange+d_w));
A_ekv = pi/4*(d_w^2-d_h^2) + pi/8*t_flange*d_w*((x+1)^2 - 1);
c_k = A_ekv*E_k/t_flange;	% = E_k*A_k/L_k
