% 
%     ECE 594E HW 5
%           Bootstrap particle filter
%     Main script

clear;clc;

% Ground truth (State Space) Model Parameters ---

% General parameters
gtModel.plotGt=0;
gtModel.plotPF=0;

% X initialization paramters
% Here x_{1} ~ N(0,1)
gtModel.muXini=0;
gtModel.sigmaXini=1;

% Measurement parameters
gtModel.muEt=0;
gtModel.sigmaEt=.5;

% State evolution parameters
gtModel.muXs=0;
gtModel.sigmaXs=0.5;

% Ground truth simulation -----------------------
% Parameters
gtSim.name = 'Ground truth Simulation';
gtSim.N=1;
gtSim.T=100;

% Initialize
gtSim.xs=zeros(gtSim.T,1);
gtSim.xs(1,1)=initx1(gtModel, gtSim);
gtSim.t=1;
gtSim.ys(1,1)=measure(gtModel,gtSim);

for t=2:gtSim.T
    gtSim.t=t;
	gtSim.xs(t)=xstep(gtModel,gtSim);
    gtSim.ys(t)=measure(gtModel,gtSim);
end

% Plot simulation results -----------------------
if gtModel.plotGt==1
    plot_sim(gtSim);
end

% Bootstrap Particle Filter ---------------------
% Parameters
bPF.name = 'Bootstrap PF';
bPF.N=100;
bPF.T=100;

bPF.sigmaWeight=0.5; % Equation 5.15 Schon

% Initialize variables
bPF.xs=zeros(bPF.T,bPF.N);
bPF.xbars=zeros(bPF.T,bPF.N);
bPF.ws=zeros(bPF.T,bPF.N);

% Initialize filter
bPF.ys=gtSim.ys;
bPF.xs(1,:)=initx1(gtModel,bPF);
bPF.t=1;
bPF.ws(1,:)=weight(bPF);

for t=2:bPF.T
    bPF.t=t-1;
	bPF.xbars(t-1,:)=resample(bPF);
    
    % Propagate
    bPF.t=t;
    bPF.xs(t,:)=xstep(gtModel,bPF);
    bPF.ws(t,:)=weight(bPF);
end
bPF.xbars(t,:)=resample(bPF);

% Plot Particle filter results ------------------
if gtModel.plotPF==1
    plot_sim_filter(gtSim,bPF);
end

% Backward Particle filter ----------------------
bPF.M=50;

% Initialize backwards trajectories
bPF.xjs=zeros(bPF.T,bPF.M);
bPF.xjs(bPF.T,:)=back_resample( bPF);

