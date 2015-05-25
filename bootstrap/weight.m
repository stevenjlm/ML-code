% 
%     ECE 594E HW 5
%           Bootstrap particle filter
%     Compute weights

function w= weight ( Filter)
t=Filter.t;
y=Filter.ys(t);
w=normpdf(y,1/20*Filter.xs(t,:).^2,Filter.sigmaWeight);
w=w/(sum(sum(w)));
end