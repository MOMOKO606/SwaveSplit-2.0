function h=DYContourPlot2(x,cmax,cmin)
%  �ھ��Ϊh��axes�ϻ�����Ƕȱ仯�����ֵͼ
h=figure('Visible','off');
set(h,'Units','Normalized','Position',[0,0,1,1]);  %  ����figure���
ha=axes;
set(ha,'Units','Normalized','Position',[0.08,0.11,0.83,0.815]);  %  ����ͼ����figure�е�λ��
plot(x,cmax,x,cmin);
xlabel('Degree/��','Units','normalized','FontSize',12,'Position',[0.49748 -0.07 0]);
ylabel('Correlation Coefficient','FontSize',12);
