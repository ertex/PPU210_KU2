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
%Type , Pitch , clearance drill , tap drill , tensile strenght
Bolt= [
M 4     0.70    4.50    3.30    8.78;
M 5     0.80    5.50    4.20    14.2;
M 6     1.00    6.60    5.00    20.1;
M 8     1.25    9.00    6.80    36.6;
M 10    1.50    12.00   8.50    58.0;
M 12    1.75    14.00   10.20   84.3;
M 14    2.00    16.00   12.00   0;
M 16    2.00    18.00   14.00   157;
M 20    2.50    22.00   17.50   245;
M 22    2.50    25.00   19.50   0;
M 24    3.00    27.00   21.00   353;
M 27    3.00    30.00   24.00   0    ;
M 30    3.50    33.00   26.50   561;
M 36    4.00    40.00   32.00   817;
M 42    4.50    46.00   37.50   1120;
M 48    5.00    53.00   43.00   1470;
M 56    5.50    62.00   50.50   2030;
M 64    6.00    70.00   58.00   2680;
M 68    6.00    74.00   62.00   0     ]

c_skruv = 

Mb = F_wind * h_tower;

Mtot = Fax*(0.16*Pitch + 0.58*my_thread  )




