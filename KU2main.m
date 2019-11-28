%% hej
%KU2 grupp 7F
P = 1; %Power to the system
v = 1; % wind speed
h_tower = 3; %m height of the tower
d_hole = 1; % m holepattern diameter
t_flange = 1; %flange thickness
R_a = 7.5e-6; %surface 
n_max = 0.75; %max usable power from windspeed
sigma_utm = 30e6; %if and only if bolt >= M36
my_WB = [0.10 0.40]; %(0.10 - 0.40) Friction between washer and bolt
my_thread =  [0.07 0.35]; %(0.07-0.35) Frction in the thread
w_flange = 190e-3; %flange width
d_tower = 2*(d_hole/2 + 0.065) %Tower outer diameter
Pitch = 1.5; %Bolt Pitch
E = 206e9; % Pa Youngs modulus of steel

c_s = E * pi*d_1^2/4 / t_flange;	% = E_s*A_s/L_k
x = (t_flange/(t_flange+d_w));
A_ekv = pi/4*(d_w^2-d_h^2) + pi/8*t_flange*d_w*((x+1)^2 - 1);
c_k = E*A_ekv/t_flange;	% = E_k*A_k/L_k

s = @(delta) delta*c_s;
k = @(delta)  - delta*c_k;
plot([0 delta_0s],[])


Mb = F_wind * h_tower;

Mtot = Fax*(0.16*Pitch + 0.58*my_thread  )



