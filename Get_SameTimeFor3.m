function Get_SameTimeFor3(handles)
%  ����EW��NS��Z���������
hEW=getappdata(handles.figure1,'hEW');
hNS=getappdata(handles.figure1,'hNS');
hZ=getappdata(handles.figure1,'hZ');
%  ����EW��NS��Z������Ӧ��ͷ�ļ���
h1=getappdata(hEW,'hd');
h2=getappdata(hNS,'hd');
h3=getappdata(hZ,'hd');
%  �������������delta����ȡ6λ��Ч���֡�
delta=h1{1,1}(1,1);
delta=round(delta*1000000)/1000000;  %  ȡ6λ��Ч����
t=zeros(3,3);
%  ��EW��������ʼʱ�����t(1,1:3)��
Str=char(h1(27,1));
t=Str2Time(Str,t,1);
%  ��NS��������ʼʱ�����t(2,1:3)��
Str=char(h2(27,1));
t=Str2Time(Str,t,2);
%  ��Z��������ʼʱ�����t(3,1:3)��
Str=char(h3(27,1));
t=Str2Time(Str,t,3);
%  �ҳ�����ʱ��
remind=[];
for i=1:3
    x=[t(1,i),t(2,i),t(3,i)];
    maxt=max(x);
    y=x( x == maxt );
    if ( length(y) ~= 3 )
        if ( maxt == t(1,i) )
            maxt=1;
            remind=[2,3];
            hd2=hEW;
            hd1=[hNS,hZ];
        elseif ( maxt == t(2,i) )
            maxt=2;
            remind=[1,3];
            hd2=hNS;
            hd1=[hEW,hZ];
        else
            maxt=3;
            remind=[1,2];
            hd2=hZ;
            hd1=[hNS,hEW];
        end
        break
    end
end
%  ������������ʼʱ����ͬʱ������
if ( isempty(remind) )
    return
end
example=t(maxt,:);
%  �ص������ʱ��
for j=1:2
    %  ������ʼʱ��ʱ���
    for i=1:2
        p=t(maxt,i)-t(remind(j),i);
        t(maxt,i+1)=p*60+t(maxt,i+1);
    end
    p=t(maxt,3)-t(remind(j),3);
    %  ��ȡҪ��ȡ�ķ������ݡ�
    stime=getappdata(hd1(j),'stime');
    sdata=getappdata(hd1(j),'sdata');
    hd=getappdata(hd1(j),'hd');
    temp=getappdata(hd1(j),'clcu_info');
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
        jj=(60/para1)*para2*i+1;
        xticklabel{jj,1}=strcat('+',num2str(i*para2),'m');
    end
    %  ��������ͼ��
    set(hplot,'XData',stime);
    set(hplot,'YData',sdata);
    set(hd1(j),'XLim',[min(stime) max(stime)],'XTick',xtick,'XTickLabel',xticklabel);
    %  ����ȡ���stime��sdata���±��档
    setappdata(hd1(j),'stime',stime);
    setappdata(hd1(j),'sdata',sdata);
    setappdata(hd1(j),'hd',hd);
    t(maxt,:)=example;
end








       
    
    
    
    
    
    
