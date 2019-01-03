function SeisInfo(hd,clcu_info)
delta=hd{1,1}(1,1);
STLA=hd{1,1}(32,1);    %  Station latitude (degrees, north positive).
STLO=hd{1,1}(33,1);    %  Station longitude (degrees, east positive).
EVLA=hd{1,1}(36,1);    %  Event latitude (degrees, north positive). 
EVLO=hd{1,1}(37,1);    %  Event longitude (degrees, east positive). 
EVDP=hd{1,1}(39,1);    %  Event Depth(km).
ST=hd{1,1}(71:76,1);   %  Time corresponding to reference (zero) time in file.
NPTS=hd{1,1}(80,1);    %  Number of points per data component.
KSTNM=hd{2,1};         %  Station name.
KCMPNM=hd{22,1};       %  Component name.
KNETWK=hd{23,1};       %  Name of seismic network.
StartData=hd{26,1};    
StartTime=hd{27,1}; 
%  ��̨վ�͵����¼��ľ�γ��ת��Ϊ�ַ�����
%  ��γ��ֵ����0ʱ����ʾ��γ������ֵ����0ʱ��ʾ������
if (STLA > 0)  %  �ж�̨վγ��
    STLA=[num2str(STLA),'N'];
elseif (STLA < 0) 
    STLA=[num2str(STLA),'S'];
else  
    STLA=num2str(STLA);
end
if (EVLA > 0)  %  �жϵ����¼�γ��
    EVLA=[num2str(EVLA),'N'];
elseif (EVLA < 0) 
    EVLA=[num2str(EVLA),'S'];
else  
    EVLA=num2str(EVLA);
end
if (STLO > 0)  %  �ж�̨վ����
    STLO=[num2str(STLO),'E'];
elseif (STLO < 0) 
    STLO=[num2str(STLO),'W'];
else  
    STLO=num2str(STLO);
end
if (EVLO > 0)  %  �жϵ����¼�����
    EVLO=[num2str(EVLO),'E'];
elseif (EVLO < 0) 
    EVLO=[num2str(EVLO),'W'];
else  
    EVLO=num2str(EVLO);
end
index=clcu_info(12);
if (index == 0)
    msg='';
elseif (index == 1)
    msg='This event is within the range of shear wave window.';
elseif (index == 2)
    msg='This event is not within the range of shear wave window.';
end
%  �趨��ͨ�Ի���Ĳ���Position������
ParentPos=get(gcbf,'Position');  %  gcbf��ʾ����ִ�е�Callback��Ӧ�Ķ������ڴ��ڵľ������handles.figure1�ľ��
xoffset=ParentPos(1)+0.29122807*ParentPos(3);
yoffset=ParentPos(2)+0.15517241*ParentPos(4);
%  ������ͨ�Ի���
hdialog=dialog('Name','Information','Units','pixels','Position',[xoffset yoffset 356 520]);
delete(get(hdialog,'Children'));
uicontrol('Style','text','Units','pixels','Position',[35 100 350 400],...
          'FontWeight','bold','FontSize',10,'Parent',hdialog,...
          'HorizontalAlignment','left','String',...
          {['Network:',32,32,KNETWK],...
           ['Station Name:',32,32,KSTNM],...
           ['Component Name:',32,32,KCMPNM],...
           ['Station Latitude:',32,32,STLA],...
           ['Station Longitude:',32,32,STLO],...
           ['Samples:',32,32,num2str(NPTS)],...
           ['SPS:',32,32,num2str(1/delta)],...
           ['Start Data:',32,32,StartData],...
           ['Start Time:',32,32,num2str(StartTime)],...
           ['Event Latitude:',32,32,EVLA],...
           ['Event Longitude:',32,32,EVLO],...
           ['Event Depth:',32,32,num2str(EVDP/1000),'(km)'],...
           '----------------------------------------------',...
           ['Epicentral Distance:',32,32,num2str(clcu_info(7)),'(km)'],...
           ['Azimuth:',32,32,num2str(clcu_info(8))],...
           ['Inverse Azimuth:',32,32,num2str(clcu_info(9))],...
           ['Take-off Angle:',32,32,num2str(clcu_info(10))],...
           msg,...
           '----------------------------------------------',...
           ['Signal to Noise Ratio:',32,32,num2str(clcu_info(11))],...
           ['Zero Drift Elimination Counter:',32,32,num2str(clcu_info(3))],...
           ['Linear Drift Elimination Counter:',32,32,num2str(clcu_info(4))],...
           ['Integral Counter:',32,32,num2str(clcu_info(5))],...
           ['Differential Counter:',32,32,num2str(clcu_info(6))]});
uicontrol('Units','pixels','Position',[105 20 80 40],'FontSize',10,...
           'Parent',hdialog,'FontWeight','bold','String','OK','Callback','delete(gcf)');
movegui(hdialog);  %  ȷ���Ի����������Ļ��
       

       
       