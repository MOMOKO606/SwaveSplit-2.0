%%
% 
%  PREFORMATTED
%  TEXT
% 
function varargout = Main_SwaveSplit_2(varargin)
% MAIN_SWAVESPLIT_2 M-file for Main_SwaveSplit_2.fig
%      MAIN_SWAVESPLIT_2, by itself, creates a new MAIN_SWAVESPLIT_2 or raises the existing
%      singleton*.
%
%      H = MAIN_SWAVESPLIT_2 returns the handle to a new MAIN_SWAVESPLIT_2 or the handle to
%      the existing singleton*.
%
%      MAIN_SWAVESPLIT_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_SWAVESPLIT_2.M with the given input arguments.
%
%      MAIN_SWAVESPLIT_2('Property','Value',...) creates a new MAIN_SWAVESPLIT_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_SwaveSplit_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_SwaveSplit_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main_SwaveSplit_2

% Last Modified by GUIDE v2.5 27-Jan-2016 15:43:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_SwaveSplit_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_SwaveSplit_2_OutputFcn, ...
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


% --- Executes just before Main_SwaveSplit_2 is made visible.
function Main_SwaveSplit_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main_SwaveSplit_2 (see VARARGIN)

% Choose default command line output for Main_SwaveSplit_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%  ��axes4����ʾ��ʼ����
axes(handles.axes4);
screensaver=imshow('Initial_Pic.bmp');
%  ����Ϊ�������
setappdata(handles.figure1,'screensaver',screensaver);

pltn1=0;  %  pltn1��ʾ��ǰ��ͼ�������Ĳ�����GUI����ʱ����ֵΪ0��
setappdata(handles.figure1,'pltn1',pltn1);  %  ��pltn1����Ϊȫ�ֱ�����
%  report_index�Ǳ�ʾ������������ʽ�Ĳ�����
%  ��report_index=0ʱ��Ĭ��ֵ������ʾ�������ɽ�����棻
%  ��report_index=1ʱ����ʾ����ν�����������ͬһ��word�ĵ��С�
%  ͬ��location_index�Ǳ�ʾ���ɽ���ռ�ֲ�ͼ��ʽ�Ĳ�����
%  ��location_index=0ʱ��Ĭ��ֵ������ʾ�������ɽ���ռ�ֲ�ͼ��
%  ��location_index=1ʱ����ʾ�ö�ν������һ������ռ�ֲ�ͼ��
%  ͬ��OutputReport_index�Ǳ�ʾ�Ƿ�����������Ĳ�����
%  ��OutputReport=1ʱ��Ĭ��ֵ������ʾ���������棻
%  ��OutputReport=-1ʱ����ʾ�����������档
setappdata(handles.figure1,'report_index',0);
setappdata(handles.figure1,'location_index',0);
setappdata(handles.figure1,'OutputReport_index',1);
%  reptdata1��reptdata2Ϊ����ռ�ֲ�ͼ��ͼ������
%  ����Ĭ�ϵ������ɽ���ռ�ֲ�ͼ�����ȸ���ֵ��
setappdata(handles.figure1,'reptdata1',[]);
setappdata(handles.figure1,'reptdata2',[]);
%  Ϊpath1��path2����ֵ����ֵΪ��ǰ·����
%  path1��ʾ���ļ�·����
%  path2��ʾ�����������·����
setappdata(handles.figure1,'path1',pwd);
setappdata(handles.figure1,'path2',pwd);
%  EWindex��������ʾ����ǰͼ���Ƿ�ѡΪ������ط����Ķ��������źŵĲ�����
%  ��EWindex==0ʱ����ʾ��δѡ�С�����EWindex==1ʱ����ʾ��ѡ�С���
%  �����EWindex��EWtemp���������������ֵ������Ϊȫ�ֱ�����
EWindex=0;
EWtemp=-1;
hEW=[];
setappdata(handles.figure1,'EWindex',EWindex);
setappdata(handles.figure1,'EWtemp',EWtemp);
setappdata(handles.figure1,'hEW',hEW);
%  NSindex��������ʾ����ǰͼ���Ƿ�ѡΪ������ط������ϱ������źŵĲ�����
%  ��NSindex==0ʱ����ʾ��δѡ�С�����NSindex==1ʱ����ʾ��ѡ�С���
%  �����NSindex��NStemp���������������ֵ������Ϊȫ�ֱ�����
NSindex=0;
NStemp=-1;
hNS=[];
setappdata(handles.figure1,'NSindex',NSindex);
setappdata(handles.figure1,'NStemp',NStemp);
setappdata(handles.figure1,'hNS',hNS);
%  Zindex��������ʾ����ǰͼ���Ƿ�ѡΪ������ط����Ĵ�������źŵĲ�����
%  ��Zindex==0ʱ����ʾ��δѡ�С�����Zindex==1ʱ����ʾ��ѡ�С���
%  �����Zindex��Ztemp���������������ֵ������Ϊȫ�ֱ�����
Zindex=0;
Ztemp=-1;
hZ=[];
setappdata(handles.figure1,'Zindex',Zindex);
setappdata(handles.figure1,'Ztemp',Ztemp);
setappdata(handles.figure1,'hZ',hZ);


% UIWAIT makes Main_SwaveSplit_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%  ���´��������Ϊ�޸�GUI���Ͻ�ͼ�ꡣ
%newIcon=javax.swing.ImageIcon('sample.jpg');
%figFrame=get(handles.figure1,'JavaFrame');  %  ȡ��Figure��JavaFrame��
%figFrame.setFigureIcon(newIcon); %  �޸�ͼ��


% --- Outputs from this function are returned to the command line.
function varargout = Main_SwaveSplit_2_OutputFcn(hObject, eventdata, handles) 
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


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡȫ�ֱ���pltn1��ֵ��pltn1ΪĿǰ�Ѿ��򿪵ĵ�����ͼ��Ŀ��  
pltn1=getappdata(handles.figure1,'pltn1');
%  ����ͼ����С��3ʱ�����򿪡����ܿ�ʹ��
if (pltn1 < 3)
    set(handles.Open,'enable','on');
    set(handles.Evt,'enable','on');
else
    set(handles.Open,'enable','off');
    set(handles.Evt,'enable','off');
end
%  �����ڴ򿪵ĵ�����ͼʱ�������桱�����رա��ȹ��ܿ����������ܹرա�
if (pltn1 == 0)
    set(handles.Closeall,'enable','off');
    set(handles.Savepic,'enable','off');
    set(handles.Savedata,'enable','off');
else
    set(handles.Closeall,'enable','on');
    set(handles.Savepic,'enable','on');
    set(handles.Savedata,'enable','on');
end


function DataCenters_Callback(hObject, eventdata, handles)
% hObject    handle to DataCenters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CEDC_Callback(hObject, eventdata, handles)
% hObject    handle to CEDC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('http://data.earthquake.cn/data/','-browser');


% --------------------------------------------------------------------
function IRIS_Callback(hObject, eventdata, handles)
% hObject    handle to IRIS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('http://ds.iris.edu/ds/nodes/dmc/','-browser');


% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰ���õĴ��ļ�·����
DefaultPath=getappdata(handles.figure1,'path1');
%  �����ܳ��ֵ�6��axes��Positionֵ����axespos�У�axesposΪcell����
axespos(1,1)={[0.041,0.271,0.755,0.498]};
axespos(2,1)={[0.041,0.573,0.755,0.349;0.041,0.113,0.755,0.349]};
axespos(3,1)={[0.041,0.711,0.755,0.23;0.041,0.386,0.755,0.23;0.041,0.06,0.755,0.23]};
%  ��ȡȫ�ֱ���pltn1��ֵ��pltn1ΪĿǰ�Ѿ��򿪵ĵ�����ͼ��Ŀ��
pltn1=getappdata(handles.figure1,'pltn1');
%  ����һ�����ļ��Ի���
[FileName,PathName]=uigetfile(...
{'*.SAC','SAC Files(*.SAC)';'*.txt','ASCII Data(*.txt)';...
 '*.dat','Golden Software Data(*.dat)';'*.*','All Files(*.*)'},...
 'File Selector',DefaultPath,'MultiSelect','on');
%  ���û��ڶԻ����е����ȡ����ʱ��Open_Callbackֹͣ��
if ((iscellstr(FileName) == 0) & (FileName == 0))
    return
end
[inputfile,pltn2,pltn3]=Get_Pltn2(handles,pltn1,PathName,FileName);
if (pltn3 > 3)
    errordlg('SwaveSplit supports to open up to 3 seismic waveform figures at one time, please reselect your file .','Notice');
    return
end
%  ͨ��ChekAxes�����õ���ͼƬ��axes�Լ���axes�ľ����
[hocupd,hfree]=ChekAxes(handles);
%  ��������ͼƬ���Լ���Ҫ��ͼƬ��������axes�ĳߴ��λ�ñ仯��
%  1����������ͼ�ε�axes�ĳߴ��λ�ã�
for i=1:pltn1
    set(hocupd(i),'Units','normalized','Visible','on','Position',axespos{pltn3,1}(i,:));
end
%  2������Ҫ���ƵĲ���ͼ����axes��������Щaxes�ĳߴ��λ�ã�����ͼ��
for i=1:pltn2
    set(hfree(i),'Units','normalized','Position',axespos{pltn3,1}(pltn1+i,:));  %  ����axes�ĳߴ��λ��
    %  ��ȡ���ݡ�
    filename=inputfile{1,pltn2+1-i};  %  pltn2+1-i��Ϊ������ѡ������ͼƬ��ʾ�����档
    type_index=strcmpi(filename(end-3:end),'.SAC');
    if (type_index == 1)
        [hd,stime,sdata]=rdSac(filename);  
    else
        sdata=getappdata(handles.Open,filename);  %  ����sdata
        delta_temp=inputdlg_fix('Please input the delta T(second) of the ASCII format data��','Input tip',1);
        if (isempty(delta_temp) ~= 1 )
            delta=str2num(cell2mat(delta_temp));  %  �Ƚ�cellת��Ϊ��ͨ�����ַ��������ٽ�deltaת��Ϊdouble��
        else
            delta=0.025;  %  ���û�ѡ��ȡ����û������������ֵʱ��ϵͳĬ�ϲ������Ϊ0.025s��
        end
        n=length(sdata);
        stime=[0:delta:(n-1)*delta];  %  ����stime
        t=[delta;zeros(78,1);n;zeros(20,1)];
        hd=cell(27,1);
        hd{1,1}=t;  %  ����hd
        hd{27,1}=0;
    end
    SacPlot(hfree(i),hd,stime,sdata);
    set(hfree(i),'Visible','on');  %  ��ͼ��ɺ���ʾaxes
end
%  3�����ÿ�axesΪ���ɼ���
temp=length(hfree)-pltn2;
for i=1:temp
    set(hfree(pltn2+i),'Visible','off');
end
%  ����pltn1��ֵ������Ϊȫ�ֱ�����
pltn1=pltn3;
%  �����ڲ���ͼʱ�ر�����ͼ��
if ( pltn1 ~= 0 )
    screensaver=getappdata(handles.figure1,'screensaver');
    set(screensaver,'Visible','off');
end
setappdata(handles.figure1,'pltn1',pltn1);
%  ���´��ļ�·����
setappdata(handles.figure1,'path1',PathName);


% --------------------------------------------------------------------
function Evt_Callback(hObject, eventdata, handles)
% hObject    handle to Evt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ����
pltn1=getappdata(handles.figure1,'pltn1');
%  ��ȡ��ǰ���õĴ��ļ�·����
DefaultPath=getappdata(handles.figure1,'path1');
%  ����һ�����ļ��Ի���
[FileName,PathName]=uigetfile({'*.EVT','EVT Files(*.EVT)';'*.*','All Files(*.*)'},...
                              'File Selector',DefaultPath);
%  ���û��ڶԻ����е����ȡ����ʱ��Open_Callbackֹͣ��
if ((iscellstr(FileName) == 0) & (FileName == 0))
    return
end           
%  ���·�������axes��λ��
axespos=[0.041,0.711,0.755,0.23;0.041,0.386,0.755,0.23;0.041,0.06,0.755,0.23];
for i=1:3
    str=['handles.axes',num2str(i)];
    eval(['h=',str,';'])
    set(h,'Position',axespos(i,:));
end
%  �����ж�EVT�ļ��Ƿ񱻽�ѹ����
%  ����FLAGΪ1������Ϊ0��
str=FileName(1:length(FileName)-4);
list=dir(PathName);
[m,n]=size(list);
FLAG=0;
for i=3:m
    flag1=strcmp( list(i).name(1:length(str)),str );
    pp=length(list(i).name);
    flag2=strcmp( list(i).name(pp-3:pp),'.asc');
    if ( flag1 && flag2 )
        FLAG=1;
        break
    end
end
if ( FLAG == 0 )
    ReadEvt(FileName,PathName);
end
if ( pltn1 > 0 )
    errordlg('Please remove all figures first.','Notice');
    return
end
%  ����һ�����ļ��Ի�������ѡ��EVT��ѹ���ASC�ļ���
[FileName,PathName]=uigetfile({'*.ASC','Transfered ASCII Files(*.SAC)'},'File Selector',PathName);
%  ���û��ڶԻ����е����ȡ����ʱ��Open_Callbackֹͣ��
if ((iscellstr(FileName) == 0) & (FileName == 0))
    return
end
%  ��ASC���ݶ�Ӧ������������ͼ�����ر�����ͼ��
screensaver=getappdata(handles.figure1,'screensaver');
set(screensaver,'Visible','off');
%  ��ͼ
AscPlot(handles,[PathName,FileName]);
%  �Զ��Ҽ�ѡ��Z��NS��EW��������
%  Z����
ylabel(handles.axes1,'Z','FontWeight','bold','FontSize',10,'Color','r',...
       'Rotation',[0],'Units','normalized','Position',[-0.0377 0.5 0]);
set(handles.ChooseZ,'Checked','on');
%  ����Zindex��Ztemp
setappdata(handles.figure1,'Zindex',1);
setappdata(handles.figure1,'Ztemp',1);
setappdata(handles.figure1,'hZ',handles.axes1);
%  NS����
ylabel(handles.axes2,'NS','FontWeight','bold','FontSize',10,'Color','r',...
       'Rotation',[0],'Units','normalized','Position',[-0.0377 0.5 0]);
set(handles.ChooseNS,'Checked','on');
%  ����NSindex��NStemp
setappdata(handles.figure1,'NSindex',1);
setappdata(handles.figure1,'NStemp',1);
setappdata(handles.figure1,'hNS',handles.axes2);
%  EW����
ylabel(handles.axes3,'EW','FontWeight','bold','FontSize',10,'Color','r',...
       'Rotation',[0],'Units','normalized','Position',[-0.0377 0.5 0]);
set(handles.ChooseEW,'Checked','on');
%  ����EWindex��EWtemp
setappdata(handles.figure1,'EWindex',1);
setappdata(handles.figure1,'EWtemp',1);
setappdata(handles.figure1,'hEW',handles.axes3);
%  ����ȫ�ֱ���
setappdata(handles.figure1,'pltn1',3);

