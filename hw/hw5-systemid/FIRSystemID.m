% This is similar to AR signal but we observe both the input x (Q-order) and 
% output y (P-order)
load('FIRSystemIDHwkData.mat')
N=length(x);
P = 0; % A has 0 order
Q = 8; 
L = max(P,Q);
yvec= y((L+1):N);
xFirstCol = x((L+1):N);
xFirstRow = x((L+1):(-1):(L-Q+1));
X=toeplitz(xFirstCol,xFirstRow);
% since we are dong FIR system ID, we ignore Y=toeplitz(yFirstCol,yFirstRow);
D=X;
theta = pinv(D)*yvec;
A=1;
B=theta