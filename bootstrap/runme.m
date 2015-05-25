% 
%     ECE 594E HW 4
%           Bootstrap particle filter
%     Main script

% Ground truth (State Space) Model Parameters ---
gtModel.N=1;
gtModel.T=20;

% X initialization paramters
% Here x_{1} ~ N(0,1)
gtModel.muXini=0;
gtModel.sigmaXini=1;

% Ground truth simulation -----------------------
gtSim.xs=zeros(gtModel.T,1);
gtSim.xs(1)=initx1(gtModel);
for t=1:gtModel.T
	