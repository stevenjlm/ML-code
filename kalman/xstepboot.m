% 
%     ECE 594E HW 4
%           Kalman particle filter
%     Step forward in state

function x=xstepboot(Model,Sim)
xt=Sim.xs(Sim.t-1,:);
vt=normrnd(Model.muXs,sqrt(Model.sigmaXs),[1,Sim.N]);
x=1/2*xt+vt;
end