% --------------------------------------------------------------------
function Closeall_Callback(hObject, eventdata, handles)
% hObject    handle to Closeall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  �������axes�ϵ�ͼ�����ݡ�
for i=1:3
    str=['handles.axes',num2str(i)];
    eval(['h=',str,';']);
    cla(h,'reset');
    set(h,'Visible','off');
end
%  ��pltn1�ָ�Ϊ��ʼֵ0��
setappdata(handles.figure1,'pltn1',0);  
%  ��EWindex��EWtemp��hEW�ָ�Ϊ��ʼֵ��
setappdata(handles.figure1,'EWindex',0);
setappdata(handles.figure1,'EWtemp',-1);
setappdata(handles.figure1,'hEW',[]);
set(handles.ChooseEW,'Checked','off');
%  ��NSindex��NStemp��hNS�ָ�Ϊ��ʼֵ��
setappdata(handles.figure1,'NSindex',0);
setappdata(handles.figure1,'NStemp',-1);
setappdata(handles.figure1,'hNS',[]);
set(handles.ChooseNS,'Checked','off');
%  ��Zindex��Ztemp��hZ�ָ�Ϊ��ʼֵ��
setappdata(handles.figure1,'Zindex',0);
setappdata(handles.figure1,'Ztemp',-1);
setappdata(handles.figure1,'hZ',[]);
set(handles.ChooseZ,'Checked','off');
%  ����������
screensaver=getappdata(handles.figure1,'screensaver');
set(screensaver,'Visible','on');


% --------------------------------------------------------------------
function Savepic_Callback(hObject, eventdata, handles)
% hObject    handle to Savepic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰ���õĴ洢�ļ�·����
str=getappdata(handles.figure1,'path3');
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
setappdata(handles.figure1,'path3',PathName);


% --------------------------------------------------------------------
function Savedata_Callback(hObject, eventdata, handles)
% hObject    handle to Savedata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰ���õĴ洢�ļ�·����
str=getappdata(handles.figure1,'path3');
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
setappdata(handles.figure1,'path3',PathName);


% --------------------------------------------------------------------
function Saveall_Callback(hObject, eventdata, handles)
% hObject    handle to Saveall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰ���õĴ洢�ļ�·����
str=getappdata(handles.figure1,'path3');
DefaultPath=[str,'\untitled.jpg'];
%  ��ȡGUI��ܣ��൱�ڽ�ͼ����
h=getframe(handles.figure1);
%  ����ȡ�Ŀ��ת��Ϊͼ��
h=frame2im(h);
%  ����һ���ļ�����Ի���
[FileName,PathName]=uiputfile(...
{'*.jpg','JPEG image(*.jpg)';'*.bmp','Bitmap file(*.bmp)';...
 '*.tif','TIFF image(*.tif)';'*.*','All Files(*.*)'},...
 'ͼƬ���Ϊ',DefaultPath);
if (FileName == 0)
    %  ���û������ȡ����ʱ���ر��½�figure��������ֹ��
    return
else
    imwrite(h,fullfile(PathName,FileName));
end
%  ���´洢�ļ�·����
setappdata(handles.figure1,'path3',PathName);


