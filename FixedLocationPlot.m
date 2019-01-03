function FixedLocationPlot(h,hd,ts,tf,maxt,maxd)
%  在句柄为h的axes上绘制相对位置图；
reptdata1=[];
reptdata2=[];
%  获得台站名称、台站和地震事件的经纬度。
temp(1)=hd{1,1}(33,1);    %  Station longitude (degrees, east positive).
temp(2)=hd{1,1}(32,1);    %  Station latitude (degrees, north positive).
temp(3)=hd{1,1}(37,1);    %  Event longitude (degrees, east positive). 
temp(4)=hd{1,1}(36,1);    %  Event latitude (degrees, north positive). 
KSTNM=hd{2,1};         %  Station name.
%  取用户输入的时间延迟范围绝对值的1/2倍，作为时间图例的长度。
if (ts < 0)
    temp(5)=tf/2;
else
    temp(5)=(tf-ts)/2;
end
temp(6)=maxt;
temp(7)=maxd;
%  更新绘图参数reptdata1、reptdata2。
reptdata1=[reptdata1,temp'];
reptdata2=strvcat(reptdata2,KSTNM);
%  计算台站地震位置分布图的坐标范围。
[xmin,xmax,ymin,ymax]=Boundary(reptdata1);
%  计算图例、所测时间延迟的长度及位置等参数。
lgdx1=xmin+(xmax-xmin)*0.75;  %  图例x坐标起始点
lgdx2=xmin+(xmax-xmin)*0.9;  %  图例x坐标终止点
lgdy1=ymin+(ymax-ymin)*0.1;  %  图例y坐标起始点
lgdy2=lgdy1+(ymax-ymin)*0.01;  %  图例y坐标终止点
lgd_length=(lgdx2-lgdx1);  %  图例时间延迟长度
%  绘图
axes(h);
xlabel('Longitude(deg.)','FontSize',12);
ylabel('Latitude(deg.)','FontSize',12);
%  在图右下角绘制图例。
plot([lgdx1,lgdx2],[lgdy1,lgdy1],'b',[lgdx1,lgdx1],[lgdy1,lgdy2],'b',...
    [lgdx2,lgdx2],[lgdy1,lgdy2],'b');
text((lgdx1+lgdx2)/2,lgdy1,[num2str(max(reptdata1(5,:))),'s'],'VerticalAlignment','top',...
       'HorizontalAlignment','center');
hold on;
%  得到矩阵列数n，n也表示n组数据点，即循环n次。
n=size(reptdata1,2); 
for i=1:n
    slong=reptdata1(1,i);
    slati=reptdata1(2,i);
    elong=reptdata1(3,i);
    elati=reptdata1(4,i);
    ep_length=(reptdata1(6,i)*lgd_length)/max(reptdata1(5,:));  %  所测时间延迟长度（ep：event point）
    d=(180-reptdata1(7,i))*pi/180;  %  角度转换
    epx1=elong+0.5*ep_length*sin(d);  %  所测时间延迟x坐标起点
    epx2=elong-0.5*ep_length*sin(d);  %  所测时间延迟x坐标终点
    epy1=elati-0.5*ep_length*cos(d);  %  所测时间延迟y坐标起点
    epy2=elati+0.5*ep_length*cos(d);  %  所测时间延迟y坐标终点
    %  画出台站位置，用红色实心三角表示，并显示台站名称。
    plot(slong,slati,'r^','MarkerFaceColor','Red');
    text(slong,slati,reptdata2(i,:),'VerticalAlignment','top');
    %  画出地震位置，用蓝色实心小圆表示，蓝线表示时间延迟的方向及大小。
    plot(elong,elati,'o','MarkerFaceColor','Blue','MarkerSize',4);
    plot([epx1,epx2],[epy1,epy2]);
end
%  修改坐标轴范围。
axis([xmin xmax ymin ymax]); 
xlabel('Longitude(deg.)','FontSize',12);
ylabel('Latitude(deg.)','FontSize',12);
set(h,'Visible','on');