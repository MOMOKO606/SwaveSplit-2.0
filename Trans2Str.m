function str1=Trans2Str(x,k)
str0=x;
m=length(str0);  
t=str0(m-19:m);  %  creation time
num=num2str(k);  %  No.
event=deblank(str0(1:m-20));  %  recent history
%  ����һ��65�ַ��Ŀ��ַ���
str1(1:85)='.';
%  ��creation time��No.��recent history����
str1(66:85)=t;
str1(10:9+length(event))=event;
str1(1:length(num))=num(1:length(num));