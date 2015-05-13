% 
%     HW#3 ECE 594E
%           Kernalized Logistic Regression
%     Testing cases
%     Parameters: l -> hyperparameter
%            lambda -> regularization parameter

%     -----  Debugged to END  -----------
%
%     Steven Munn

clear; clc; close all; % Tabula rasa

l=1;
lambda=1;
ns=5;

load('hw3_class1.mat');
load('hw3_class0.mat');

X=samples_class0(1:ns,:)';
t=zeros(ns,1);

X=[X,samples_class1(1:ns,:)'];
t=[t;ones(ns,1)];
N=2*ns;

% -----------  Dimensions test  -----------

disp('N is');
disp(N);

disp('1: Expect 2 N and N 1');
size(X) % Expect 2 by 10
size(t) % Expect 10 by 1

% Init a
a=ones(N,1);

% y
[y,z]=ClassProb(a,X,l);
disp('2: Expect N 1');
size(y) % Expect 10 by 1

% Emap
disp('3: Expect scalar');
Emap = CostFunction(y,t,a,X,lambda,l) % Expect Scalar

% DelEmap
disp('4: Expect N by 1');
DelEmap = CostGradient(t,a,X,y,l,lambda);
disp(size(DelEmap));

% Hessian
disp('5: Expect N by N');
H=Hessian(X,y,lambda,l);
disp(size(H));

% Update
disp('6: Expect N by 1');
aNext=NewtonStep(a,H,DelEmap);
disp(size(aNext,2));
disp(aNext);

%% ----------- Values check -----------
disp('Checking calculation values');
a=[1;1];
X=[0,2;0,2];
x=[1;1];
l=1/sqrt(2);

% Kernel -- Pass
disp('Expect 2 by 1 matrix with entries exp(-1/2)=0.1353');
K=Kernel(X,x,l)

% z decision -- NP
disp('7: Expect 1 twice vertically');
[~,z]=ClassProb(a,X,l);
disp(z);