% 
%     ECE 594E HW 4
%           Bootstrap particle filter
%     Backward propagation f()

function p=bkf(Model,Sim)
xt=Sim.xs(Sim.t,:);
xtp1=Sim.xs(Sim.t+1,:);
vt=normpdf(xtp1,Model.muXs,sqrt(Model.sigmaXs));
p=1/2*xt+25*xt./(1+xt.^2)+8*cos(1.2*Sim.t)+vt;
end