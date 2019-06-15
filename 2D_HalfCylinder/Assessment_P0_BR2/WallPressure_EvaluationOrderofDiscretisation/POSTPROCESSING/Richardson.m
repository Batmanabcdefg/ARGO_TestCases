% Richardson Extrapolation
clf
% Pressure Wall

D1=importdata('Pressure_Wall_N.dat');
D2=importdata('Pressure_Wall_2N.dat');
D3=importdata('Pressure_Wall_4N.dat');
D4=importdata('Pressure_Wall_8N.dat');

p_N = D1.data(:,4);  %80 elements 
p_2N = D2.data(:,4); %160 elements
p_4N = D3.data(:,4); %320 elements
p_8N = D4.data(:,4); %640 elements

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R I C H A R D S O N
p_4Nbis = p_4N(1:2:length(p_4N));
p_8Nbis = p_8N(1:4:length(p_8N));

eps12 = norm(p_2N - p_4Nbis,2);
eps23 = norm(p_4Nbis - p_8Nbis,2);
%eps12 = sqrt(sum((p_2Nbis - p_4Nbis).^2))
%eps23 = sqrt(sum((p_4Nbis - p_8Nbis).^2))

p1 = log(eps12/eps23)/log(2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Erreur pressure stagnation point
pexact = 31472;
pN = p_N(40);
p2N = p_2N(80);
p4N = p_4N(160);
p8N = p_8N(320);

ErrN  = (pexact - pN);
Err2N = (pexact - p2N);
Err4N = (pexact - p4N);
Err8N = (pexact - p8N);

ErrN/Err2N
Err2N/Err4N
Err4N/Err8N

% PLOTS
N = 80;
xx  = [N 2*N 4*N 8*N];
xx1 = linspace(N,8*N,100);
yy = [ErrN Err2N Err4N Err8N ];


p = polyfit(log10(xx),log10(yy),1)
f=@(x)(p(1)*x+p(2));

clf
plot(log10(xx),log10(yy),'X','LineWidth',2)
grid on
hold on 
plot(log10(xx), f(log10(xx)),'r:','LineWidth',1.5)
ylabel('Error [Pa] (log_1_0 scale)')
xlabel('Number of cells along the wall (log_1_0 scale)')
legend('Error', 'y = -0.9x + 5.3')
title('Pressure error at the stagnation point')

angle = linspace(-pi/2,pi/2,length(p_N));
angle1 = linspace(-pi/2,pi/2,length(p_2N));
angle2 = linspace(-pi/2,pi/2,length(p_4N));
angle3 = linspace(-pi/2,pi/2,length(p_8N));

% figure(1)
% plot(angle,p_N,'b:','LineWidth',1.7)
% hold on 
% plot(0,31472,'xr','LineWidth',2.5)
% grid on
% ylabel('Pressure wall [Pa]')
% xlabel('Angle [radian]')
% legend('Argo', 'Reference')
% xlim([-pi/2 pi/2])
% ylim([12000 32000])
% title('80 elements')
% 
% figure(2)
% plot(angle1,p_2N,'b:','LineWidth',1.7)
% hold on 
% plot(0,31472,'xr','LineWidth',2.5)
% grid on
% ylabel('Pressure wall [Pa]')
% xlabel('Angle [radian]')
% legend('Argo', 'Reference')
% xlim([-pi/2 pi/2])
% ylim([12000 32000])
% title('160 elements')
% 
% figure(3)
% plot(angle2,p_4N,'b:','LineWidth',1.7)
% hold on 
% plot(0,31472,'xr','LineWidth',2.5)
% grid on
% ylabel('Pressure wall [Pa]')
% xlabel('Angle [radian]')
% legend('Argo', 'Reference')
% xlim([-pi/2 pi/2])
% ylim([12000 32000])
% title('320 elements')
% 
% figure(4)
% plot(angle3,p_8N,'b:','LineWidth',1.7)
% hold on 
% plot(0,31472,'xr','LineWidth',2.5)
% grid on
% ylabel('Pressure wall [Pa]')
% xlabel('Angle [radian]')
% legend('Argo', 'Reference')
% xlim([-pi/2 pi/2])
% ylim([12000 32000])
% title('640 elements')