function ContourPlot(h,x,y,c,maxd,maxt,maxcoef)
%  在句柄为h的axes上绘制相关值等值线图
axes(h);
[A,hc]=contour(x,y,abs(c));
xlabel('Degree/°','Units','normalized','FontSize',12,'Position',[0.49748 -0.07 0]);
ylabel('Time/s','FontSize',12);
set(hc,'ShowText','on','TextStep',get(hc,'LevelStep')*2);
hold on  %  锁定等值线图
plot(hc,maxd,maxt,'r.');  %  在最大相关值处绘制红色星号
text(maxd,maxt,num2str(maxcoef));  %  在最大相关值处写相关值的大小
set(h,'Visible','on');


