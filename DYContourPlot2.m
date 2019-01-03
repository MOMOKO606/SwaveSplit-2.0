function h=DYContourPlot2(x,cmax,cmin)
%  在句柄为h的axes上绘制随角度变化的相关值图
h=figure('Visible','off');
set(h,'Units','Normalized','Position',[0,0,1,1]);  %  令新figure最大化
ha=axes;
set(ha,'Units','Normalized','Position',[0.08,0.11,0.83,0.815]);  %  调整图像在figure中的位置
plot(x,cmax,x,cmin);
xlabel('Degree/°','Units','normalized','FontSize',12,'Position',[0.49748 -0.07 0]);
ylabel('Correlation Coefficient','FontSize',12);
