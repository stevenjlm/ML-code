% 
%     ECE 594E HW 4
%           Bootstrap particle filter
%     Plot Simulation and Filter results

function plot_sim_filter (Sim,Filter)
t=1:Sim.T;

figure;
plot(t,mean(Sim.xs,2),'-r');
titleForPlot=['x states for ', Filter.name, ' and ', Sim.name];
title(titleForPlot);

hold on;
plot(t,mean(Filter.xbars,2),'-b');
hold off
legend('Ground Truth','Filter Estimate');
xlabel('time');
end