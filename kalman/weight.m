% 
%     ECE 594E HW 5
%           Bootstrap particle filter
%     Compute weights

function w= weight ( Filter)
t=Filter.t;
y=Filter.ys(t);
w=normpdf(y,1/2*Filter.xs(t,:),sqrt(Filter.sigmaWeight));
w=w/(sum(sum(w)));
end