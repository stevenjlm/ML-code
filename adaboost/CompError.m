% 
%     ECE 594E HW 4
%           Neural Network
%     Compute the error


function Et = CompError(h,TrainData0,TrainData1,dataWeights,iClassifier)
nPts=size(TrainData0,1);


%Decisions=h{iClassifier,3}*bsxfun(@plus,TrainData0(:,1),-h{iClassifier,1});
Decisions=ht(h,TrainData0,iClassifier);

% Test for correct decisions
errors=~(sign(Decisions)==-1);
Et=sum(dataWeights(1:nPts).*errors);

Decisions=ht(h,TrainData1,iClassifier);

% For train Data 0, the result should be positive if h{iClassifier,3}
% is one.
errors=~(sign(Decisions)==1);
Et=Et+sum(dataWeights(nPts+1:2*nPts).*errors);

% x-Axis is classifier
% if ~(h{iClassifier,1}==0)
%     %Decisions=h{iClassifier,3}*bsxfun(@plus,TrainData0(:,1),-h{iClassifier,1});
%     Decisions=ht(h,TrainData0(:,1),iClassifier);
%     
%     % For train Data 0, the result should be negative if h{iClassifier,3}
%     % is one.
%     errors=~(sign(Decisions)==-1);
%     Et=sum(dataWeights(1:nPts).*errors);
%     
%     Decisions=h{iClassifier,3}*bsxfun(@plus,TrainData1(:,1),-h{iClassifier,1});
%     
%     % For train Data 0, the result should be positive if h{iClassifier,3}
%     % is one.
%     errors=~(sign(Decisions)==1);
%     Et=Et+sum(dataWeights(nPts+1:2*nPts).*errors);
% % y-axis classifier
% else
%     Decisions=h{iClassifier,3}*bsxfun(@plus,TrainData0(:,2),-h{iClassifier,2});
%     
%     % For train Data 0, the result should be negative if h{iClassifier,3}
%     % is one.
%     errors=~(sign(Decisions)==-1);
%     Et=sum(dataWeights(1:nPts).*errors);
%     
%     Decisions=h{iClassifier,3}*bsxfun(@plus,TrainData1(:,2),-h{iClassifier,2});
%     
%     % For train Data 1, the result should be positive if h{iClassifier,3}
%     % is one.
%     errors=~(sign(Decisions)==1);
%     Et=Et+sum(dataWeights(nPts+1:2*nPts).*errors);
% end
end