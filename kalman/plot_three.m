% 
%     ECE 594E HW 4
%           Bootstrap particle filter
%     Plot GT, Kalman, and BS

function plot_three (gtSim,Kal,Boot)
t=1:gtSim.T;

figure;
plot(t,mean(gtSim.xs,2),'--r');
titleForPlot='GT, Kalman, and Bootstrap';
title(titleForPlot);

hold on;
plot(t,Kal.xs,'-k');
plot(t,mean(Boot.xbars,2),':b');
hold off

legend('GT','Kalman','Bootstrap');
xlabel('time');

end