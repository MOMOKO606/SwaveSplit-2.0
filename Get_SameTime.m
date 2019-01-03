function Get_SameTime(handles)
%  ����EW��NS���������
hEW=getappdata(handles.figure1,'hEW');
hNS=getappdata(handles.figure1,'hNS');
%  ����EW��NS������Ӧ��ͷ�ļ���
h1=getappdata(hEW,'hd');
h2=getappdata(hNS,'hd');
%  �������������delta����ȡ6λ��Ч���֡�
delta=h1{1,1}(1,1);
delta=round(delta*1000000)/1000000;  %  ȡ6λ��Ч����
%  ��EW��������ʼʱ�����t1��
t1=zeros(1,3);
Str=char(h1(27,1));
t1=Str2Time(Str,t1,1);
%  ��NS��������ʼʱ�����t2��
t2=zeros(1,3);
Str=char(h2(27,1));
t2=Str2Time(Str,t2,1);
%  ����EW��NS������ʼʱ��ʱ��
for i=1:2
    p=t1(i)-t2(i);
    t1(i+1)=p*60+t1(i+1);
end
p=t1(3)-t2(3);
%  ���ݼ������ʱ��������¼��ʼʱ�����ķ������������ʱ�䲿�ֽص���
if (p > 0)
    hd1=hNS;
    hd2=hEW;
elseif (p < 0)
    hd1=hEW;
    hd2=hNS;
else
    return
end
%  ��ȡҪ��ȡ�ķ������ݡ�
stime=getappdata(hd1,'stime');
sdata=getappdata(hd1,'sdata');
hd=getappdata(hd1,'hd');
temp=getappdata(hd1,'clcu_info');
hplot=temp(1);
%  �ص������ʱ��,����stime��sdata���ݡ�
q=int32(abs(p)/delta+1);
sdata=sdata(q:end);
stime=[0:delta:delta*(length(sdata)-1)]';
%  ����xtick�Լ�xticklabel��
x=fix(max(stime)/60);  %  ����ʱ���ᾭ���˼�����
if (x <= 6)                para1=10;para2=1;  %  ��ʱ����С��6����ʱ,ÿ10��1���̶ȣ�ÿ1����1���̶ȱ��
elseif (x > 6 && x <= 12)  para1=30;para2=1;  %  ��ʱ�������6����С��12����ʱ,ÿ30��1���̶ȣ�ÿ1����1���̶ȱ��
else                       para1=60;para2=2;  %  ��ʱ�������12����ʱ,ÿ1����1���̶ȣ�ÿ2����1���̶ȱ��  
end
y=fix(max(stime)/para1);
xtick=[0:para1:y*para1];
xticklabel=cell(y+1,1);
str=get(hd2,'XTickLabel');
hd{27,1}=char(str(1));
xticklabel{1,1}=char(str(1));
for i=1:x/para2
    j=(60/para1)*para2*i+1;
    xticklabel{j,1}=strcat('+',num2str(i*para2),'m');
end
%  ��������ͼ��
set(hplot,'XData',stime);
set(hplot,'YData',sdata);
set(hd1,'XLim',[min(stime) max(stime)],'XTick',xtick,'XTickLabel',xticklabel);
%  ����ȡ���stime��sdata���±��档
setappdata(hd1,'stime',stime);
setappdata(hd1,'sdata',sdata);
setappdata(hd1,'hd',hd);
       
    
    
    
    
    
    
