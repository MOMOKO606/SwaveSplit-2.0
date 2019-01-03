function h=ContourPlot2(x,y,c,maxd,maxt,maxcoef)
%  在句柄为h的axes上绘制相关值等值线图
h=figure('Visible','off');
set(h,'Units','Normalized','Position',[0,0,1,1]);  %  令新figure最大化
ha=axes;
set(ha,'Units','Normalized','Position',[0.08,0.11,0.83,0.815]);  %  调整图像在figure中的位置
[~,hc]=contour(x,y,abs(c));
xlabel('Degree/°','Units','normalized','FontSize',12,'Position',[0.49748 -0.07 0]);
ylabel('Time/s','FontSize',12);
set(hc,'ShowText','on','TextStep',get(hc,'LevelStep')*2);
hold on  %  锁定等值线图
plot(hc,maxd,maxt,'r.');  %  在最大相关值处绘制红色星号
text(maxd,maxt,num2str(maxcoef));  %  在最大相关值处写相关值的大小

