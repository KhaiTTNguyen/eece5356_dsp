p = 3; % 3rd order
N=length(ytrain);

ytrain_v = ytrain((p+1):N);
ytrainFirstCol = ytrain(p:(N-1));
ytrainFirstRow=ytrain(p:(-1):1);
Ytrain=toeplitz(ytrainFirstCol,ytrainFirstRow);
ahls=pinv(Ytrain)*ytrain_v
A=[1 
    -ahls];
x = filter(A,1,y);
