function h=ContourPlot2(x,y,c,maxd,maxt,maxcoef)
%  �ھ��Ϊh��axes�ϻ������ֵ��ֵ��ͼ
h=figure('Visible','off');
set(h,'Units','Normalized','Position',[0,0,1,1]);  %  ����figure���
ha=axes;
set(ha,'Units','Normalized','Position',[0.08,0.11,0.83,0.815]);  %  ����ͼ����figure�е�λ��
[~,hc]=contour(x,y,abs(c));
xlabel('Degree/��','Units','normalized','FontSize',12,'Position',[0.49748 -0.07 0]);
ylabel('Time/s','FontSize',12);
set(hc,'ShowText','on','TextStep',get(hc,'LevelStep')*2);
hold on  %  ������ֵ��ͼ
plot(hc,maxd,maxt,'r.');  %  ��������ֵ�����ƺ�ɫ�Ǻ�
text(maxd,maxt,num2str(maxcoef));  %  ��������ֵ��д���ֵ�Ĵ�С

