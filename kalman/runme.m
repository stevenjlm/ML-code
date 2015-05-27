% 
%     ECE 594E HW 5
%           Kalman and Bootstrap particle filter
%     Main script

clear;clc;

% Ground truth (State Space) Model Parameters ---

% General parameters
gtModel.plotGt=0;
gtModel.plotKal=1;
gtModel.plotPF=1;

% X initialization paramters
% Here x_{1} ~ N(0,1)
gtModel.muXini=0;
gtModel.sigmaXini=1;

% Measurement parameters
gtModel.muEt=0;
gtModel.sigmaEt=.1;

% State evolution parameters
gtModel.muXs=0;
gtModel.sigmaXs=0.5;

% Control Sequence params
gtModel.muUs=0;
gtModel.sigmaUs=1;

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

% Initialize control sequence
gtSim.us=normrnd(gtModel.muUs, sqrt(gtModel.sigmaUs), [gtSim.T,1]);

for t=2:gtSim.T
    gtSim.t=t;
	gtSim.xs(t)=xstep(gtModel,gtSim);
    gtSim.ys(t,1)=measure(gtModel,gtSim);
end

% Plot simulation results -----------------------
if gtModel.plotGt==1
    plot_sim(gtSim);
end

% Kalman Filter ---------------------------------
% Parameters
kFil.name = 'Kalman Filter';
kFil.T = 100;
kFil.N=1;

% Initialize variables
kFil.xs=zeros(kFil.T,1);
kFil.Ps=zeros(kFil.T,1);
kFil.us=gtSim.us;
kFil.ys=gtSim.ys;

% Initialize filter
kFil.t=1;
kFil.xs(1,1)=initx1(gtModel, kFil);
kFil.Ps(1,1)=gtModel.sigmaXs;
[kFil.xs(t,1),kFil.Ps(t,1)]=...
        measurement_update(gtModel,kFil);

for t=2:kFil.T
    kFil.t=t;
	[kFil.xs(t,1),kFil.Ps(t,1)]=...
        time_update(gtModel,kFil);
    [kFil.xs(t,1),kFil.Ps(t,1)]=...
        measurement_update(gtModel,kFil);
end

% Plot Kalman filter and ground truth -----------
if gtModel.plotKal==1
    plot_Kal(gtSim,kFil);
end

% Bootstrap Particle Filter ---------------------
% Parameters
bPF.name = 'Bootstrap PF';
bPF.useControl=1;
bPF.N=100;
bPF.T=100;

bPF.sigmaWeight=gtModel.sigmaEt; % Equation 5.15 Schon

% Initialize variables
bPF.xs=zeros(bPF.T,bPF.N);
bPF.xbars=zeros(bPF.T,bPF.N);
bPF.ws=zeros(bPF.T,bPF.N);
if bPF.useControl==1
    bPF.us=gtSim.us;
end

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
    if bPF.useControl==0
        bPF.xs(t,:)=xstepboot(gtModel,bPF);
    else
        bPF.xs(t,:)=xstep(gtModel,bPF);
    end
    bPF.ws(t,:)=weight(bPF);
end
bPF.xbars(t,:)=resample(bPF);

% Plot Particle filter results ------------------
if gtModel.plotPF==1
    plot_three(gtSim,kFil,bPF);
end
% 
% % Backward Particle filter ----------------------
% bPF.M=50;
% 
% % Initialize backwards trajectories
% bPF.xjs=zeros(bPF.T,bPF.M);
% bPF.xjs(bPF.T,:)=back_resample( bPF);
% 
% for t=(bPF.T-1):-1:1
% 	% For each backwards trajectory, find the particle in x_{t-1}
% 	% that best explains the particle x_{t}
% 	for j=1:bPF.M
% 		% \tilde{w}_{t|T}^{i,j} is represented here as a 1 by N
% 		% matrix to improve computation
% 		% These weights can be discarded as they would cost too
% 		% much memory
% 		bPF.t=t;
% 		weightij_tT=bPF.ws(t,:).*bkf( gtModel, bPF);
% 		%Normalize
% 		weightij_tT=weightij_tT/(sum(sum(weightij_tT)));
% 		
% 		% Sample
% 		xt=bPF.xs(bPF.t,:);
% 		cumulativeDistribution=cumsum(weightij_tT);
% 		randSamples=rand(1,1); % Column vector
% 		indexMatrix=1:bPF.N;
% 		gtFun=bsxfun(@gt,cumulativeDistribution,randSamples);
% 		Samples=indexMatrix.*gtFun;
% 		% Below is a trick to not need a for loop
% 		Samples(Samples==0)=bPF.M+100;
% 		Samples=min(Samples,[],2)';
% 		bPF.xjs(bPF.t,j)=xt(Samples);
% 	end
% end
% 
% % Plot trajectory -------------------------------
% trajectory=bPF.xjs(:,3);
% t=1:bPF.T;
% plot(t,trajectory,'-r');