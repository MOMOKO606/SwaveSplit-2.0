function t = Str2Time(Str,t,i)
%  函数功能：将表示时间的字符串Str转为数字存放到t的第i行中

k=1;
while ( Str(k) ~= 'h')
    k=k+1;
end
t(i,1)=str2num(Str(1:k-1));
k=k+1;
p=k;
while ( Str(k) ~= 'm')
    k=k+1;
end
t(i,2)=str2num(Str(p:k-1));
k=k+1;
p=k;
while ( Str(k) ~= 's')
    k=k+1;
end
t(i,3)=str2num(Str(p:k-1));