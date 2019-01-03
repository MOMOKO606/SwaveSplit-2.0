function DYContourPlot(h,x,cmax,cmin)
%  在句柄为h的axes上绘制随角度变化的相关值图
axes(h);
plot(x,cmax,x,cmin);
xlabel('Degree/°','Units','normalized','FontSize',12,'Position',[0.49748 -0.07 0]);
ylabel('Correlation Coefficient','FontSize',12);
set(h,'Visible','on');