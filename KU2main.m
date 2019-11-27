%% hej
%KU2 grupp 7F
P = 1; %Power to the system
v = 1; % wind speed
h_tower = 3; %m height of the tower
d_hole = 1; % m holepattern diameter
t_flange = 1; %flange thickness
R_a = 7.5e-6; %surface 
n_max = 0.75; %max usable effect from windspeed
sigma_utm = 30e6; %if and only if bolt >= M36
my_WB = [0.10 0.40]; %(0.10 - 0.40) Friction between washer and bolt
my_thread =  [0.07 0.35]; %(0.07-0.35) Frction in the thread
w_flange = 190e-3; %flange width
d_tower = 2*(d_hole/2 + 0.065) %Tower outer diameter
Pitch = 1.5; %Bolt Pitch

c_skruv = 

Mb = F_wind * h_tower;

Mtot = Fax*(0.16*Pitch + 0.58*my_thread  )




