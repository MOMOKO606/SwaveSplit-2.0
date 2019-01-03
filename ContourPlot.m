function ContourPlot(h,x,y,c,maxd,maxt,maxcoef)
%  �ھ��Ϊh��axes�ϻ������ֵ��ֵ��ͼ
axes(h);
[A,hc]=contour(x,y,abs(c));
xlabel('Degree/��','Units','normalized','FontSize',12,'Position',[0.49748 -0.07 0]);
ylabel('Time/s','FontSize',12);
set(hc,'ShowText','on','TextStep',get(hc,'LevelStep')*2);
hold on  %  ������ֵ��ͼ
plot(hc,maxd,maxt,'r.');  %  ��������ֵ�����ƺ�ɫ�Ǻ�
text(maxd,maxt,num2str(maxcoef));  %  ��������ֵ��д���ֵ�Ĵ�С
set(h,'Visible','on');


