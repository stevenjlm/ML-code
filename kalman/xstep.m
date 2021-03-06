% 
%     ECE 594E HW 4
%           Kalman particle filter
%     Step forward in state

function x=xstep(Model,Sim)
xt=Sim.xs(Sim.t-1,:);
ut=Sim.us(Sim.t-1,:);
vt=normrnd(Model.muXs,sqrt(Model.sigmaXs),[1,Sim.N]);
x=1/2*xt+1/2*ut+vt;
end