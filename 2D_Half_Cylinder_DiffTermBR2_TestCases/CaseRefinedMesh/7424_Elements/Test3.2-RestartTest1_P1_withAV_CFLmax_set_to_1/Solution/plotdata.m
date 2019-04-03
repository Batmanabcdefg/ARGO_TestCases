%Matlab script

% % Plot the Density at the wall
% D=importdata('Density_Wall.dat');
% x_d = D.data(:,1);
% angle = linspace(-pi/2,pi/2,length(x_d));
% d = D.data(:,4);
% 
% figure(1)
% plot(angle,d,'.')
% ylabel('Density [kg·m^−^2]')
% xlabel('Angle [radian]')
% xlim([-pi/2 pi/2])
% 
% 
% 
% P=importdata('TotalPressure_Wall.dat');
% x_p = P.data(:,1);
% angle = linspace(-pi/2,pi/2,length(x_p));
% p = P.data(:,4);
% 
% figure(2)
% plot(angle,p,'.')
% ylabel('Total Pressure [Pa]')
% xlabel('Angle [radian]')
% xlim([-pi/2 pi/2])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R E S I D U A L 

R=importdata('residual.dat'); %iteration/ wall time/ residual norm / cfl
x_r = R.data(:,1);
r = R.data(:,3);
cfl = R.data(:,4);

figure(1)
yyaxis left
semilogy(x_r,r,'.')
%ylim([0 10^(10)]) 
ylabel('Residual Norm L_2 (log_1_0 scale) ')
xlabel('Iteration')

yyaxis right
semilogy(x_r, cfl,'.')
%ylim([0 10^(5)])
ylabel('CFL')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% H E A T  F L U X
HF=importdata('TestHeatFlux_Wall.dat');
x_hf = HF.data(:,1);
angle = linspace(-pi/2,pi/2,length(x_hf));
hf = HF.data(:,4);

figure(2)
plot(angle,hf,'.')
ylabel('Heat Flux [W.m²]')
xlabel('Angle [radian]')
xlim([-pi/2 pi/2])

