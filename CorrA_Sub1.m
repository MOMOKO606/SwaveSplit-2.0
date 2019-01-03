function varargout = CorrA_Sub1(varargin)
% CORRA_SUB1 M-file for CorrA_Sub1.fig
%      CORRA_SUB1, by itself, creates a new CORRA_SUB1 or raises the existing
%      singleton*.
%
%      H = CORRA_SUB1 returns the handle to a new CORRA_SUB1 or the handle to
%      the existing singleton*.
%
%      CORRA_SUB1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CORRA_SUB1.M with the given input arguments.
%
%      CORRA_SUB1('Property','Value',...) creates a new CORRA_SUB1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CorrA_Sub1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CorrA_Sub1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CorrA_Sub1

% Last Modified by GUIDE v2.5 27-Jan-2016 15:52:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CorrA_Sub1_OpeningFcn, ...
                   'gui_OutputFcn',  @CorrA_Sub1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before CorrA_Sub1 is made visible.
function CorrA_Sub1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CorrA_Sub1 (see VARARGIN)

%  �������1Ϊ���h���˴�Ϊ������figure�ľ����
h=varargin{1};
%  ����guihandles�������h�������handles�ṹ�塣
handles.MainHandles= guihandles(h);


% Choose default command line output for CorrA_Sub1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CorrA_Sub1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);




% --- Outputs from this function are returned to the command line.
function varargout = CorrA_Sub1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
% --- Executes during object creation, after setting all properties.


function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ���㵱ǰ����ϵx�ᡢy������귶Χ��
xmin=min(get(gca,'XLim'));  
xmax=max(get(gca,'XLim'));
ymin=min(get(gca,'YLim'));
ymax=max(get(gca,'YLim'));
pos=mean(get(gca,'CurrentPoint'));      %  ��õ�ǰ�����ꡣ
%  �жϣ�����ǰ�������ڵ�ǰ����ϵ��Χ�ڣ����ҵ�ǰ��������ͼ�����ǿ�����ϵ��ʱ����ͼ����ͼ����ʾ��ǰ������ꡣ
%  ����ͼ���Ĺ��̣�
%  1�����ȴ���һ�����������ͼ����ʾ�������Ӷ���
%  2�������������Ӷ���Ϊ��0��0���㣬�������䲻�ɼ�����ô����Ϊ���ڴ���ͼ��ʱ����2���ַ�����
%  3��ɾ��ͼ���е��ߣ�����ͼ�����ַ��������ݣ�������ʾ��ǰ�����ꡣ
if ((pos(1,1)-xmin)*(xmax-pos(1,1))>0 && (pos(1,2)-ymin)*(ymax-pos(1,2))>0 && isempty(get(gca,'children'))~=1)  
    h_group=hggroup;                                                                                              
    set(get(get(h_group,'Annotation'),'LegendInformation'),'IconDisplayStyle','children');
    line(0,0,'HitTest','off','Parent',h_group,'Visible','off');
    h_legend=legend(gca,'show');
    delete(findobj(h_legend,'Type','line'));
    h_text=findobj(h_legend,'Type','text');
    set(h_text(1),'Position',[0.1 0.7 0],'String',sprintf('x:%5.2f',pos(1,1)));
    set(h_text(2),'Position',[0.1 0.3 0],'String',sprintf('y:%5.2f',pos(1,2)));
end


% --------------------------------------------------------------------
function Savepic_Callback(hObject, eventdata, handles)
% hObject    handle to Savepic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰ���õĴ洢�ļ�·����
str=getappdata(handles.MainHandles.figure1,'path3');
DefaultPath=[str,'\untitled.fig'];
%  ����ǰҪ����ͼ��ľ������ֵ��hpic�ϡ�
hpic=gca;
%  ����saveasֻ�����figure����ͼ�񣬹���Ҫ����һ����figure��
newfig=figure;
set(newfig,'Visible','off');  %  ���䲻�ɼ�
delete(get(newfig,'Children'));  %  ɾ��figure�ڵ��Ӷ��󣬱����������ص�
%  ��Ҫ�����ͼ���Ƶ���figure�ϡ�
copyobj(hpic,newfig);
set(newfig,'Units','Normalized','Position',[0,0,1,1]);  %  ����figure���
set(gca,'Units','Normalized','Position',[0.08,0.11,0.83,0.815]);  %  ����ͼ����figure�е�λ��
%  ����һ���ļ�����Ի���
[FileName,PathName]=uiputfile(...
{'*.fig','MATLAB Figure(*.fig)';'*.jpg','JPEG image(*.jpg)';...
 '*.bmp','Bitmap file(*.bmp)';'*.tif','TIFF image(*.tif)';'*.*','All Files(*.*)'},...
 'Save As',DefaultPath);
