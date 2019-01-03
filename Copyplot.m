function Copyplot(orih,copyh)
%  �ӱ����Ƶľ��h��ȡ������
stime=getappdata(orih,'stime');
sdata=getappdata(orih,'sdata');
hd=getappdata(orih,'hd');
%  ��ͷ�ļ��ж������������
delta=hd{1,1}(1,1);
KSTNM=hd{2,1};         %  Station name.
KCMPNM=hd{22,1};       %  Component name.
KNETWK=hd{23,1};       %  Name of seismic network.
StartData=hd{26,1};
StartTime=hd{27,1};
%  ����xtick�Լ�xticklabel��
x=fix(max(stime)/60);  %  ����ʱ���ᾭ���˼�����
if (x <= 6)                para1=10;para2=1;  %  ��ʱ����С��6����ʱ,ÿ10��1���̶ȣ�ÿ1����1���̶ȱ��
elseif (x > 6 && x <= 12)  para1=30;para2=1;  %  ��ʱ�������6����С��12����ʱ,ÿ30��1���̶ȣ�ÿ1����1���̶ȱ��
else                       para1=60;para2=2;  %  ��ʱ�������12����ʱ,ÿ1����1���̶ȣ�ÿ2����1���̶ȱ��  
end
y=fix(max(stime)/para1);
xtick=[0:para1:y*para1];
xticklabel=cell(y+1,1);
xticklabel{1,1}=StartTime;
for i=1:x/para2
    j=(60/para1)*para2*i+1;
    xticklabel{j,1}=strcat('+',num2str(i*para2),'m');
end
%  ���Ƶ�����ͼ��
if (isempty(StartData) ~= 1)
    DataTime=strcat(StartData,32,StartTime);
else
    DataTime=[];  %  ����ȡASCII�ļ�ʱ��StartDataΪ��ֵ����ʱ��DataTimeҲ����Ϊ��ֵ��
end
str=strcat(DataTime,32,32,32,32,32,32,KNETWK,':',KSTNM,':',KCMPNM);   %  strΪͼ����32Ϊ�ַ�������ʱ�Ŀո�
axes(copyh);
plot(stime,sdata);
grid on;                                                              %  ������
box off;                                                              %  ȡ���߿�
title(str);
set(copyh,'XLim',[min(stime) max(stime)],'XTick',xtick,'XTickLabel',xticklabel);
 %  ����axes����е�����
setappdata(copyh,'hd',hd);
setappdata(copyh,'stime',stime);
setappdata(copyh,'sdata',sdata);
