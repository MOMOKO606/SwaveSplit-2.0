function str1=Trans2Str(x,k)
str0=x;
m=length(str0);  
t=str0(m-19:m);  %  creation time
num=num2str(k);  %  No.
event=deblank(str0(1:m-20));  %  recent history
%  创建一个65字符的空字符串
str1(1:85)='.';
%  将creation time，No.，recent history插入
str1(66:85)=t;
str1(10:9+length(event))=event;
str1(1:length(num))=num(1:length(num));