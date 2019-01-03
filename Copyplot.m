function Copyplot(orih,copyh)
%  从被复制的句柄h中取出参数
stime=getappdata(orih,'stime');
sdata=getappdata(orih,'sdata');
hd=getappdata(orih,'hd');
%  从头文件中读入所需参数。
delta=hd{1,1}(1,1);
KSTNM=hd{2,1};         %  Station name.
KCMPNM=hd{22,1};       %  Component name.
KNETWK=hd{23,1};       %  Name of seismic network.
StartData=hd{26,1};
StartTime=hd{27,1};
%  定义xtick以及xticklabel。
x=fix(max(stime)/60);  %  计算时间轴经历了几分钟
if (x <= 6)                para1=10;para2=1;  %  当时间轴小于6分钟时,每10秒1个刻度，每1分钟1个刻度标记
elseif (x > 6 && x <= 12)  para1=30;para2=1;  %  当时间轴大于6分钟小于12分钟时,每30秒1个刻度，每1分钟1个刻度标记
else                       para1=60;para2=2;  %  当时间轴大于12分钟时,每1分钟1个刻度，每2分钟1个刻度标记  
end
y=fix(max(stime)/para1);
xtick=[0:para1:y*para1];
xticklabel=cell(y+1,1);
xticklabel{1,1}=StartTime;
for i=1:x/para2
    j=(60/para1)*para2*i+1;
    xticklabel{j,1}=strcat('+',num2str(i*para2),'m');
end
%  绘制地震波形图。
if (isempty(StartData) ~= 1)
    DataTime=strcat(StartData,32,StartTime);
else
    DataTime=[];  %  当读取ASCII文件时，StartData为空值，此时将DataTime也定义为空值。
end
str=strcat(DataTime,32,32,32,32,32,32,KNETWK,':',KSTNM,':',KCMPNM);   %  str为图名，32为字符串连接时的空格。
axes(copyh);
plot(stime,sdata);
grid on;                                                              %  打开网格。
box off;                                                              %  取消边框。
title(str);
set(copyh,'XLim',[min(stime) max(stime)],'XTick',xtick,'XTickLabel',xticklabel);
 %  更新axes句柄中的数据
setappdata(copyh,'hd',hd);
setappdata(copyh,'stime',stime);
setappdata(copyh,'sdata',sdata);
