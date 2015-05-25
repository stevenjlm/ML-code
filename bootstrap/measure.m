% 
%     ECE 594E HW 5
%           Bootstrap particle filter
%     y_{t} compute

function y= measure(Model,Sim)
y=1/20*Sim.xs(Sim.t,:)^2 + normrnd(Model.muEt, Model.sigmaEt, [1,Sim.N]);
end