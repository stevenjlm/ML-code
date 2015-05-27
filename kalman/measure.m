% 
%     ECE 594E HW 5
%           Bootstrap particle filter
%     y_{t} compute

function y= measure(Model,Sim)
y=1/2*Sim.xs(Sim.t,:) + normrnd(Model.muEt, sqrt(Model.sigmaEt), [1,Sim.N]);
end