% 
%     ECE 594E HW 4
%           Neural Network
%     Compute the error


function Et = CompError(h,TrainData0,TrainData1,dataWeights,iClassifier)


%Decisions=h{iClassifier,3}*bsxfun(@plus,TrainData0(:,1),-h{iClassifier,1});
Decisions=predict(h{iClassifier,1},TrainData0(:,1:2));

% Test for correct decisions
errors=~(Decisions<0);
%Et=sum(dataWeights(1:nPts).*abs(Decisions).*errors);
Et=sum(exp(2*errors-1));

Decisions=predict(h{iClassifier,1},TrainData1(:,1:2));

% For train Data 0, the result should be positive if h{iClassifier,3}
% is one.
errors=~(Decisions>0);
%Et=Et+sum(dataWeights(nPts+1:2*nPts).*abs(Decisions).*errors);
Et=Et+sum(exp(2*errors-1));

end