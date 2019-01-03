function output=OutCell(handles,hd,maxt,maxd,maxcoef)
%  输出字符串Txtformat，其内容用于txt格式的报告输出

%  从hd中载入基本信息
STLA=hd{1,1}(32,1);    %  Station latitude (degrees, north positive).
STLO=hd{1,1}(33,1);    %  Station longitude (degrees, east positive).
EVLA=hd{1,1}(36,1);    %  Event latitude (degrees, north positive). 
EVLO=hd{1,1}(37,1);    %  Event longitude (degrees, east positive). 
KSTNM=hd{2,1};         %  Station name.
StartData=hd{26,1};    
StartTime=hd{27,1}; 
ET=[StartData,', ',StartTime];
%  构建基本信息
output{1}='Bisic Information: ';
output{2}=['Station name: ',KSTNM,'   Station longitude: ',num2str(STLO),'   Station latitude: ',num2str(STLA)];
output{3}=['Event time: ',ET,'   Event longitude: ',num2str(STLO),'   Event latitude: ',num2str(STLA)];
output{4}=['  '];
%  从控件中载入用户输入参数
t1=get(handles.edit1,'String');
t2=get(handles.edit2,'String');
temp=str2num(t2)-str2num(t1);
d1=get(handles.edit3,'String');
d2=get(handles.edit4,'String');
d3=get(handles.edit5,'String');
t3=get(handles.edit6,'String');
t4=get(handles.edit7,'String');
t5=get(handles.edit8,'String');
%  构建用户输入参数
output{5}='User''s Input Parameters: ';
output{6}=['Selected ',num2str(temp),' seconds waveform data from ',t1,' s to ',t2,' s.'];
output{7}=['Rotated angle is from ',d1,'° to ',d2,'°, step: ',d3,'°.'];
output{8}=['Delayed time is from ',t3,'s to ',t4,'s, step: ',t5,' s.'];
output{9}=['  '];
%  构建结果
output{10}='Result: ';
output{11}=['The max correlation coefficient: ',num2str(maxcoef),'.'];
output{12}=['Delayed time: ',num2str(maxt),'s.'];
output{13}=['Polarization direction: ',num2str(maxd),'°.'];



