% 
%     ECE 594E HW 4
%           Neural Network
%     Make a decision regarding a variable or matrix of vars at time t


function Ht = ht_old(h,Data,iClassifier)
if ~(h{iClassifier,1}==0)
    Ht=bsxfun(@plus,Data(:,1),-h{iClassifier,1});
    Ht=h{iClassifier,3}*sign(Ht);
else
    Ht=bsxfun(@plus,Data(:,2),-h{iClassifier,2});
    Ht=h{iClassifier,3}*sign(Ht);
end
end