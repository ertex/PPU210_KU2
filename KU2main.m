%% hej
%KU2 grupp 7F
clear('all'); close; clc
P 			= 2.5e6; 		% Power to the system
v 			= 20; 			% [m/s] Wind speed
h_tower 	= 110; 			% [m] height of the tower
d_hole 		= 4; 			% [m] holepattern diameter
d_tower 	= d_hole+0.130;	% Tower outer diameter
t_flange 	= 0.15; 		% [m] flange thickness
w_flange 	= 0.19; 		% Flange width
my_WB 		= [0.10 0.40]; 	% (0.10-0.40) Friction between washer and bolt
my_thread 	= [0.07 0.35]; 	% (0.07-0.35) Frction in the thread
sigma_utm 	= 30e6; 		% [Pa] iff bolt >= M36
sigma_s		= 8e8*0.8		% [Pa] For 8.8 class screws
E 			= 206e9; 		% [Pa] Youngs modulus of steel
n_screws 	= 118;			% Number of swrews
F_0 		= 2e5;  		% [N] Pretension of the screw
delta_pl 	= 35e-6;		% Embedding distance

%index 1=M24 2=M30 3=M36 4=M42 5=M48 6=M56
%index 1=Pitch 2=out_dia 3=avg_dia 4=inner_dia 5=d_h 6=d_bw 7=dww
Bolt = 1e-3 * [
3   24 22.051 20.752 28 33.61 44;
3.5 30 27.727 26.211 35 45.75 56;
4   36 33.402 31.670 42 51.11 66;
4.5 42 39.077 37.129 48 59.95 78;
5   48 44.752 42.587 56 69.45 92;
5.5 56 52.428 50.046 66 78.66 105];
Bolt_c = 6;  %what bolt is choosen
B_dw = Bolt(Bolt_c, 7);
B_dh = Bolt(Bolt_c, 5);
A_sp = pi/16*(Bolt(Bolt_c,3) + Bolt(Bolt_c,4) - Bolt(Bolt_c,1)*sqrt(3)/12);


c_s = E * (pi*Bolt(Bolt_c, 2)^2 /4) / (2*t_flange);	% = E_s*A_s/L_k
% Maskinelement 2.15 - 2.17:
x = (2*t_flange*B_dw/w_flange^2)^(1/3);
A_ekv = pi/4*(B_dw^2-B_dh^2) + pi/8 *(w_flange-B_dw)*B_dw *((x+1)^2 - 1);
c_k = E*A_ekv/(2*t_flange);	% = E_k*A_k/L_k

F_0pl = F_0-delta_pl/(1/c_s+1/c_k);	% Embedding

%% Forces on the connection
F_wind = P/(v*0.75);
M_b = F_wind * h_tower;
alpha = 2*pi/n_screws;
F_N = sin([alpha:alpha:2*pi]);
F_N = F_N * M_b/(d_hole*sum(F_N(1:n_screws/2)));
F_s = F_0+c_s/(c_s+c_k).*F_N;
F_k = F_s - F_N;

% Stresses in the screws. F/(pi/4 * D^2)
sigma_max = max(F_s)/A_sp;
sigma_m = F_0/A_sp;
sigma_a = (max(F_s)-F_0)/A_sp;

% elongations
delta_0s = F_0/c_s;
delta_0 = delta_0s * (c_s+c_k)/c_k;
delta_s = F_s/c_s;

% F/delta plots
s = @(delta) delta*c_s;
k = @(delta) delta_0s*(c_s+c_k) - delta*c_k;

hold on
ylim([0 max(F_k)])
fplot(s,[0 delta_0], 'LineWidth', 2)
fplot(k,[0 delta_0], 'LineWidth', 2)
plot([0 delta_0s],[F_0 F_0],'--k')
plot([0 max(delta_s)],[max(F_s) max(F_s)],'--k')
plot([0 min(delta_s)],[min(F_s) min(F_s)],'--k')
plot([0 max(delta_s)],[min(F_k) min(F_k)],'--k')
for i = 1:n_screws
	plot([delta_s(i) delta_s(i)],[F_k(i) F_s(i)])%,'-k', 'LineWidth', 2)
end

if n_screws*B_dw > d_hole*pi
	fprintf(2,'not enough space for that many bolted joints!\n')
end
if sigma_a > sigma_utm
	fprintf(2, 'fatigue limit is passed!\n')
end
if sigma_max > sigma_s
	fprintf(2, 'plastic deformation in screws!\n')
end

M_tot = F_0*(0.16*Bolt(Bolt_c,1) + 0.58*my_thread*Bolt(Bolt_c,3)...
	+ my_WB*(Bolt(Bolt_c,6)+Bolt(Bolt_c,4))/4);
