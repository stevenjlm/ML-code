% 
%     ECE 594E HW 4
%           Bootstrap particle filter
%     Plot a simulation

function plot_sim (Sim)
t=1:Sim.T;

figure;
plot(t,mean(Sim.xs,2),'-r');
titleForPlot=['x and y states for ', Sim.name];
title(titleForPlot);

hold on;
plot(t,Sim.ys,'-b');
hold off

xlabel('time')
legend('x_{t}','y_{t}');

end