if (FileName == 0)
    %  ���û������ȡ����ʱ���ر��½�figure��������ֹ��
    close(newfig);
    return
else
    set(newfig,'Visible','on');           %  ��Ҫ��figure��Visible��������Ϊ�ɼ�������򿪱���õ�ͼʱ����Ļ��ʲô��������֡�
    saveas(newfig,fullfile(PathName,FileName));
    close(newfig);
end
%  ���´洢�ļ�·����
setappdata(handles.MainHandles.figure1,'path3',PathName);


% --------------------------------------------------------------------
function SaveData_Callback(hObject, eventdata, handles)
% hObject    handle to Savedata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰ���õĴ洢�ļ�·����
str=getappdata(handles.MainHandles.figure1,'path3');
DefaultPath=[str,'\untitled.dat'];
%  ��ȡ��ǰͼ���еķ�ֵ���ݡ�
sdata=getappdata(gca,'sdata');
%  ����һ���ļ�����Ի���
[FileName,PathName]=uiputfile(...
{'*.dat','Golden Software Data(*.dat)';...
 '*.txt','ASCII Data(*.txt)';'*.*','All Files(*.*)'},...
 '�ļ����Ϊ',DefaultPath);
if (FileName == 0)
    %  ���û������ȡ����ʱ��������ֹ��
    return
else
    dlmwrite(fullfile(PathName,FileName),sdata);
end
%  ���´洢�ļ�·����
setappdata(handles.MainHandles.figure1,'path3',PathName);


% --------------------------------------------------------------------
function Copy_Callback(hObject, eventdata, handles)
% hObject    handle to Copy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ����ǰҪ����ͼ��ľ������ֵ��hpic�ϡ�
hpic=gca;
%  ����saveasֻ�����figure����ͼ�񣬹���Ҫ����һ����figure��
newfig=figure;
set(newfig,'Visible','off');  %  ���䲻�ɼ�
delete(get(newfig,'Children'));  %  ɾ��figure�ڵ��Ӷ��󣬱����������ص�
%  ��Ҫ�����ͼ���Ƶ���figure�ϡ�
copyobj(hpic,newfig);
set(newfig,'Units','Normalized','Position',[0,0,1,1]);  %  ����figure���
set(gca,'Units','Normalized','Position',[0.08,0.11,0.83,0.815]);  %  ����ͼ����figure�е�λ��
%  ��ͼ���Ƶ����а塣
hgexport(newfig,'-clipboard');
%  �ر���figure��
close(newfig);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hd=getappdata(handles.axes2,'hd');
t1=hd{1,1}(1,1);
hd=getappdata(handles.axes1,'hd');
t2=hd{1,1}(1,1);
t1=round(t1*1000000)/1000000;  % ����6λ��Ч����
t2=round(t2*1000000)/1000000;  % ����6λ��Ч����
%  ��ȡ�û�����Ľ�ȡʱ�䡣
st=get(handles.edit1,'String');
st=str2num(st);
ct=get(handles.edit2,'String');
ct=str2num(ct);
%  �������ʼ/��ֹʱ��Ϊ�ջ�������ʱ
if ( isempty(st) || isempty(ct)  )
    errordlg('Please re-enter the start/end time .','Error');
end
%  �ж��û�ѡ��ķ���ͼ������Ľ�ȡʱ���Ƿ����Ҫ��
if ( t1 ~= t2 )
    errordlg('Different sampling rate of NS and EW component.','Error');
    return
else
    delta=t1;
    if (mod(st,delta) ~= 0)
        errordlg(['Please re-enter the start time, it should be a multiple of sampling interval which is ',num2str(delta),' .'],'Error');
        return
    elseif (mod(ct,delta) ~= 0)
        errordlg(['Please re-enter the end time, it should be a multiple of sampling interval which is ',num2str(delta),' .'],'Error');
        return
    end
end
if ( st >= ct )
    errordlg('Please re-enter the start/end time .','Error');
