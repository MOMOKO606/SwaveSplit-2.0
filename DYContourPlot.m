function DYContourPlot(h,x,cmax,cmin)
%  �ھ��Ϊh��axes�ϻ�����Ƕȱ仯�����ֵͼ
axes(h);
plot(x,cmax,x,cmin);
xlabel('Degree/��','Units','normalized','FontSize',12,'Position',[0.49748 -0.07 0]);
ylabel('Correlation Coefficient','FontSize',12);
set(h,'Visible','on');