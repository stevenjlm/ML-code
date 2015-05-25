% 
%     ECE 594E HW 5
%           Bootstrap particle filter
%     Initialize state x_{1}

function x= initx1 ( Model, Sim)
x=normrnd(Model.muXini, Model.sigmaXini, [1,Sim.N]);
end