end
%  ��ȡ��ʱ������Ϊintcpttime;�����������ΪEWdata;�ϱ��������ΪNSdata��
t1=st/delta+1;
t2=ct/delta+1;
intcpttime=[0:delta:(t2-t1)*delta];
EWdata=getappdata(handles.axes2,'sdata');
EWdata=EWdata(t1:t2);
NSdata=getappdata(handles.axes1,'sdata');
NSdata=NSdata(t1:t2);
%  �����ȡ������ݡ�
setappdata(handles.uipanel1,'intcpttime',intcpttime);
setappdata(handles.uipanel1,'EWdata',EWdata);
setappdata(handles.uipanel1,'NSdata',NSdata);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ͼ������
intcpttime=getappdata(handles.uipanel1,'intcpttime');
EWdata=getappdata(handles.uipanel1,'EWdata');
NSdata=getappdata(handles.uipanel1,'NSdata');
%  û�����ȷ�ϡ��Ĵ�����ʾ��
if ( isempty(intcpttime) == 1)
    errordlg('Please click ''Select'' button first .','Error');
    return
end
%  ���Ƹ��ؼ��ġ�Visible������
set(handles.text20,'Visible','on');
set(handles.text21,'Visible','on');
set(handles.pushbutton7,'Visible','on');
set(handles.pushbutton8,'Visible','on');
%  ��axes4�ϻ��ƽ�ȡ��NS���η�����
axes(handles.axes1);
plot(intcpttime,NSdata);
grid on;                                                             
%  ��axes5�ϻ��ƽ�ȡ��EW���η�����
axes(handles.axes2);
plot(intcpttime,EWdata);
grid on;          
%  �������ݣ�������ͼ�ķ�ֵ�ֱ�浽��Ӧ����ϵ�С�
setappdata(handles.axes1,'Y',NSdata);
setappdata(handles.axes2,'Y',EWdata);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡȫ�ֱ���OutputReport_index��
OutputReport_index=getappdata(handles.MainHandles.figure1,'OutputReport_index');
%  ����EWdata��NSdata���ݡ�
EWdata=getappdata(handles.uipanel1,'EWdata');
NSdata=getappdata(handles.uipanel1,'NSdata');
%  ��������������ȡ6λ��Ч���֡�
hd=getappdata(handles.axes2,'hd');
delta=hd{1,1}(1,1);
delta=round(delta*1000000)/1000000;  %  ȡ6λ��Ч����
%  ��ȡ�û��������ת�Ƕȡ�ʱ���ӳٲ��������ж��Ƿ���á�
[ds,dsl,df]=Get_RotatAngle(handles);
if ((isempty(ds) == 1)||(isempty(dsl) == 1)||(isempty(df) == 1))
    errordlg('Lack of parameters of the rotated angle panel.','Error');
    return
end
[ts,tsl,tf]=Get_DelayTime(handles);
if ((isempty(ts) == 1)||(isempty(tsl) == 1)||(isempty(tf) == 1))
    errordlg('Lack of parameters of the delayed time panel.','Error');
    return
end
%  ��ʱ�����ת��Ϊ��Ӧ�������š�
t1=ts/delta;
t2=tf/delta;
t3=tsl/delta;
if (mod(ts,delta) ~= 0)||(mod(tf,delta) ~= 0)||(mod(tsl,delta) ~= 0)
    errordlg(['Please re-enter the delayed time, it should be a multiple of sampling interval which is ',num2str(delta),' .'],'Error');
    return
end
%  �������ֵ��
[c,cmax,cmin]=Correlation(EWdata,NSdata,ds,dsl,df,t1,t2,t3);
x=[ds:dsl:df];
y=[ts:tsl:tf];
%  ����������ֵ�Լ����Ӧ����ת�Ƕȡ�ʱ���ӳ١�
c=round(c*1e14)/1e14;  % �����ֵȡ14λ��Ч����
maxcoef=max(max(abs(c)));
[i,j]=find(c == maxcoef);
maxt=ts+(i(1)-1)*tsl;
maxd=ds+(j(1)-1)*dsl;
if (maxt < 0)
    maxd=maxd+90;
    if (maxd > 180)
        maxd=maxd-180;
    end
