P=3;
N = length(ytrain);
svec = ytrain( (P+1):N );
Sfirstcolumn = ytrain( P:(N-1) );
Sfirstrow = ytrain( P:-1:1 );
S = toeplitz( Sfirstcolumn , Sfirstrow );
als = pinv(S' * S)*S'*svec;
Als = [1
    -als];
x=filter(Als,1,y);
plot(x), title('x signal')