% --------------------------------------------------------------------
function PrintView_Callback(hObject, eventdata, handles)
% hObject    handle to PrintView (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printpreview(handles.figure1);


% --------------------------------------------------------------------
function Print_Callback(hObject, eventdata, handles)
% hObject    handle to Print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1);


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --------------------------------------------------------------------
function process_Callback(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡȫ�ֱ���pltn1��ֵ��pltn1ΪĿǰ�Ѿ��򿪵ĵ�����ͼ��Ŀ��  
pltn1=getappdata(handles.figure1,'pltn1');
%  ��ȡȫ�ֱ���hEW��hNS��
hEW=getappdata(handles.figure1,'hEW');
hNS=getappdata(handles.figure1,'hNS');
%  �����ڴ򿪵ĵ�����ͼʱ����Ԥ�������ܿ����������ܹرա�
if (pltn1 == 0)
    set(handles.Remv_Iresponse,'enable','off');
    set(handles.Remvzd,'enable','off');
    set(handles.Remvld,'enable','off');
    set(handles.Input_EventLatLon,'enable','off');
else
    set(handles.Remv_Iresponse,'enable','on');
    set(handles.Remvzd,'enable','on');
    set(handles.Remvld,'enable','on');
    set(handles.Input_EventLatLon,'enable','on');
end
%  ���б�ѡΪ��EW���͡�NS���ķ���ʱ����ͳһʱ�䡱���ܿ����������ܹرա�
if ((isempty(hEW) == 0) && (isempty(hNS) == 0))
    set(handles.Sametime,'enable','on');
else
    set(handles.Sametime,'enable','off');
end


% --------------------------------------------------------------------
function Remv_Iresponse_Callback(hObject, eventdata, handles)
% hObject    handle to Remv_Iresponse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function rough_Callback(hObject, eventdata, handles)
% hObject    handle to rough (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰaxes�ϵĲ������ݡ�
clcu_info=getappdata(gca,'clcu_info');
hplot=clcu_info(1);
sdata=getappdata(gca,'sdata');
hd=getappdata(gca,'hd');
scale=hd{1,1}(4,1);  %  �õ��Ŵ���
%  �趨����Ի���Ĭ��ֵ��
if ((scale == 0) || (scale == -12345) )
    defAns={''};
else
    scale=1/(scale*10^-6);  %  ת���������ȣ���λ��m per (A/D)
    defAns={num2str(scale)};
end
scale=inputdlg_fix('Please Enter(��m per count):','Hint',[1,30],defAns,'on');
%  ѡ��ȡ��ʱ����������
if (isempty(scale) == 1)
    return
end
scale=str2num(cell2mat(scale));  %  �Ƚ�cellת��Ϊ��ͨ�����ַ��������ٽ�scaleת��Ϊdouble��
%  ȥ��������Ӧ
sdata=sdata*scale;
set(hplot,'YData',sdata);
%  �����º��ͼ�Σ��������±��浽��ǰaxes��Application Data��
setappdata(gca,'sdata',sdata);


% --------------------------------------------------------------------
function precise_Callback(hObject, eventdata, handles)
% hObject    handle to precise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰaxes�ϵĲ������ݡ�
clcu_info=getappdata(gca,'clcu_info');
hplot=clcu_info(1);
delta=clcu_info(2);
sdata=getappdata(gca,'sdata');
%  ����һ�������ļ���ʽ��ʾ��
FormatHint;   
%  ����һ�����ļ��Ի���
[FileName,PathName]=uigetfile({'*.txt','ASCII Data(*.txt)'},'File Selector');
if (FileName == 0)
    return
else
    ResFile=[PathName,FileName];
end
%  ����������Ӧ�����ݺ�������
sdata=RemvTransf(ResFile,delta,sdata);
%  ����ͼ�Σ��������±��浽��ǰaxes��Application Data��
set(hplot,'YData',sdata);
setappdata(gca,'sdata',sdata);


% --------------------------------------------------------------------
function Remvzd_Callback(hObject, eventdata, handles)
% hObject    handle to Remvzd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰaxes�ϵĲ������ݡ�
sdata=getappdata(gca,'sdata');
clcu_info=getappdata(gca,'clcu_info');
hplot=clcu_info(1);
clcu_info(3)=clcu_info(3)+1;
%  ȥ�����Ư�ơ�
sdata=dtrend(sdata);
set(hplot,'YData',sdata);
%  �����º��ͼ�Σ��������±��浽��ǰaxes��Application Data��
setappdata(gca,'sdata',sdata);
setappdata(gca,'clcu_info',clcu_info);


% --------------------------------------------------------------------
function Remvld_Callback(hObject, eventdata, handles)
% hObject    handle to Remvld (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰaxes�ϵĲ������ݡ�
sdata=getappdata(gca,'sdata');
clcu_info=getappdata(gca,'clcu_info');
hplot=clcu_info(1);
clcu_info(4)=clcu_info(4)+1;
%  ȥ������Ư�ơ�
sdata=dtrend(sdata,1);
set(hplot,'YData',sdata);
%  �����º��ͼ�Σ��������±��浽��ǰaxes��Application Data��
setappdata(gca,'sdata',sdata);
setappdata(gca,'clcu_info',clcu_info);


% --------------------------------------------------------------------
function Input_EventLatLon_Callback(hObject, eventdata, handles)
% hObject    handle to Input_EventLatLon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰaxes�ϵĲ������ݡ�
hd=getappdata(gca,'hd');
clcu_info=getappdata(gca,'clcu_info');
% Ĭ��ֵ��ֵ
KNETWK=hd{23,1};       %  Name of seismic network.
KSTNM=hd{2,1};         %  Station name.
KCMPNM=hd{22,1};       %  Component name.
STLA=num2str(hd{1,1}(32,1));    %  Station latitude (degrees, north positive).
STLO=num2str(hd{1,1}(33,1));    %  Station longitude (degrees, east positive).
NPTS=num2str(hd{1,1}(80,1));    %  Number of points per data component.
SPS=num2str(1/hd{1,1}(1,1));
StartData=hd{26,1};    
StartTime=hd{27,1}; 
EVLA=num2str(hd{1,1}(36,1));    %  Event latitude (degrees, north positive). 
EVLO=num2str(hd{1,1}(37,1));    %  Event longitude (degrees, east positive). 
EVDP=num2str(hd{1,1}(39,1));    %  Event Depth(km).
EpiDis=num2str(clcu_info(7));
Azi=num2str(clcu_info(8));
InverAzi=num2str(clcu_info(9));
ToAngle=num2str(clcu_info(10));
%  ��������Ի�����������¼�������
prompt={'Enter Network Name:','Enter Station Name:','Enter Component Name:',...
        'Enter Station Latitude(��):','Enter Station Longitude(��):','Enter Number of Samples',...
        'Enter SPS:','Enter Start Data:','Enter Start Time:','Enter Event Latitude(��):',...
        'Enter Event Longitude(��):','Enter Event Depth(km):','Enter Epicentral Distance(km):',...
        'Enter Azimuth:','Enter Inverse Azimuth:','Enter Take-off Angle:'};
def_Ans={KNETWK,KSTNM,KCMPNM,STLA,STLO,NPTS,SPS,StartData,StartTime,EVLA,EVLO,EVDP,EpiDis,Azi,InverAzi,ToAngle};
dlg_title='Enter Seismic Parameters';
answer=inputdlg_fix(prompt,dlg_title,[1 50],def_Ans);
%  �û�ѡ��ȡ�����򷵻�
if (isempty(answer) == 1)
    return
end
%  �����û�����Ĳ���
hd{23,1}=answer{1,1};
hd{2,1}=answer{2,1};
hd{22,1}=answer{3,1};
hd{1,1}(32,1)=str2double(answer{4,1});
hd{1,1}(33,1)=str2double(answer{5,1}); 
hd{1,1}(80,1)=str2double(answer{6,1});  
hd{1,1}(1,1)=1/str2double(answer{7,1});
hd{26,1}=answer{8,1};    
hd{27,1}=answer{9,1}; 
hd{1,1}(36,1)=str2double(answer{10,1});    
hd{1,1}(37,1)=str2double(answer{11,1});  
hd{1,1}(39,1)=str2double(answer{12,1});  
clcu_info(7)=str2double(answer{13,1});  
clcu_info(8)=str2double(answer{14,1});  
clcu_info(9)=str2double(answer{15,1});  
clcu_info(10)=str2double(answer{16,1});  
%  �����º���������±��浽��ǰaxes��Application Data��
setappdata(gca,'hd',hd);
setappdata(gca,'clcu_info',clcu_info);

% --------------------------------------------------------------------
function Sametime_Callback(hObject, eventdata, handles)
% hObject    handle to Sametime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hZ=getappdata(handles.figure1,'hZ');
if ( isempty(hZ) )  %  ���ֻ��EW��NS����
    Get_SameTime(handles);
else
    Get_SameTimeFor3(handles);
end
    

% --------------------------------------------------------------------
function Calculate_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡȫ�ֱ���pltn1��ֵ��pltn1ΪĿǰ�Ѿ��򿪵ĵ�����ͼ��Ŀ��  
pltn1=getappdata(handles.figure1,'pltn1');
%  �����ڴ򿪵ĵ�����ͼʱ�������㡱���ܿ����������ܹرա�
if (pltn1 == 0)
    set(handles.Integ,'enable','off');
    set(handles.Differet,'enable','off');
    set(handles.filter,'enable','off');
    set(handles.SigNois_Ratio,'enable','off');
    set(handles.epcentldis,'enable','off');
    set(handles.azimuth,'enable','off');
    set(handles.bkazimuth,'enable','off');
    set(handles.offsource,'enable','off');
    set(handles.HHT,'enable','off');
else
    set(handles.Integ,'enable','on');
    set(handles.Differet,'enable','on');
    set(handles.filter,'enable','on');
    set(handles.SigNois_Ratio,'enable','on');
    set(handles.epcentldis,'enable','on');
    set(handles.azimuth,'enable','on');
    set(handles.bkazimuth,'enable','on');
    set(handles.offsource,'enable','on');
    set(handles.HHT,'enable','on');
end


% --------------------------------------------------------------------
function Integ_Callback(hObject, eventdata, handles)
% hObject    handle to Integ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰͼ���л������������
sdata=getappdata(gca,'sdata');
clcu_info=getappdata(gca,'clcu_info');
hplot=clcu_info(1);
delta=clcu_info(2);
clcu_info(5)=clcu_info(5)+1;
%  ���λ��ֲ�����ͼ�Ρ�
sdata=TrapInt(sdata,delta);
set(hplot,'YData',sdata);
%  �����º��ͼ�Σ��������±��浽��ǰaxes��Application Data��
setappdata(gca,'sdata',sdata);
setappdata(gca,'clcu_info',clcu_info);


% --------------------------------------------------------------------
function Differet_Callback(hObject, eventdata, handles)
% hObject    handle to Differet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰͼ���л������������
stime=getappdata(gca,'stime');
sdata=getappdata(gca,'sdata');
clcu_info=getappdata(gca,'clcu_info');
hplot=clcu_info(1);
delta=clcu_info(2);
clcu_info(6)=clcu_info(6)+1;
%  ���λ��ֲ�����ͼ�Ρ�
sdata=Deriva(stime,sdata,delta);
set(hplot,'YData',sdata);
%  �����º��ͼ�Σ��������±��浽��ǰaxes��Application Data��
setappdata(gca,'sdata',sdata);
setappdata(gca,'clcu_info',clcu_info);


% --------------------------------------------------------------------
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰͼ���е�sdata��hplot��
sdata=getappdata(gca,'sdata');
clcu_info=getappdata(gca,'clcu_info');
hplot=clcu_info(1);
%  �õ��û�������˲�Ƶ�ʷ�Χ��
answer=FreqRange;
if (isempty(answer) == 1)
    return
end
f1=char(answer(1,1));
f2=char(answer(2,1));
f1=str2num(f1)*pi/180;
f2=str2num(f2)*pi/180;
%  �˲�������ͼ�Ρ�
sdata=idfilt(sdata,5,[f1 f2]);
set(hplot,'YData',sdata);
%  ������º��sdata���ݵ���ǰaxes��Application Data��
setappdata(gca,'sdata',sdata);


% --------------------------------------------------------------------
function HHT_Callback(hObject, eventdata, handles)
% hObject    handle to HHT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ����axes��position
axespos(1,1)={[0.119,0.237,0.727,0.599]};
axespos(2,1)={[0.097,0.593,0.727,0.308;0.097,0.151,0.727,0.308]};
axespos(3,1)={[0.097,0.696,0.727,0.227;0.097,0.384,0.727,0.227;0.097,0.071,0.727,0.227]};
axespos(4,1)={[0.031,0.593,0.406,0.321;0.031,0.141,0.406,0.321;0.488,0.593,0.406,0.321;...
              0.488,0.141,0.406,0.321]};
axespos(5,1)={[0.032,0.689,0.406,0.225;0.032,0.379,0.406,0.225;0.032,0.071,0.406,0.225;...
              0.472,0.689,0.406,0.225;0.472,0.379,0.406,0.225]};
axespos(6,1)={[0.032,0.689,0.406,0.225;0.032,0.379,0.406,0.225;0.032,0.071,0.406,0.225;...
              0.472,0.689,0.406,0.225;0.472,0.379,0.406,0.225;0.472,0.071,0.406,0.225]};
axespos(7,1)={[0.031,0.783,0.406,0.177;0.031,0.535,0.406,0.177;0.031,0.287,0.406,0.177;0.031,0.037,0.406,0.177;...
              0.472,0.783,0.406,0.177;0.472,0.535,0.406,0.177;0.472,0.287,0.406,0.177]};
axespos(8,1)={[0.031,0.783,0.406,0.177;0.031,0.535,0.406,0.177;0.031,0.287,0.406,0.177;0.031,0.037,0.406,0.177;...
              0.472,0.783,0.406,0.177;0.472,0.535,0.406,0.177;0.472,0.287,0.406,0.177;0.472,0.037,0.406,0.177]};          
axespos(9,1)={[0.032,0.813,0.406,0.153;0.032,0.616,0.406,0.153;0.032,0.419,0.406,0.153;0.032,0.223,0.406,0.153;...
              0.032,0.026,0.406,0.153;0.472,0.813,0.406,0.153;0.472,0.616,0.406,0.153;0.472,0.419,0.406,0.153;...
              0.472,0.223,0.406,0.153]};
axespos(10,1)={[0.032,0.813,0.406,0.153;0.032,0.616,0.406,0.153;0.032,0.419,0.406,0.153;0.032,0.223,0.406,0.153;...
              0.032,0.026,0.406,0.153;0.472,0.813,0.406,0.153;0.472,0.616,0.406,0.153;0.472,0.419,0.406,0.153;...
              0.472,0.223,0.406,0.153;0.472,0.026,0.406,0.153]};          
axespos(11,1)={[0.02,0.815,0.277,0.153;0.02,0.618,0.277,0.153;0.02,0.421,0.277,0.153;0.02,0.224,0.277,0.153;...
               0.02,0.027,0.277,0.153;0.329,0.815,0.277,0.153;0.329,0.618,0.277,0.153;0.329,0.421,0.277,0.153;...
               0.329,0.224,0.277,0.153;0.329,0.027,0.277,0.153;0.635,0.815,0.277,0.153]}; 
axespos(12,1)={[0.02,0.815,0.277,0.153;0.02,0.618,0.277,0.153;0.02,0.421,0.277,0.153;0.02,0.224,0.277,0.153;...
               0.02,0.027,0.277,0.153;0.329,0.815,0.277,0.153;0.329,0.618,0.277,0.153;0.329,0.421,0.277,0.153;...
               0.329,0.224,0.277,0.153;0.329,0.027,0.277,0.153;0.635,0.815,0.277,0.153;0.635,0.618,0.277,0.153]};           
axespos(13,1)={[0.02,0.815,0.277,0.153;0.02,0.618,0.277,0.153;0.02,0.421,0.277,0.153;0.02,0.224,0.277,0.153;...
               0.02,0.027,0.277,0.153;0.329,0.815,0.277,0.153;0.329,0.618,0.277,0.153;0.329,0.421,0.277,0.153;...
               0.329,0.224,0.277,0.153;0.329,0.027,0.277,0.153;0.635,0.815,0.277,0.153;0.635,0.618,0.277,0.153;...
               0.635,0.421,0.277,0.153]};
axespos(14,1)={[0.02,0.815,0.277,0.153;0.02,0.618,0.277,0.153;0.02,0.421,0.277,0.153;0.02,0.224,0.277,0.153;...
               0.02,0.027,0.277,0.153;0.329,0.815,0.277,0.153;0.329,0.618,0.277,0.153;0.329,0.421,0.277,0.153;...
               0.329,0.224,0.277,0.153;0.329,0.027,0.277,0.153;0.635,0.815,0.277,0.153;0.635,0.618,0.277,0.153;...
               0.635,0.421,0.277,0.153;0.635,0.224,0.277,0.153]};
axespos(15,1)={[0.02,0.815,0.277,0.153;0.02,0.618,0.277,0.153;0.02,0.421,0.277,0.153;0.02,0.224,0.277,0.153;...
               0.02,0.027,0.277,0.153;0.329,0.815,0.277,0.153;0.329,0.618,0.277,0.153;0.329,0.421,0.277,0.153;...
               0.329,0.224,0.277,0.153;0.329,0.027,0.277,0.153;0.635,0.815,0.277,0.153;0.635,0.618,0.277,0.153;...
               0.635,0.421,0.277,0.153;0.635,0.224,0.277,0.153;0.635,0.027,0.277,0.153]};
%  ��ȡ��ǰͼ���еĲ�����
sdata=getappdata(gca,'sdata');
stime=getappdata(gca,'stime');
clcu_info=getappdata(gca,'clcu_info');
hplot=clcu_info(1);
%  EMD�ֽ�
imf = emd(sdata);
[m ,~]=size(imf);
M=min(m-1,15);
%  ���ӽ���HHT_Sub��HHT_Sub���������Ϊ�������figure������������Ϊ�������ӽ��棩��figure�����
h=HHT_Sub(handles.figure1);
%  ����guihandles�������h�������handles�ṹ�塣
HHThandles=guihandles(h);
%  ���ӽ���ṹ�����������ṹ���С�
handles.HHThandles=HHThandles;
%  ���½ṹ�塣
guidata(hObject,handles);
%  ���ش򿪵Ľ���
set(handles.HHThandles.figure1,'Visible','off');
%  ������ͼ��axes�ĳߴ��λ��
for i=1:M
    eval(['h=handles.HHThandles.axes',num2str(i),';'])
    set(h,'Units','normalized','Position',axespos{M,1}(i,:),'Visible','on');  
end
%  ������ͼ��axes�ĳߴ��λ��
for i=M+1:15
    eval(['h=handles.HHThandles.axes',num2str(i),';'])
    set(h,'Units','normalized','Position',[1,1,0.000001,0.0000001],'Visible','off');
end
%  ����xtick�Լ�xticklabel��
x=fix(max(stime)/60);  %  ����ʱ���ᾭ���˼�����
if (x <= 6)                para1=10;para2=1;  %  ��ʱ����С��6����ʱ,ÿ10��1���̶ȣ�ÿ1����1���̶ȱ��
elseif (x > 6 && x <= 12)  para1=30;para2=1;  %  ��ʱ�������6����С��12����ʱ,ÿ30��1���̶ȣ�ÿ1����1���̶ȱ��
else                       para1=60;para2=2;  %  ��ʱ�������12����ʱ,ÿ1����1���̶ȣ�ÿ2����1���̶ȱ��  
end
y=fix(max(stime)/para1);
xtick=[0:para1:y*para1];
xticklabel=cell(y+1,1);
xticklabel{1,1}='0';
for i=1:x/para2
    j=(60/para1)*para2*i+1;
    xticklabel{j,1}=strcat('+',num2str(i*para2),'m');
end
%  ������ϵ�ϻ�ͼ
for i=1:M
    eval(['h=handles.HHThandles.axes',num2str(i),';'])
    axes(h); 
    hh=plot(stime,imf(i,:));
    grid on;                                                              %  ������
    box off;                                                              %  ȡ���߿�
    set(h,'XLim',[min(stime) max(stime)],'XTick',xtick,'XTickLabel',xticklabel);
    setappdata(h,'hhtdata',imf(i,:));
end
%  ��ʾ�򿪵Ľ���
set(handles.HHThandles.figure1,'Visible','on');
%  ��ʾ��Ӧ�������е��ĸ�ͼ
setappdata(handles.HHThandles.figure1,'hc',gca);
setappdata(handles.HHThandles.figure1,'hplot',hplot);


% --------------------------------------------------------------------
function SigNois_Ratio_Callback(hObject, eventdata, handles)
% hObject    handle to SigNois_Ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ���뵱ǰͼ��Ĳ�����Ϣ��
clcu_info=getappdata(gca,'clcu_info');
sdata=getappdata(gca,'sdata');
%  �õ���ǰͼ����������
delta=round(clcu_info(2)*1000000)/1000000;  % ����6λ��Ч����
%  ��������Ի��������źſ�ʼ����ֹʱ�䡣
prompt={'Signal Starts from(s):','Signal Ends at(s):'};
dlg_title='Compute SNR';
answer=inputdlg_fix(prompt,dlg_title,[1,50]);
%  �õ��û�������źŷ�Χ��
if (isempty(answer) == 1)  %  ���û�ѡ��ȡ��ʱ��������ֹ��
    return  
end
time1=str2num(char(answer(1,1)));
time2=str2num(char(answer(2,1)));
%  �ж��û�����������Ƿ����Ҫ��
if (mod(time1,delta) ~= 0)
    errordlg(['Please re-enter the start time, it should be a multiple of sampling interval which is ',num2str(delta),' .'],'Error');  
    return
elseif (mod(time2,delta) ~= 0)
    errordlg(['Please re-enter the end time, it should be a multiple of sampling interval which is ',num2str(delta),' .'],'Error');  
    return
end
t1=time1/delta+1;
t2=time2/delta+1;
sig=sdata(t1:t2);
nois=sdata(1:t1-1);
ps=sqrt(sum((sig.^2))/(t2-t1+1));
pn=sqrt(sum((nois.^2))/(t1-1));
%  ��������ȡ�
snr=10*log10(ps/pn);  
clcu_info(11)=snr;
%  ���µ�ǰaxes��Application Data��
setappdata(gca,'clcu_info',clcu_info);


% --------------------------------------------------------------------
function epcentldis_Callback(hObject, eventdata, handles)
% hObject    handle to epcentldis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��Ӧ�������õĲ�����
hd=getappdata(gca,'hd');
clcu_info=getappdata(gca,'clcu_info');
%  �����Ѿ���������о�������ֹ���������¼��㡣
if (isnan(clcu_info(7)) == 0 )
    return
end
%  ���ļ�ͷ�ж�ȡ���о࣬�������ݴ������ټ��㣻
DIST=hd{1,1}(51,1);
if (DIST ~= -12345 && DIST ~= 0)
    clcu_info(7)=DIST;
else
    %  ���ļ�ͷ�в��������о�����ʱ��ͨ��̨վ�����еľ�γ�������㣻
    STLA=hd{1,1}(32,1);    %  Station latitude (degrees, north positive).
    STLO=hd{1,1}(33,1);    %  Station longitude (degrees, east positive).
    EVLA=hd{1,1}(36,1);    %  Event latitude (degrees, north positive). 
    EVLO=hd{1,1}(37,1);    %  Event longitude (degrees, east positive). 
    %  ��̨վ�����о�γ������ȱʧʱ��������ֹ��
    if ((STLA == 0 && STLO == 0 && EVLA ==0 && EVLO ==0) || (STLA == -12345 && STLO == -12345 && EVLA ==-12345 && EVLO ==-12345))
        errordlg('Lack of latitude/longitude information .','error');
        return
    end
    slo=STLO*pi/180;  %  ̨վ���ȣ�ת��Ϊ���ȣ�
    sla=LatiTrans(STLA);  %  ̨վ������γ��
    elo=EVLO*pi/180;  %  ���о��ȣ�ת��Ϊ���ȣ�
    ela=LatiTrans(EVLA);  %  ���е�����γ��
    %  �������о�(Epicentral distance)��
    t=acos(cos(ela)*cos(sla)+sin(ela)*sin(sla)*cos(elo-slo));
    clcu_info(7)=t*180*111.12/pi; %  ��λΪǧ��
end
%  ���µ�ǰaxes��Application Data��
setappdata(gca,'clcu_info',clcu_info);


% --------------------------------------------------------------------
function azimuth_Callback(hObject, eventdata, handles)
% hObject    handle to azimuth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��Ӧ�������õĲ�����
hd=getappdata(gca,'hd');
clcu_info=getappdata(gca,'clcu_info');
%  �����Ѿ��������λ��������ֹ���������¼��㡣
if (isnan(clcu_info(8)) == 0 )
    return
end
%  ���ļ�ͷ�ж�ȡ��λ�ǣ��������ݴ������ټ��㣻
AZ=hd{1,1}(52,1);
if (AZ ~= -12345 && AZ ~= 0)
    clcu_info(8)=AZ;
else
    %  ���ļ�ͷ�в����ڷ�λ������ʱ��ͨ��̨վ�����еľ�γ�������㣻
    STLA=hd{1,1}(32,1);    %  Station latitude (degrees, north positive).
    STLO=hd{1,1}(33,1);    %  Station longitude (degrees, east positive).
    EVLA=hd{1,1}(36,1);    %  Event latitude (degrees, north positive). 
    EVLO=hd{1,1}(37,1);    %  Event longitude (degrees, east positive). 
    %  ��̨վ�����о�γ������ȱʧʱ��������ֹ��
    if ((STLA == 0 && STLO == 0 && EVLA ==0 && EVLO ==0) || (STLA == -12345 && STLO == -12345 && EVLA ==-12345 && EVLO ==-12345))
        errordlg('Lack of latitude/longitude information .','error');
        return
    end
    %  ���㷽λ�ǣ�̨վ��������еķ�λ�ǣ���
    clcu_info(8)=Azim(STLO,STLA,EVLO,EVLA);
end
%  ���µ�ǰaxes��Application Data��
setappdata(gca,'clcu_info',clcu_info);


% --------------------------------------------------------------------
function bkazimuth_Callback(hObject, eventdata, handles)
% hObject    handle to bkazimuth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��Ӧ�������õĲ�����
hd=getappdata(gca,'hd');
clcu_info=getappdata(gca,'clcu_info');
%  �����Ѿ����������λ��������ֹ���������¼��㡣
if (isnan(clcu_info(9)) == 0 )
    return
end
%  ���ļ�ͷ�ж�ȡ����λ�ǣ��������ݴ������ټ��㣻
BAZ=hd{1,1}(53,1);
if (BAZ ~= -12345 && BAZ ~= 0)
    clcu_info(9)=BAZ;
else
    %  ���ļ�ͷ�в����ڷ�λ������ʱ��ͨ��̨վ�����еľ�γ�������㣻
    STLA=hd{1,1}(32,1);    %  Station latitude (degrees, north positive).
    STLO=hd{1,1}(33,1);    %  Station longitude (degrees, east positive).
    EVLA=hd{1,1}(36,1);    %  Event latitude (degrees, north positive). 
    EVLO=hd{1,1}(37,1);    %  Event longitude (degrees, east positive). 
    %  ��̨վ�����о�γ������ȱʧʱ��������ֹ��
    if ((STLA == 0 && STLO == 0 && EVLA ==0 && EVLO ==0) || (STLA == -12345 && STLO == -12345 && EVLA ==-12345 && EVLO ==-12345))
        errordlg('Lack of latitude/longitude information .','error');
        return
    end
    %  ���㷴��λ�ǣ��൱�����������̨վ�ķ�λ�ǣ���
    clcu_info(9)=Azim(EVLO,EVLA,STLO,STLA);
end
%  ���µ�ǰaxes��Application Data��
setappdata(gca,'clcu_info',clcu_info);


% --------------------------------------------------------------------
function offsource_Callback(hObject, eventdata, handles)
% hObject    handle to offsource (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��Ӧ�������õĲ�����
hd=getappdata(gca,'hd');
clcu_info=getappdata(gca,'clcu_info');
%  �����Ѿ��������Դ��������ֹ���������¼��㡣
if (isnan(clcu_info(10)) == 0 )
    return
end
%  ��ȡ̨վ�����о�γ�����ݡ�
STLA=hd{1,1}(32,1);    %  Station latitude (degrees, north positive).
STLO=hd{1,1}(33,1);    %  Station longitude (degrees, east positive).
EVLA=hd{1,1}(36,1);    %  Event latitude (degrees, north positive). 
EVLO=hd{1,1}(37,1);    %  Event longitude (degrees, east positive). 
%  ��ȡ��Դ������ݡ�
EVDP=hd{1,1}(39,1);
%  ����Դ�������ȱʧʱ��������ֹ��
if (EVDP == 0 || EVDP == -12345)
    errordlg('Lack of depth information .','error');
    return
end
slo=STLO*pi/180;  %  ̨վ���ȣ�ת��Ϊ���ȣ�
sla=LatiTrans(STLA);  %  ̨վ������γ��
elo=EVLO*pi/180;  %  ���о��ȣ�ת��Ϊ���ȣ�
ela=LatiTrans(EVLA);  %  ���е�����γ��
%  �������о�(Epicentral distance)��
t=acos(cos(ela)*cos(sla)+sin(ela)*sin(sla)*cos(elo-slo));
epc_dis=t*180*111.12/pi; %  ��λΪǧ��
%  ������Դ�ǣ�ֱ��P������Դ�ǣ���
deg=atan(epc_dis*1000/EVDP);
clcu_info(10)=deg*180/pi;
%  �����Შ����ʶ����ֵ��
if (epc_dis >= 1000)
    clcu_info(12)=1;
else
    if (clcu_info(10) >= 45)
        clcu_info(12)=1;
    else
        clcu_info(12)=2;
    end
end
%  ���µ�ǰaxes��Application Data��
setappdata(gca,'clcu_info',clcu_info);


% --------------------------------------------------------------------
function Setting_Callback(hObject, eventdata, handles)
% hObject    handle to Setting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RptPath_Callback(hObject, eventdata, handles)
% hObject    handle to RptPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰ���õ����·����
path=getappdata(handles.figure1,'path2');
%  ����һ��Ŀ¼ѡ��Ի���Ĭ��·��Ϊ��ǰ·����
str=uigetdir(path,'Please Select Path');
%  ���û����ȡ��ʱ������������
if (str == 0)
    return
else
    path=str;
end
%  ����·����
setappdata(handles.figure1,'path2',path);


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function guide_Callback(hObject, eventdata, handles)
% hObject    handle to guide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CUD_Callback(hObject, eventdata, handles)
% hObject    handle to CUD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��������İ����ĵ���
!SwaveSplit�����ĵ�.chm;

% --------------------------------------------------------------------
function EUD_Callback(hObject, eventdata, handles)
% hObject    handle to EUD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  �����Ӣ�İ����ĵ���
!Swavesplit_users_guide.chm;    


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
%  �жϣ���ͼ����handles.axes1~4��ʱ���ҵ�ǰ�������ڵ�ǰ����ϵ��Χ�ڣ����ҵ�ǰ��������ͼ�����ǿ�����ϵ��ʱ����ͼ����ͼ����ʾ��ǰ������ꡣ
%  ����ͼ���Ĺ��̣�
%  1�����ȴ���һ�����������ͼ����ʾ�������Ӷ���
%  2�������������Ӷ���Ϊ��0��0���㣬�������䲻�ɼ�����ô����Ϊ���ڴ���ͼ��ʱ����2���ַ�����
%  3��ɾ��ͼ���е��ߣ�����ͼ�����ַ��������ݣ�������ʾ��ǰ�����ꡣ
if ((pos(1,1)-xmin)*(xmax-pos(1,1))>0 && (pos(1,2)-ymin)*(ymax-pos(1,2))>0 && isempty(get(gca,'children'))~=1 && gca ~= handles.axes4)  
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
function righthand_btn_Callback(hObject, eventdata, handles)
% hObject    handle to righthand_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 

%  ��ȡ����EWindex��NSindex��hEW��hNS��
EWindex=getappdata(handles.figure1,'EWindex');
NSindex=getappdata(handles.figure1,'NSindex');
Zindex=getappdata(handles.figure1,'Zindex');
hEW=getappdata(handles.figure1,'hEW');
hNS=getappdata(handles.figure1,'hNS');
hZ=getappdata(handles.figure1,'hZ');
%  �������ϲ��������Ҽ��˵���
adjstlabl(handles,EWindex,NSindex,Zindex,hEW,hNS,hZ);


% --------------------------------------------------------------------
function View_Info_Callback(hObject, eventdata, handles)
% hObject    handle to View_Info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hd=getappdata(gca,'hd');
clcu_info=getappdata(gca,'clcu_info');
SeisInfo(hd,clcu_info);
   

% --- Executes during object creation, after setting all properties.
function ChooseEW_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChooseEW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function ChooseEW_Callback(hObject, eventdata, handles)
% hObject    handle to ChooseEW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡEWindex��EWtemp��
EWindex=getappdata(handles.figure1,'EWindex');
EWtemp=getappdata(handles.figure1,'EWtemp');
%  ����EWindex�ж��Ƿ�ѡ�У���ʵ����Ӧ�Ĺ��ܡ�
EWtemp=EWtemp*(-1);
EWindex=EWindex+EWtemp;
if (EWindex == 1)
    ylabel(gca,'EW','FontWeight','bold','FontSize',10,'Color','r',...
           'Rotation',[0],'Units','normalized','Position',[-0.0377 0.5 0]);
    set(handles.ChooseEW,'Checked','on');
    hEW=gca;
else
    h=get(gca,'YLabel');
    delete(h);
    set(handles.ChooseEW,'Checked','off');
    hEW=[];
end
%  ����EWindex��EWtemp
setappdata(handles.figure1,'EWindex',EWindex);
setappdata(handles.figure1,'EWtemp',EWtemp);
setappdata(handles.figure1,'hEW',hEW);


% --- Executes during object creation, after setting all properties.
function ChooseNS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChooseNS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --------------------------------------------------------------------
function ChooseNS_Callback(hObject, eventdata, handles)
% hObject    handle to ChooseNS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡNSindex��NStemp��
NSindex=getappdata(handles.figure1,'NSindex');
NStemp=getappdata(handles.figure1,'NStemp');
%  ����NSindex�ж��Ƿ�ѡ�У���ʵ����Ӧ�Ĺ��ܡ�
NStemp=NStemp*(-1);
NSindex=NSindex+NStemp;
if (NSindex == 1)
    ylabel(gca,'NS','FontWeight','bold','FontSize',10,'Color','r',...
           'Rotation',[0],'Units','normalized','Position',[-0.0377 0.5 0]);
    set(handles.ChooseNS,'Checked','on');
    hNS=gca;
else
    h=get(gca,'YLabel');
    delete(h);
    set(handles.ChooseNS,'Checked','off');
    hNS=[];
end
%  ����NSindex��NStemp��
setappdata(handles.figure1,'NSindex',NSindex);
setappdata(handles.figure1,'NStemp',NStemp);
setappdata(handles.figure1,'hNS',hNS);


% --- Executes during object creation, after setting all properties.
function ChooseZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChooseZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --------------------------------------------------------------------
function ChooseZ_Callback(hObject, eventdata, handles)
% hObject    handle to ChooseZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡZindex��Ztemp��
Zindex=getappdata(handles.figure1,'Zindex');
Ztemp=getappdata(handles.figure1,'Ztemp');
%  ����Zindex�ж��Ƿ�ѡ�У���ʵ����Ӧ�Ĺ��ܡ�
Ztemp=Ztemp*(-1);
Zindex=Zindex+Ztemp;
if (Zindex == 1)
    ylabel(gca,'Z','FontWeight','bold','FontSize',10,'Color','r',...
           'Rotation',[0],'Units','normalized','Position',[-0.0377 0.5 0]);
    set(handles.ChooseZ,'Checked','on');
    hZ=gca;
else
    h=get(gca,'YLabel');
    delete(h);
    set(handles.ChooseZ,'Checked','off');
    hZ=[];
end
%  ����Zindex��Ztemp
setappdata(handles.figure1,'Zindex',Zindex);
setappdata(handles.figure1,'Ztemp',Ztemp);
setappdata(handles.figure1,'hZ',hZ);


% --------------------------------------------------------------------
function Rbtn_Savepic_Callback(hObject, eventdata, handles)
% hObject    handle to Rbtn_Savepic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Savepic_Callback(hObject, eventdata, handles);


% --------------------------------------------------------------------
function Rbtn_Savedata_Callback(hObject, eventdata, handles)
% hObject    handle to Rbtn_Savedata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Savedata_Callback(hObject, eventdata, handles);


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


% --------------------------------------------------------------------
function removeplot_Callback(hObject, eventdata, handles)
% hObject    handle to removeplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ���һ��ͼƬ��ȫ�ֱ���pltn1��1�������´��浽Application Data��
pltn1=getappdata(handles.figure1,'pltn1');
pltn1=pltn1-1;
setappdata(handles.figure1,'pltn1',pltn1);
%  ����ͼƬ�����֮ǰ��ѡΪEW��NS������ͼƬ���������Ӧ��indexҲ��֮�ı䡣
Delete_EWNS_Index(handles);
%  ���ͼƬ������axes��Visible���ó�off��
cla(gca,'reset');
set(gca,'Visible','off');
%  ͨ��ChekAxes�����õ���ͼƬ��axes�Լ���axes�ľ����
[hocupd,hfree]=ChekAxes(handles);
switch pltn1
    case 1
        set(hocupd(1),'Position',[0.041 0.271 0.755 0.498]);
    case 2
        temp1=get(hocupd(1),'Position');
        temp2=get(hocupd(2),'Position');
        if (abs(temp1(2)-0.573) < abs(temp2(2)-0.573))
            set(hocupd(1),'Position',[0.041 0.573 0.755 0.349]);
            set(hocupd(2),'Position',[0.041 0.113 0.755 0.349]);
        else
            set(hocupd(2),'Position',[0.041 0.573 0.755 0.349]);
            set(hocupd(1),'Position',[0.041 0.113 0.755 0.349]);
        end
end
%  ��û�в���ͼʱ������
if ( pltn1 == 0 )
    screensaver=getappdata(handles.figure1,'screensaver');
    set(screensaver,'Visible','on');
end


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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡEW��NS�����ľ����
hEW=getappdata(handles.figure1,'hEW');
hNS=getappdata(handles.figure1,'hNS');
%  �ж��Ƿ���ѡ�������ϱ�������
if ((isempty(hEW) == 1) || (isempty(hNS) == 1))
    errordlg('Please select NS/EW component first.','Error');
    return
end
%  �ж���ʼʱ���Ƿ���ͬ��
h1=getappdata(hEW,'hd');
h2=getappdata(hNS,'hd');
str1=char(h1{27,1});
str2=char(h2{27,1});
if ( ~strcmp(str1,str2) )
    errordlg('Please unified the start time of NS and EW component first.','Error');
    return
end
%  ���ӽ���CorrA_Sub1��CorrA_Sub1���������Ϊ�������figure������������Ϊ�������ӽ��棩��figure�����
h=CorrA_Sub1(handles.figure1);
%  ����guihandles�������h�������handles�ṹ�塣
CA1Handles=guihandles(h);
Copyplot(hNS,CA1Handles.axes1);
Copyplot(hEW,CA1Handles.axes2);
%  ���ӽ���ṹ�����������ṹ���С�
handles.CA1Handles=CA1Handles;
%  ���½ṹ�塣
guidata(hObject,handles);
        

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡEW��NS��Z�����ľ����
hEW=getappdata(handles.figure1,'hEW');
hNS=getappdata(handles.figure1,'hNS');
hZ=getappdata(handles.figure1,'hZ');
%  �ж��Ƿ���ѡEW��NS��Z������
if ((isempty(hEW) == 1) || (isempty(hNS) == 1) || (isempty(hZ) == 1))
    errordlg('Please select NS/EW/Z component first.','Error');
    return
end
%  �ж���ʼʱ���Ƿ���ͬ��
h1=getappdata(hEW,'hd');
h2=getappdata(hNS,'hd');
h3=getappdata(hZ,'hd');
str1=char(h1{27,1});
str2=char(h2{27,1});
str3=char(h3{27,1});
if ( ~strcmp(str1,str2) || ~strcmp(str1,str3) || ~strcmp(str2,str3) )
    errordlg('Please unified the start time of NS, EW and Z component first.','Error');
    return
end
%  ���ӽ���MEM_Sub��MEM_Sub���������Ϊ�������figure������������Ϊ�������ӽ��棩��figure�����
h=MEM_Sub(handles.figure1);
%  ����guihandles�������h�������handles�ṹ�塣
MEMHandles=guihandles(h);
Copyplot(hNS,MEMHandles.axes1);
Copyplot(hEW,MEMHandles.axes2);
Copyplot(hZ,MEMHandles.axes3);
%  ���ӽ���ṹ�����������ṹ���С�
handles.MEMHandles=MEMHandles;
%  ���½ṹ�塣
guidata(hObject,handles);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Result_Sub(handles.figure1);
