function Get_SameTimeFor3(handles)
%  载入EW、NS、Z分量句柄。
hEW=getappdata(handles.figure1,'hEW');
hNS=getappdata(handles.figure1,'hNS');
hZ=getappdata(handles.figure1,'hZ');
%  载入EW、NS、Z分量对应的头文件。
h1=getappdata(hEW,'hd');
h2=getappdata(hNS,'hd');
h3=getappdata(hZ,'hd');
%  将采样间隔存入delta，并取6位有效数字。
delta=h1{1,1}(1,1);
delta=round(delta*1000000)/1000000;  %  取6位有效数字
t=zeros(3,3);
%  将EW分量的起始时间存入t(1,1:3)。
Str=char(h1(27,1));
t=Str2Time(Str,t,1);
%  将NS分量的起始时间存入t(2,1:3)。
Str=char(h2(27,1));
t=Str2Time(Str,t,2);
%  将Z分量的起始时间存入t(3,1:3)。
Str=char(h3(27,1));
t=Str2Time(Str,t,3);
%  找出最大的时间
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
%  当三分量的起始时间相同时结束。
if ( isempty(remind) )
    return
end
example=t(maxt,:);
%  截掉多出的时间
for j=1:2
    %  计算起始时间时间差
    for i=1:2
        p=t(maxt,i)-t(remind(j),i);
        t(maxt,i+1)=p*60+t(maxt,i+1);
    end
    p=t(maxt,3)-t(remind(j),3);
    %  读取要截取的分量数据。
    stime=getappdata(hd1(j),'stime');
    sdata=getappdata(hd1(j),'sdata');
    hd=getappdata(hd1(j),'hd');
    temp=getappdata(hd1(j),'clcu_info');
    hplot=temp(1);
    %  截掉多余的时间,更新stime、sdata数据。
    q=int32(abs(p)/delta+1);
    sdata=sdata(q:end);
    stime=[0:delta:delta*(length(sdata)-1)]';
    %  更新xtick以及xticklabel。
    x=fix(max(stime)/60);  %  计算时间轴经历了几分钟
    if (x <= 6)                para1=10;para2=1;  %  当时间轴小于6分钟时,每10秒1个刻度，每1分钟1个刻度标记
    elseif (x > 6 && x <= 12)  para1=30;para2=1;  %  当时间轴大于6分钟小于12分钟时,每30秒1个刻度，每1分钟1个刻度标记
    else                       para1=60;para2=2;  %  当时间轴大于12分钟时,每1分钟1个刻度，每2分钟1个刻度标记  
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
    %  更新曲线图。
    set(hplot,'XData',stime);
    set(hplot,'YData',sdata);
    set(hd1(j),'XLim',[min(stime) max(stime)],'XTick',xtick,'XTickLabel',xticklabel);
    %  将截取后的stime、sdata重新保存。
    setappdata(hd1(j),'stime',stime);
    setappdata(hd1(j),'sdata',sdata);
    setappdata(hd1(j),'hd',hd);
    t(maxt,:)=example;
end








       
    
    
    
    
    
    
