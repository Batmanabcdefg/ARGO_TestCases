%Matlab script
% %_________________________________________
% % Plot the Density at the wall
% D=importdata('Density_Wall.dat');
% x_d = D.data(:,1);
% angle = linspace(-pi/2,pi/2,length(x_d));
% d = D.data(:,4);
% figure(1)
% subplot(2,2,1)
% plot(angle,d,'b:','LineWidth',1.7)
% grid on
% grid minor
% ylabel('Density [kg·m^−^2]')
% xlabel('Angle [radian]')
% xlim([-pi/2 pi/2])
% 
% %_________________________________________
% % Plot the Velocity at the wall
% D=importdata('Velocity_Wall.dat');
% x_v = D.data(:,1);
% angle = linspace(-pi/2,pi/2,length(x_v));
% V = D.data(:,4);
% 
% subplot(2,2,2)
% plot(angle,abs(V),'b:','LineWidth',1.7)
% grid on
% grid minor
% ylabel('Absolute Velocity [m/s]')
% xlabel('Angle [radian]')
% xlim([-pi/2 pi/2])
% %_________________________________________
% % Plot the Pressure at the wall
% 
% P=importdata('Pressure_Wall.dat');
% x_p = P.data(:,1);
% angle = linspace(-pi/2,pi/2,length(x_p));
% p = P.data(:,4);
% 
% subplot(2,2,3)
% plot(angle,p,'b:','LineWidth',1.7)
% grid on
% grid minor
% ylabel('Pressure [Pa]')
% xlabel('Angle [radian]')
% xlim([-pi/2 pi/2])
% 
% %_________________________________________
% % Plot the Temperature at the wall
% D=importdata('Temperature_Wall.dat');
% x_T = D.data(:,1);
% angle = linspace(-pi/2,pi/2,length(x_T));
% T = D.data(:,4);
% 
% subplot(2,2,4)
% plot(angle,T,'b:','LineWidth',1.7)
% grid on
% grid minor
% ylabel('Temperature [K]')
% xlabel('Angle [radian]')
% xlim([-pi/2 pi/2])



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R E S I D U A L 

R=importdata('residual.dat'); %iteration/ wall time/ residual norm / cfl
x_r = R.data(:,1);
r = R.data(:,3);
cfl = R.data(:,4);

fig = figure(2);
left_color = [0 0 0];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);


yyaxis left
semilogy(x_r,r,'b-','LineWidth',1.5)

%ylim([0 10^(10)]) 
ylabel('Residual Norm L_2 (log_1_0 scale) ')
xlabel('Iteration')

yyaxis right
semilogy(x_r, cfl,'r--','LineWidth',1.7)
%ylim([0 10^(5)])
ylabel('CFL')
grid on
grid minor
legend('Norm L² residual','CFL')

