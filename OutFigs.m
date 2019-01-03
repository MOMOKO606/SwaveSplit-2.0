function OutFigs(DefaultPath,Q,p)
%  函数功能：根据Q矩阵输出结果图
n=length(p);
for i=1:n
    k=p(i);
    %  载入hd
    hd=Q{k,2};
    maxcoef=hd{28,1};
    maxd=hd{29,1};
    maxt=hd{30,1};   
    %  载入文件名
    filename=Q{k,1};
    filename=deblank(filename(1:30));
    %  创建等值线图
    x=cell2mat(Q{k,4}(1));
    y=cell2mat(Q{k,4}(2));
    c=cell2mat(Q{k,4}(3));
    h=ContourPlot2(x,y,c,maxd,maxt,maxcoef);
    set(h,'Visible','on');           %  需要将figure的Visible属性设置为可见，否则打开保存好的图时，屏幕上什么都不会出现。    
    FileName=[num2str(i),'_',filename,'_Contour.fig'];  %  创建文件名
    saveas(h,fullfile(DefaultPath,FileName));  %  保存文件
    close(h);  %  关闭图像
    %  创建最大最小相关系数图
    cmin=Q{k,5}(1,:);
    cmax=Q{k,5}(2,:);
    h=DYContourPlot2(x,cmax,cmin);
    set(h,'Visible','on');           %  需要将figure的Visible属性设置为可见，否则打开保存好的图时，屏幕上什么都不会出现。    
    FileName=[num2str(i),'_',filename,'_Corr.fig'];  %  创建文件名
    saveas(h,fullfile(DefaultPath,FileName));  %  保存文件
    close(h);  %  关闭图像
    %  创建位置图
    t3=Q{k,6}(6);
    t4=Q{k,6}(7);
    t3=char(t3);
    t4=char(t4);
    ts=str2num(t3);
    tf=str2num(t4);
    h=FixedLocationPlot2(hd,ts,tf,maxt,maxd);
    set(h,'Visible','on');           %  需要将figure的Visible属性设置为可见，否则打开保存好的图时，屏幕上什么都不会出现。    
    FileName=[num2str(i),'_',filename,'_Loca.fig'];  %  创建文件名
    saveas(h,fullfile(DefaultPath,FileName));  %  保存文件
    close(h);  %  关闭图像
end