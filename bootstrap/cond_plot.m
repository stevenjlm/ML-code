% 
%     ECE 594E HW 4
%           Bootstrap particle filter
%     Plot Probability distribution p(x_t | y_{1:t})

n=1:100;
t=[10,50,100];

for i=1:3
    x=bPF.xs(t(i),:);
    [x,Ind]=sort(x);
    w=bPF.ws(t(i),:);
    w=w(Ind);
    figure;
    plot(x,w,'-b');
    title(['p(x_{t} | y_{1:t}) at time ', num2str(t(i))]);
end