% 
%     ECE 594E HW 5
%           Bootstrap particle filter
%     Resample unweighted

function x= resample ( Filter)
xs=Filter.xs(Filter.t,:);
ws=Filter.ws(Filter.t,:);
cumulativeDistribution=cumsum(ws);
randSamples=rand(Filter.N,1); % Column vector
indexMatrix=repmat(1:Filter.N,[Filter.N,1]);
gtFun=bsxfun(@gt,cumulativeDistribution,randSamples);
Samples=indexMatrix.*gtFun;
% Below is a trick to not need a for loop
Samples(Samples==0)=Filter.N+100;
Samples=min(Samples,[],2)';
x=xs(Samples);
end