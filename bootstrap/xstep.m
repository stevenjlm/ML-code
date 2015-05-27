% 
%     ECE 594E HW 4
%           Bootstrap particle filter
%     Step forward in state

function x=xstep(Model,Sim)
xt=Sim.xs(Sim.t-1,:);
vt=normrnd(Model.muXs,sqrt(Model.sigmaXs),[1,Sim.N]);
x=1/2*xt+25*xt./(1+xt.^2)+8*cos(1.2*Sim.t)+vt;
end