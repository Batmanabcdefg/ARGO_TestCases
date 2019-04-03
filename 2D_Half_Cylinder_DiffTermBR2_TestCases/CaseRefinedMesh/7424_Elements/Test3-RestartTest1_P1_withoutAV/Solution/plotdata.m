%Matlab script

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R E S I D U A L 

R=importdata('residual_restart.dat'); %iteration/ wall time/ residual norm / cfl
x_r = R.data(:,1);
r = R.data(:,3);
cfl = R.data(:,4);

figure(3)
yyaxis left
semilogy(x_r,r,'.')
ylim([0 10^(10)]) 
ylabel('Residual Norm L_2 (log_1_0 scale) ')
xlabel('Iteration')

yyaxis right
semilogy(x_r, cfl,'.')
ylim([0 10^(5)])
ylabel('CFL')








