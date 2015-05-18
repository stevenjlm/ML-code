% 
%     ECE 594E HW 4
%           Adaptive Boosting
%     Main running script
%     Parameters: nDataPts -> number data points 50 % use for training
%                          -> rest is for testing
%             nClassifiers -> number of weak classifiers to combine
%                 
%
%     Steven Munn
%           from https://github.com/stevenjlm/ML-code

clear; clc;

% Script parameters ---------------------
nDataPts=400; % must be divisible by 2
nTraining=150; % number of training pts per class
nTest=50;
nClassifiers=9;

% Initialize learning -------------------
h=cell(nClassifiers,3); % Stores all the information for classifiers
dataWeights=ones(nTraining*2,1)/(nTraining*2);
hWeights=zeros(nClassifiers,1);

% Load Data -----------------------------
Data=LoadData(nDataPts,1);
TrainData0=Data(1:nTraining,:);
TrainData1=Data(nDataPts/2+1:(nDataPts/2+nTraining),:);

TestData0=Data(nTraining+1:nDataPts/2,:);
TestData1=Data(nDataPts/2+nTraining+1:end,:);

% Learn ---------------------------------

for iClassifier=1:nClassifiers
    h = Classify(h,TrainData0,TrainData1,dataWeights,iClassifier);
    Et = CompError(h,TrainData0,TrainData1,dataWeights,iClassifier);
    disp(Et);
    hWeights(iClassifier)=1/2*log((1-Et)/Et);
    
    % Update Data weights
    alphat=1/2*log((1-Et)/Et);
    yt=[TrainData0(:,3);TrainData1(:,3)];
    Ht=ht(h,[TrainData0(:,1:2);TrainData1(:,1:2)],iClassifier);
    Zt=sum(dataWeights.*exp(-alphat*yt.*Ht));
    dataWeights=1/Zt*dataWeights.*exp(-alphat*yt.*Ht);
end

% Plot data -----------------------------
% Plot decision boundaries and training
plot(TrainData0(:,1),TrainData0(:,2),'xb');
hold on
plot(TrainData1(:,1),TrainData1(:,2),'+r');
for iClassifier=1:nClassifiers
    if h{iClassifier,1}==0
        X=min(Data(:,1)):.1:max(Data(:,1));
        Y=repmat(h{iClassifier,2},[1 size(X,2)]);
        plot(X,Y,'-');
    elseif ~(h{iClassifier,1}==0)
        Y=min(Data(:,2)):.1:max(Data(:,2));
        X=repmat(h{iClassifier,1},[1 size(Y,2)]);
        plot(X,Y);
    end
end
hold off

figure;
% Plot Classifications
Data=[TrainData0(:,1:2);TrainData1(:,1:2)];
Hx = hx(h,Data,hWeights,nClassifiers);
neg=bsxfun(@times,Data,(Hx<0));
pos=bsxfun(@times,Data,(Hx>0));

plot(neg(:,1),neg(:,2),'xb');
hold on
plot(pos(:,1),pos(:,2),'+r');
for iClassifier=1:nClassifiers
    if h{iClassifier,1}==0
        X=min(Data(:,1)):.1:max(Data(:,1));
        Y=repmat(h{iClassifier,2},[1 size(X,2)]);
        plot(X,Y,'-');
    elseif ~(h{iClassifier,1}==0)
        Y=min(Data(:,2)):.1:max(Data(:,2));
        X=repmat(h{iClassifier,1},[1 size(Y,2)]);
        plot(X,Y);
    end
end
hold off