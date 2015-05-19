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
nClassifiers=50;

% Initialize learning -------------------
h=cell(nClassifiers,1); % Stores all the information for classifiers
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
	h{iClassifier,1}=fitcdiscr([TrainData0(:,1:2);TrainData1(:,1:2)]...
		,[TrainData0(:,3);TrainData1(:,3)],'Weights',dataWeights);
    Et = 1/(2*nTraining)*CompError(h,TrainData0,TrainData1,dataWeights,iClassifier);
    disp(Et);
    hWeights(iClassifier)=1/2*log((1-Et)/(Et));
    
    % Update Data weights
    alphat=1/2*log((1-Et)/(Et));
    yt=[TrainData0(:,3);TrainData1(:,3)];
	Ht=predict(h{iClassifier,1},[TrainData0(:,1:2);TrainData1(:,1:2)]);
    Zt=sum(dataWeights.*exp(-alphat*yt.*Ht));
    dataWeights=1/Zt*dataWeights.*exp(-alphat*yt.*Ht);
end

% Plot data -----------------------------
% Plot decision boundaries and training
plot(TrainData0(:,1),TrainData0(:,2),'xb');
hold on
plot(TrainData1(:,1),TrainData1(:,2),'+r');
for iClassifier=1:nClassifiers
    X=-8:.1:8;
	Y=X*h{iClassifier,1}.Coeffs(1,2).Linear(2)+h{iClassifier,1}.Coeffs(1,2).Linear(1);
	plot(X,Y);
end
hold off
% 
% figure;
% % Plot Classifications
% Data=[TrainData0(:,1:2);TrainData1(:,1:2)];
% Hx = hx(h,Data,hWeights,nClassifiers);
% neg=bsxfun(@times,Data,(Hx<0));
% pos=bsxfun(@times,Data,(Hx>0));
% pos(all(pos==0,2),:)=[];
% neg(all(neg==0,2),:)=[];
% 
% plot(neg(:,1),neg(:,2),'xb');
% hold on
% plot(pos(:,1),pos(:,2),'+r');
% for iClassifier=1:nClassifiers
%     if h{iClassifier,1}==0
%         X=min(Data(:,1)):.1:max(Data(:,1));
%         Y=repmat(h{iClassifier,2},[1 size(X,2)]);
%         plot(X,Y,'-');
%     elseif ~(h{iClassifier,1}==0)
%         Y=min(Data(:,2)):.1:max(Data(:,2));
%         X=repmat(h{iClassifier,1},[1 size(Y,2)]);
%         plot(X,Y);
%     end
% end
% hold off

% Training and test data ----------------
DatatoPlot=[TrainData0;TrainData1];

TotalError=0;
% Plot data points
for iDataPt=1:2*nTraining
	decision=sign(hx(h,...
			DatatoPlot(iDataPt,1:2),hWeights,nClassifiers));
	if ~(decision==DatatoPlot(iDataPt,3))
		TotalError=TotalError+1;
	end
end
disp('Error on training data is (in percentage):');
disp(TotalError/(2*nTraining)*100);



DatatoPlot=[TestData0;TestData1];

TotalError=0;
% Plot data points
for iDataPt=1:2*nTest
	decision=sign(hx(h,...
			DatatoPlot(iDataPt,1:2),hWeights,nClassifiers));
	if ~(decision==DatatoPlot(iDataPt,3))
		TotalError=TotalError+1;
	end
end
disp('Error on testing data is (in percentage):');
disp(TotalError/(2*nTest)*100);