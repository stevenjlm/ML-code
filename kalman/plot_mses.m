% 
%     ECE 594E HW 4
%           Bootstrap particle filter
%     Plot MSEs

function plot_mses (gtSim,Kal,Boot)
t=1:gtSim.T;

% Kalman
MSE=bsxfun(@plus,gtSim.xs,-Kal.xs);
MSE=MSE.^2;

figure;
plot(t,MSE,'-k');
titleForPlot='Kalman and Bootstrap MSE';
title(titleForPlot);

% Kalman
MSE=bsxfun(@plus,gtSim.xs,-Boot.xbars);
MSE=mean(MSE.^2,2);

hold on;
plot(t,MSE,'--r');
hold off

legend('Kalman MSE','Bootstrap MSE');
xlabel('time');

end