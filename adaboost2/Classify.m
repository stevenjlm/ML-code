% 
%     ECE 594E HW 4
%           Neural Network
%     Load Data in Matrix
%
%     In:  h        -> boolean: map zeros to negatives?
%          Data     -> nDataPts by 2 matrix of training data
%
%     Out: h        -> boolean: map zeros to negatives?
%          Data     -> nDataPts by 2 matrix of training data

function h = Classify(h,TrainData0,TrainData1,dataWeights,iClassifier)

% For zeros,
% Weighted mean
Means0=sum(bsxfun(@times, dataWeights(1:size(TrainData0,1)), TrainData0(:,1:2)));
WeightM0=sum(dataWeights(1:size(TrainData0,1)));
Means0=bsxfun(@rdivide,Means0,sum(dataWeights(1:size(TrainData0(:,1:2),1))));

% For ones
% Weighted mean
Means1=sum(bsxfun(@times, dataWeights(1+size(TrainData0,1):end), TrainData1(:,1:2)));
WeightM1=sum(dataWeights(1+size(TrainData0,1):end));
Means1=bsxfun(@rdivide,Means1,sum(dataWeights(1+size(TrainData0(:,1:2),1):end)));

% variance
Vari=var([TrainData0(:,1:2);TrainData1(:,1:2)],dataWeights);

% Flip the weights?
Decision=1/(WeightM0+WeightM1)*(WeightM0*Means1+WeightM1*Means0).*...
    (abs(Means1-Means0)./Vari==max(abs(Means1-Means0)./Vari));

h{iClassifier,1}=Decision(1);
h{iClassifier,2}=Decision(2);

whichCoord=(abs(Means1-Means0)./Vari==max(abs(Means1-Means0)./Vari));
Means1=Means1*whichCoord';
Means0=Means0*whichCoord';
% This is to decide which class each side belongs to
if Means1>Means0
    h{iClassifier,3}=1;
else
    h{iClassifier,3}=-1;
end

end