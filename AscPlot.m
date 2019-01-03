function AscPlot(handles, Filename)
%  AscPlot�������ܣ�
%  1��������EVT�ļ���ѹ��ASC�ļ��ĵ�����ͼ��
%  2�����EW��NS��Z����������ͼ��
%  2�������ּ��������ͷ�ļ���Ϣ��������ͼ�ĺ�����ʱ����Ϣ��������ͼ�������������
%     Ϣ��������λ�ơ��ٶȡ����ٶȣ��ֱ�����Ӧaxes�о����Application Data�����ֱ��Ϊclcu_info,
%     hd,stime,sdata��

%  ����ASC����
t=importdata(Filename,' ',19);
%  headerΪ�ļ�ͷ
header=t.textdata;
%  �������������ݣ��ֱ�ΪZ��NS��EW
sdata=t.data;
%  ���������������������stime
delta=str2num(header{12,1});
npts=str2num(header{17,1});
stime=[0:delta:delta*(npts-1)]';
%  ��header����ȡ��ʼʱ�������
str=char(header{16,1});  % ��cellת����char
str=deblank(str);  %  ȥ����β�Ķ���ո�
temp=regexp(str,'\s','split');  % �����а��ո񻮷�Ϊ���ɸ�����
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
%  ̨վ�������
KSTNM=header{19,1}(10:12);         %  Station name.
COMPO={'N';'NS';'EW'};       %  Component name.
%  ����������
str=deblank(header{9,1});
S=regexp(str, '\s+', 'split');
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
%  ��������������ͼ
for i=1:3
    eval(['h=','handles.axes',num2str(i),';'])
    axes(h);
    hplot=plot(stime,sdata(:,i));
    grid on;                                                              %  ������
    box off;                                                              %  ȡ���߿�
    str=strcat(DataTime,32,32,32,32,32,32,KSTNM,':',COMPO{i,1});   %  strΪͼ����32Ϊ�ַ�������ʱ�Ŀո�
    title(str);
    set(h,'XLim',[min(stime) max(stime)],'XTick',xtick,'XTickLabel',xticklabel);
    %  �����ļ������ݴ����Ӧ��axes�е�Application Data��
    %  clcu_info�зֱ��ţ�
    %  clcu_info��1����plot����ͼ�ľ��hplot��
    %  clcu_info��2�������ݵĲ������delta��
    %  clcu_info��3����������ͼȥ�����Ư�ƵĴ�����
    %  clcu_info��4����������ͼȥ������Ư�ƵĴ�����
    %  clcu_info��5����������ͼ�����ֵĴ�����
    %  clcu_info��6����������ͼ�󵼵Ĵ�����
    %  clcu_info��7����������õ������оأ���ʼֵΪ�գ�
    %  clcu_info��8����������õ��ķ�λ�ǣ���ʼֵΪ�գ�
    %  clcu_info��9����������õ��ķ���λ�ǣ���ʼֵΪ�գ�
    %  clcu_info��10����������õ�����Դ�ǣ���ʼֵΪ�գ�
    %  clcu_info(11)��������õ�������ȣ���ʼֵΪ�գ�
    %  clcu_info(12)�������ź��Ƿ��ںᲨ���ڵı�ʶ����ֵΪ0��������Შ����ʱ,ֵΪ1������Შ����ʱ,ֵΪ2��
    clcu_info=[hplot;delta;zeros(4,1);nan;nan;nan;nan;nan;0];
    %  �ؽ��ļ�ͷ������hd��
    t=[delta;zeros(78,1);npts;zeros(20,1)];   
    hd=cell(27,1);
    hd{1,1}=t;  %  ����hd
    gain=str2double(S{1,i});
    hd{1,1}(4,1)=gain; 
    hd{2,1}=KSTNM;
    hd{22,1}=COMPO{i,1};
    hd{23,1}='Unknown';
    hd{26,1}=StartData;
    hd{27,1}=StartTime;
    %  ����axes����е�����
    setappdata(h,'clcu_info',clcu_info);
    setappdata(h,'hd',hd);
    setappdata(h,'stime',stime);
    setappdata(h,'sdata',sdata(:,i));
end
    


