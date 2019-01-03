function OutFigs(DefaultPath,Q,p)
%  �������ܣ�����Q����������ͼ
n=length(p);
for i=1:n
    k=p(i);
    %  ����hd
    hd=Q{k,2};
    maxcoef=hd{28,1};
    maxd=hd{29,1};
    maxt=hd{30,1};   
    %  �����ļ���
    filename=Q{k,1};
    filename=deblank(filename(1:30));
    %  ������ֵ��ͼ
    x=cell2mat(Q{k,4}(1));
    y=cell2mat(Q{k,4}(2));
    c=cell2mat(Q{k,4}(3));
    h=ContourPlot2(x,y,c,maxd,maxt,maxcoef);
    set(h,'Visible','on');           %  ��Ҫ��figure��Visible��������Ϊ�ɼ�������򿪱���õ�ͼʱ����Ļ��ʲô��������֡�    
    FileName=[num2str(i),'_',filename,'_Contour.fig'];  %  �����ļ���
    saveas(h,fullfile(DefaultPath,FileName));  %  �����ļ�
    close(h);  %  �ر�ͼ��
    %  ���������С���ϵ��ͼ
    cmin=Q{k,5}(1,:);
    cmax=Q{k,5}(2,:);
    h=DYContourPlot2(x,cmax,cmin);
    set(h,'Visible','on');           %  ��Ҫ��figure��Visible��������Ϊ�ɼ�������򿪱���õ�ͼʱ����Ļ��ʲô��������֡�    
    FileName=[num2str(i),'_',filename,'_Corr.fig'];  %  �����ļ���
    saveas(h,fullfile(DefaultPath,FileName));  %  �����ļ�
    close(h);  %  �ر�ͼ��
    %  ����λ��ͼ
    t3=Q{k,6}(6);
    t4=Q{k,6}(7);
    t3=char(t3);
    t4=char(t4);
    ts=str2num(t3);
    tf=str2num(t4);
    h=FixedLocationPlot2(hd,ts,tf,maxt,maxd);
    set(h,'Visible','on');           %  ��Ҫ��figure��Visible��������Ϊ�ɼ�������򿪱���õ�ͼʱ����Ļ��ʲô��������֡�    
    FileName=[num2str(i),'_',filename,'_Loca.fig'];  %  �����ļ���
    saveas(h,fullfile(DefaultPath,FileName));  %  �����ļ�
    close(h);  %  �ر�ͼ��
end