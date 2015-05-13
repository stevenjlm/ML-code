% 
%     HW#3 ECE 594E
%           Kernalized Logistic Regression
%     Main Running Script
%     Parameters: l -> hyperparameter
%	         lambda -> regularization parameter
%                ns -> Number of training samples to take per class
%             steps -> Number of steps to complete

%     Steven Munn

clear; clc; close all; % Tabula rasa

% Script parameters
l=.1;
lambda=0;
ns=200;
Nsteps=50;

% Depedant parameters
N=2*ns;

% Load and assign Data
load('hw3_class1.mat');
load('hw3_class0.mat');

X=samples_class1(1:ns,:)';
t=ones(ns,1);

X=[X,samples_class0(1:ns,:)'];
t=[t;zeros(ns,1)];

% Initialize learning model
a=.1*ones(N,1);

% Plot variables
CostFunctionVals=zeros(Nsteps,1);

% Training
for iStep=1:Nsteps
    % Classification probabilities
    y=ClassProb(a,X,l);
    
    % Cost function value (debugging only)
    CostFunctionVals(iStep) = CostFunction(y,t,a,X,lambda,l);
    
    % Cost function gradient
    DelEmap = CostGradient(t,a,X,y,l,lambda);
    
    % Cost function Hessian Matrix
    H=Hessian(X,y,lambda,l);
    
    % Update learning model
    aNext=NewtonStep(a,H,DelEmap);
    
    if abs(sum(a-aNext)) < .001
        break;
    else
        a=aNext;
    end
end

% Testing for 1's
Xtest1=samples_class1(ns+1:end,:)';
zStar=a'*Kernel(X,Xtest1,l);
yStar=1./(1+exp(-zStar'));

% Error rate 1's
tpredict=round(yStar);
E=sum((1-tpredict).^2);
disp('Error percent rate for t=1 is');
Erate=E/((1000-ns))*100;
disp(Erate);

% Testing for 0's
Xtest1=samples_class0(ns+1:end,:)';
zStar=a'*Kernel(X,Xtest1,l);
yStar=1./(1+exp(-zStar'));

% Error rate 0's
tpredict=round(yStar);
E=sum((0-tpredict).^2);
disp('Error percent rate for t=0 is');
Erate=E/((1000-ns))*100;
disp(Erate);

% Plots
% Cost function vs step
plot(CostFunctionVals);