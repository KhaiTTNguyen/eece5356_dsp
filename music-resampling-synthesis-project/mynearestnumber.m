function xnearest = mynearestnumber( x , numberlist)

tmp = abs( numberlist - x);
[minval , Imin] = min(tmp);
xnearest = numberlist(Imin);
