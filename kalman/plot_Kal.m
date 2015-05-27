% 
%     ECE 594E HW 4
%           Bootstrap particle filter
%     Plot Kalman and Ground truth
function plot_Kal (gtSim,Filter)
t=1:gtSim.T;

figure;
plot(t,gtSim.xs,'--r');
titleForPlot='Kalman Filter';
title(titleForPlot);

hold on;
plot(t,Filter.xs,'-k');
hold off

legend('GT','Kalman Filter');
xlabel('time');

end