end
%  �򿪽���CorrA_Sub2��CorrA_Sub2���������Ϊ�������figure������������Ϊ�������ӽ��棩��figure�����
h=CorrA_Sub2(handles.figure1,handles.MainHandles.figure1);
%  ����guihandles�������h�������handles�ṹ�塣
CA2Handles=guihandles(h);
%  ������CorrA_Sub2�ṹ��������CorrA_Sub2�ṹ���С�
handles.CA2Handles=CA2Handles;
%  ���½ṹ�塣
guidata(hObject,handles);
%  ��CorrA_Sub2��axes1�ϻ��Ƶ�ֵ��ͼ��
ContourPlot(CA2Handles.axes1,x,y,c,maxd,maxt,maxcoef);
%  ��CorrA_Sub2��axes2�ϻ��Ƶ������С���ֵͼ��
DYContourPlot(CA2Handles.axes2,x,cmax,cmin);
%  ��CorrA_Sub2��axes3�ϻ������λ��ͼ��
FixedLocationPlot(CA2Handles.axes3,hd,ts,tf,maxt,maxd);
%  ���brief report
output=OutCell(handles,hd,maxt,maxd,maxcoef);
%  ת��Ϊ�ַ���
Str=[];
for i=1:13
    Str=strvcat(Str,char(output{i}));
end
set(CA2Handles.edit4,'String',Str,'FontSize',13,'FontWeight','bold');
%  �������
hd{28,1}=maxcoef;
hd{29,1}=maxd;
hd{30,1}=maxt;
setappdata(handles.figure1,'output',output');
setappdata(handles.figure1,'hd',hd);
%  ����ʱ�ļ�'SwaveTempotary2.mat'������head��tail
if ( exist('SwaveTempotary2.mat') )
    load('SwaveTempotary2.mat');
else
    head=1;
    tail=1;
end
%  ����ʱ�ļ�'SwaveTempotary1.mat'���������Q
if ( exist('SwaveTempotary1.mat') )
    load('SwaveTempotary1.mat');
else
    Q=cell(1,9);
end
%  ����Ҫ����Ĳ���
filename=[deblank(hd{2,1}),'_',hd{26,1},'_',hd{27,1}];
filename=[filename,'          ',datestr(now)];
A{1,1}=filename;
A{1,2}=hd;
A{1,3}=output;
A{1,4}{1}=x;
A{1,4}{2}=y;
A{1,4}{3}=c;
A{1,5}=[cmin;cmax];
A{1,6}{1}=get(handles.edit1,'String');
A{1,6}{2}=get(handles.edit2,'String');
A{1,6}{3}=get(handles.edit3,'String');
A{1,6}{4}=get(handles.edit4,'String');
A{1,6}{5}=get(handles.edit5,'String');
A{1,6}{6}=get(handles.edit6,'String');
A{1,6}{7}=get(handles.edit7,'String');
A{1,6}{8}=get(handles.edit8,'String');
%  ��A���뵽Q��
%  Q����ʽ��
% ----------------------------------------------------------------------------------
%|    | �ļ��� | hd | String | x;y;c | cmin;cmax | edit1~edit8 | ����ֵ������ | ��� |        
% ----------------------------------------------------------------------------------
%|��¼|
ncell=201;
[Q,head,tail]=Enqueue4cell(Q,ncell,head,tail,A);
%  ������ʱ�ļ�
save('SwaveTempotary1.mat','Q');
save('SwaveTempotary2.mat','head','tail');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ���ƽ�ȡǰ�Ĳ���ͼ
Copyplot(handles.axes1,handles.axes1);
Copyplot(handles.axes2,handles.axes2);
%  ���Ƹ��ؼ��ġ�Visible������
set(handles.text20,'Visible','off');
set(handles.text21,'Visible','off');
set(handles.pushbutton7,'Visible','off');
set(handles.pushbutton8,'Visible','off');
%  ���֮ǰ����ȡ������
set(handles.edit1,'String','');
set(handles.edit2,'String','');
setappdata(handles.uipanel1,'intcpttime',[]);
setappdata(handles.uipanel1,'EWdata',[]);
setappdata(handles.uipanel1,'NSdata',[]);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ���ƽ�ȡǰ�Ĳ���ͼ
Copyplot(handles.axes1,handles.axes1);
Copyplot(handles.axes2,handles.axes2);
%  ���Ƹ��ؼ��ġ�Visible������
set(handles.text20,'Visible','off');
set(handles.text21,'Visible','off');
set(handles.pushbutton7,'Visible','off');
set(handles.pushbutton8,'Visible','off');
