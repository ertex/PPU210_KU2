%% hej
%KU2 grupp 7F
P = 2.5e6; %Power to the system
v = 20; % wind speed
h_tower = 110; %m height of the tower
d_hole = 4; % m holepattern diameter
t_flange = 0.15; %m flange thickness
R_a = 7.5e-6; %surface 
n_max = 0.75; %max usable effect from windspeed
sigma_utm = 30e6; %if and only if bolt >= M36
my_WB = [0.10 0.40]; %(0.10 - 0.40) Friction between washer and bolt
my_thread =  [0.07 0.35]; %(0.07-0.35) Frction in the thread
w_flange = 190e-3; %flange width
d_tower = 2*(d_hole/2 + 0.065) %Tower outer diameter
Pitch = 1.5; %Bolt Pitch
%index 1=M24 2=M27 3=M30 4=M36 5=M42 6=M48 7=M56
%Pitch  out_dia  avg_dia  inner_dia  dh  dw
Bolt = [
3   24 22.051 20.752 28 33.61;
3.5 30 27.727 26.211 35 45.75;
4   36 33.402 31.670 42 51.11;
4.5 42 39.077 37.129 48 59.95;
5   48 44.752 42.587 56 69.45;
5.5 56 52.428 50.046 66 78.66]

c_s = E_s * pi*d_1^2/4 / t_flange;	% = E_s*A_s/L_k
x = (t_flange/(t_flange+d_w));
A_ekv = pi/4*(d_w^2-d_h^2) + pi/8*t_flange*d_w*((x+1)^2 - 1);
c_k = A_ekv*E_k/t_flange;	% = E_k*A_k/L_k



Mb = F_wind * h_tower;

Mtot = Fax*(0.16*Pitch + 0.58*my_thread*  )



