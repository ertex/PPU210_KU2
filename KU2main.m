%% hej
%KU2 grupp 7F
P = 2.5e6; %Power to the system
v = 20; % wind speed
h_tower = 110; %m height of the tower
d_hole = 4; % m holepattern diameter
t_flange = 0.15; %m flange thickness
R_a = 7.5e-6; %surface 
n_max = 0.75; %max usable power from windspeed
sigma_utm = 30e6; %if and only if bolt >= M36
my_WB = [0.10 0.40]; %(0.10 - 0.40) Friction between washer and bolt
my_thread =  [0.07 0.35]; %(0.07-0.35) Frction in the thread
w_flange = 190e-3; %flange width
d_tower = 2*(d_hole/2 + 0.065) %Tower outer diameter
Pitch = 1.5; %Bolt Pitch
E = 206e9; % Pa Youngs modulus of steel
n_screws = 36;	% number of swrews
%index 1=M24 2=M27 3=M30 4=M36 5=M42 6=M48 7=M56
%index 1=Pitch 2=out_dia 3=avg_dia 4=inner_dia 5=d_h 6=d_bw 7=dww
Bolt = [
3   24 22.051 20.752 28 33.61 44;
3.5 30 27.727 26.211 35 45.75 56;
4   36 33.402 31.670 42 51.11 66;
4.5 42 39.077 37.129 48 59.95 78;
5   48 44.752 42.587 56 69.45 92;
5.5 56 52.428 50.046 66 78.66 105];
Bolt_c = 3;  %what bolt is choosen
B_dw = Bolt(Bolt_c, 7);
B_dh = Bolt(Bolt_c, 5);

c_s = E * (pi*Bolt(Bolt_c, 2)^4 /4) / (2*t_flange);	% = E_s*A_s/L_k
% Maskinelement 2.15 - 2.17:
x = ((2*t_flange*B_dw)/(w_flange)^2)^(1/3);
A_ekv = pi/4*(d_bw^2-d_bh^2) + pi/8 *(w_flange-B_dw)*B_dw *((x+1)^2 - 1);
c_k = E*A_ekv/(2*t_flange);	% = E_k*A_k/L_k

%% Forces on the connection
F_wind = P/(v*n_max);
M_b = F_wind * h_tower;
alpha = 2*pi/n_screws;
F_N = sin([alpha:alpha:2*pi]);
F_N = F_N * M_b/(d_hole*sum(F_N(1:n_screws/2)));

% F/delta plots
s = @(delta) delta*c_s;
k = @(delta) delta_0s*(c_s+c_k) - delta*c_k;
delta_0 = delta_0s * (c_s+c_k)/c_k;

fplot(s,[0 delta_0])
fplot(k,[delta_0s delta_0])
plot([0 delta_0],[s(delta_0s) s(delta_0s)])





M_tot = F_ax*(0.16*Bolt(Bolt_c,1) + 0.58*my_thread*Bolt(Bolt_c,3) + my_WB*(Bolt(Bolt_c,6) + Bolt(Bolt_c,4))/4);
