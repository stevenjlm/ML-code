% 
%     ECE 594E HW 4
%           Neural Network
%     Make a decision regarding a variable or matrix of vars

function Hx = hx(h,Data,hWeights,nClassifiers)
Hx=zeros(size(Data,1),1);
% for iClassifier=1:nClassifiers
%     if ~(h{iClassifier,1}==0)
%         Hxt=bsxfun(@plus,Data(:,1),-h{iClassifier,1});
%         Hxt=hWeights(iClassifier)*h{iClassifier,3}*sign(Hxt);
%         Hx=Hx+Hxt;
%     else
%         Hxt=bsxfun(@plus,Data(:,2),-h{iClassifier,2});
%         Hxt=hWeights(iClassifier)*h{iClassifier,3}*sign(Hxt);
%         Hx=Hx+Hxt;
%     end
% end
for iClassifier=1:nClassifiers
    Hxt=hWeights(iClassifier)*predict(h{iClassifier,1},Data(:,1:2));
    Hx=Hx+sign(Hxt);
end
%Hx=tanhyp(Hx);
Hx=sign(Hx);
end