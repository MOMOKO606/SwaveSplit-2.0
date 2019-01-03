function AscPlot(handles, Filename)
%  AscPlot函数功能：
%  1、绘制由EVT文件解压的ASC文件的地震波形图。
%  2、输出EW、NS、Z三分量波形图。
%  2、将部分计算参数、头文件信息、地震波形图的横坐标时间信息、地震波形图的纵坐标振幅信
%     息（可能是位移、速度、加速度）分别存入对应axes中句柄的Application Data，并分别存为clcu_info,
%     hd,stime,sdata。

%  读入ASC数据
t=importdata(Filename,' ',19);
%  header为文件头
header=t.textdata;
%  三分量波形数据，分别为Z、NS、EW
sdata=t.data;
%  采样间隔、采样点数生成stime
delta=str2num(header{12,1});
npts=str2num(header{17,1});
stime=[0:delta:delta*(npts-1)]';
%  从header中提取起始时间和日期
str=char(header{16,1});  % 从cell转换成char
str=deblank(str);  %  去掉首尾的多余空格
temp=regexp(str,'\s','split');  % 将该行按空格划分为若干个部分
k=1;
for i=1:length(temp)
    if ( ~isempty(temp{1,i}))
        p{1,k}=temp{1,i};
        k=k+1;
    end
end
StartData=[p{1,1},'-',p{1,2},'-',p{1,3}];
StartTime=[p{1,4},'h',p{1,5},'m',p{1,6},'s'];
DataTime=strcat(StartData,32,StartTime);
%  台站名与分量
KSTNM=header{19,1}(10:12);         %  Station name.
COMPO={'N';'NS';'EW'};       %  Component name.
%  三分量增益
str=deblank(header{9,1});
S=regexp(str, '\s+', 'split');
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
%  绘制三分量波形图
for i=1:3
    eval(['h=','handles.axes',num2str(i),';'])
    axes(h);
    hplot=plot(stime,sdata(:,i));
    grid on;                                                              %  打开网格。
    box off;                                                              %  取消边框。
    str=strcat(DataTime,32,32,32,32,32,32,KSTNM,':',COMPO{i,1});   %  str为图名，32为字符串连接时的空格。
    title(str);
    set(h,'XLim',[min(stime) max(stime)],'XTick',xtick,'XTickLabel',xticklabel);
    %  将此文件的数据存入对应的axes中的Application Data。
    %  clcu_info中分别存放：
    %  clcu_info（1）：plot曲线图的句柄hplot；
    %  clcu_info（2）：数据的采样间隔delta；
    %  clcu_info（3）：该曲线图去除零点漂移的次数；
    %  clcu_info（4）：该曲线图去除线性漂移的次数；
    %  clcu_info（5）：该曲线图做积分的次数；
    %  clcu_info（6）：该曲线图求导的次数；
    %  clcu_info（7）：经计算得到的震中矩，初始值为空；
    %  clcu_info（8）：经计算得到的方位角，初始值为空；
    %  clcu_info（9）：经计算得到的反方位角，初始值为空；
    %  clcu_info（10）：经计算得到的离源角，初始值为空；
    %  clcu_info(11)：经计算得到的信噪比，初始值为空；
    %  clcu_info(12)：地震信号是否在横波窗内的标识。初值为0；不满足横波窗内时,值为1；满足横波窗内时,值为2。
    clcu_info=[hplot;delta;zeros(4,1);nan;nan;nan;nan;nan;0];
    %  重建文件头并存入hd中
    t=[delta;zeros(78,1);npts;zeros(20,1)];   
    hd=cell(27,1);
    hd{1,1}=t;  %  生成hd
    gain=str2double(S{1,i});
    hd{1,1}(4,1)=gain; 
    hd{2,1}=KSTNM;
    hd{22,1}=COMPO{i,1};
    hd{23,1}='Unknown';
    hd{26,1}=StartData;
    hd{27,1}=StartTime;
    %  更新axes句柄中的数据
    setappdata(h,'clcu_info',clcu_info);
    setappdata(h,'hd',hd);
    setappdata(h,'stime',stime);
    setappdata(h,'sdata',sdata(:,i));
end
    


