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

%  输入参数1为句柄h，此处为主界面figure的句柄。
h=varargin{1};
%  利用guihandles获得与句柄h相关联的handles结构体。
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

%  计算当前坐标系x轴、y轴的坐标范围。
xmin=min(get(gca,'XLim'));  
xmax=max(get(gca,'XLim'));
ymin=min(get(gca,'YLim'));
ymax=max(get(gca,'YLim'));
pos=mean(get(gca,'CurrentPoint'));      %  获得当前点坐标。
%  判断：当当前点坐标在当前坐标系范围内，并且当前坐标上有图（不是空坐标系）时创建图例，图例显示当前点的坐标。
%  创建图例的过程：
%  1、首先创建一个组对象，设置图例显示组对象的子对象。
%  2、创建组对象的子对象为（0，0）点，并且令其不可见。这么做是为了在创建图例时产生2个字符串。
%  3、删除图例中的线，更改图例中字符串的内容，令其显示当前点坐标。
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

%  读取当前设置的存储文件路径。
str=getappdata(handles.MainHandles.figure1,'path3');
DefaultPath=[str,'\untitled.fig'];
%  将当前要储存图像的句柄，赋值到hpic上。
hpic=gca;
%  由于saveas只能针对figure储存图像，故需要创建一个新figure。
newfig=figure;
set(newfig,'Visible','off');  %  令其不可见
delete(get(newfig,'Children'));  %  删除figure内的子对象，避免坐标轴重叠
%  将要储存的图像复制到新figure上。
copyobj(hpic,newfig);
set(newfig,'Units','Normalized','Position',[0,0,1,1]);  %  令新figure最大化
set(gca,'Units','Normalized','Position',[0.08,0.11,0.83,0.815]);  %  调整图像在figure中的位置
%  创建一个文件保存对话框。
[FileName,PathName]=uiputfile(...
{'*.fig','MATLAB Figure(*.fig)';'*.jpg','JPEG image(*.jpg)';...
 '*.bmp','Bitmap file(*.bmp)';'*.tif','TIFF image(*.tif)';'*.*','All Files(*.*)'},...
 'Save As',DefaultPath);
if (FileName == 0)
    %  当用户点击“取消”时，关闭新建figure，函数终止。
    close(newfig);
    return
else
    set(newfig,'Visible','on');           %  需要将figure的Visible属性设置为可见，否则打开保存好的图时，屏幕上什么都不会出现。
    saveas(newfig,fullfile(PathName,FileName));
    close(newfig);
end
%  更新存储文件路径。
setappdata(handles.MainHandles.figure1,'path3',PathName);


% --------------------------------------------------------------------
function SaveData_Callback(hObject, eventdata, handles)
% hObject    handle to Savedata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  读取当前设置的存储文件路径。
str=getappdata(handles.MainHandles.figure1,'path3');
DefaultPath=[str,'\untitled.dat'];
%  读取当前图像中的幅值数据。
sdata=getappdata(gca,'sdata');
%  创建一个文件保存对话框。
[FileName,PathName]=uiputfile(...
{'*.dat','Golden Software Data(*.dat)';...
 '*.txt','ASCII Data(*.txt)';'*.*','All Files(*.*)'},...
 '文件另存为',DefaultPath);
if (FileName == 0)
    %  当用户点击“取消”时，函数终止。
    return
else
    dlmwrite(fullfile(PathName,FileName),sdata);
end
%  更新存储文件路径。
setappdata(handles.MainHandles.figure1,'path3',PathName);


% --------------------------------------------------------------------
function Copy_Callback(hObject, eventdata, handles)
% hObject    handle to Copy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  将当前要储存图像的句柄，赋值到hpic上。
hpic=gca;
%  由于saveas只能针对figure储存图像，故需要创建一个新figure。
newfig=figure;
set(newfig,'Visible','off');  %  令其不可见
delete(get(newfig,'Children'));  %  删除figure内的子对象，避免坐标轴重叠
%  将要储存的图像复制到新figure上。
copyobj(hpic,newfig);
set(newfig,'Units','Normalized','Position',[0,0,1,1]);  %  令新figure最大化
set(gca,'Units','Normalized','Position',[0.08,0.11,0.83,0.815]);  %  调整图像在figure中的位置
%  将图像复制到剪切板。
hgexport(newfig,'-clipboard');
%  关闭新figure。
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
t1=round(t1*1000000)/1000000;  % 控制6位有效数字
t2=round(t2*1000000)/1000000;  % 控制6位有效数字
%  读取用户输入的截取时间。
st=get(handles.edit1,'String');
st=str2num(st);
ct=get(handles.edit2,'String');
ct=str2num(ct);
%  输入的起始/终止时间为空或不是数字时
if ( isempty(st) || isempty(ct)  )
    errordlg('Please re-enter the start/end time .','Error');
end
%  判断用户选择的分量图、输入的截取时间是否符合要求。
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
%  截取的时间数据为intcpttime;东西分量振幅为EWdata;南北分量振幅为NSdata。
t1=st/delta+1;
t2=ct/delta+1;
intcpttime=[0:delta:(t2-t1)*delta];
EWdata=getappdata(handles.axes2,'sdata');
EWdata=EWdata(t1:t2);
NSdata=getappdata(handles.axes1,'sdata');
NSdata=NSdata(t1:t2);
%  储存截取后的数据。
setappdata(handles.uipanel1,'intcpttime',intcpttime);
setappdata(handles.uipanel1,'EWdata',EWdata);
setappdata(handles.uipanel1,'NSdata',NSdata);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  读取绘图参数。
intcpttime=getappdata(handles.uipanel1,'intcpttime');
EWdata=getappdata(handles.uipanel1,'EWdata');
NSdata=getappdata(handles.uipanel1,'NSdata');
%  没点击“确认”的错误提示。
if ( isempty(intcpttime) == 1)
    errordlg('Please click ''Select'' button first .','Error');
    return
end
%  控制各控件的‘Visible’属性
set(handles.text20,'Visible','on');
set(handles.text21,'Visible','on');
set(handles.pushbutton7,'Visible','on');
set(handles.pushbutton8,'Visible','on');
%  在axes4上绘制截取的NS波形分量。
axes(handles.axes1);
plot(intcpttime,NSdata);
grid on;                                                             
%  在axes5上绘制截取的EW波形分量。
axes(handles.axes2);
plot(intcpttime,EWdata);
grid on;          
%  保存数据，将两幅图的幅值分别存到对应坐标系中。
setappdata(handles.axes1,'Y',NSdata);
setappdata(handles.axes2,'Y',EWdata);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  读取全局变量OutputReport_index。
OutputReport_index=getappdata(handles.MainHandles.figure1,'OutputReport_index');
%  载入EWdata、NSdata数据。
EWdata=getappdata(handles.uipanel1,'EWdata');
NSdata=getappdata(handles.uipanel1,'NSdata');
%  载入采样间隔，并取6位有效数字。
hd=getappdata(handles.axes2,'hd');
delta=hd{1,1}(1,1);
delta=round(delta*1000000)/1000000;  %  取6位有效数字
%  获取用户输入的旋转角度、时间延迟参数，并判断是否可用。
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
%  将时间参数转换为对应的数组标号。
t1=ts/delta;
t2=tf/delta;
t3=tsl/delta;
if (mod(ts,delta) ~= 0)||(mod(tf,delta) ~= 0)||(mod(tsl,delta) ~= 0)
    errordlg(['Please re-enter the delayed time, it should be a multiple of sampling interval which is ',num2str(delta),' .'],'Error');
    return
end
%  计算相关值。
[c,cmax,cmin]=Correlation(EWdata,NSdata,ds,dsl,df,t1,t2,t3);
x=[ds:dsl:df];
y=[ts:tsl:tf];
%  计算最大相关值以及其对应的旋转角度、时间延迟。
c=round(c*1e14)/1e14;  % 对相关值取14位有效数字
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
%  打开界面CorrA_Sub2，CorrA_Sub2的输入参数为主界面的figure句柄，输出界面为自身（即子界面）的figure句柄。
h=CorrA_Sub2(handles.figure1,handles.MainHandles.figure1);
%  利用guihandles获得与句柄h相关联的handles结构体。
CA2Handles=guihandles(h);
%  将界面CorrA_Sub2结构体存入界面CorrA_Sub2结构体中。
handles.CA2Handles=CA2Handles;
%  更新结构体。
guidata(hObject,handles);
%  在CorrA_Sub2的axes1上绘制等值线图。
ContourPlot(CA2Handles.axes1,x,y,c,maxd,maxt,maxcoef);
%  在CorrA_Sub2的axes2上绘制等最大最小相关值图。
DYContourPlot(CA2Handles.axes2,x,cmax,cmin);
%  在CorrA_Sub2的axes3上绘制相对位置图。
FixedLocationPlot(CA2Handles.axes3,hd,ts,tf,maxt,maxd);
%  输出brief report
output=OutCell(handles,hd,maxt,maxd,maxcoef);
%  转换为字符串
Str=[];
for i=1:13
    Str=strvcat(Str,char(output{i}));
end
set(CA2Handles.edit4,'String',Str,'FontSize',13,'FontWeight','bold');
%  保存参数
hd{28,1}=maxcoef;
hd{29,1}=maxd;
hd{30,1}=maxt;
setappdata(handles.figure1,'output',output');
setappdata(handles.figure1,'hd',hd);
%  从临时文件'SwaveTempotary2.mat'中载入head和tail
if ( exist('SwaveTempotary2.mat') )
    load('SwaveTempotary2.mat');
else
    head=1;
    tail=1;
end
%  从临时文件'SwaveTempotary1.mat'中载入队列Q
if ( exist('SwaveTempotary1.mat') )
    load('SwaveTempotary1.mat');
else
    Q=cell(1,9);
end
%  构建要储存的参数
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
%  将A插入到Q中
%  Q的形式：
% ----------------------------------------------------------------------------------
%|    | 文件名 | hd | String | x;y;c | cmin;cmax | edit1~edit8 | 特征值法参数 | 误差 |        
% ----------------------------------------------------------------------------------
%|记录|
ncell=201;
[Q,head,tail]=Enqueue4cell(Q,ncell,head,tail,A);
%  保存临时文件
save('SwaveTempotary1.mat','Q');
save('SwaveTempotary2.mat','head','tail');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  绘制截取前的波形图
Copyplot(handles.axes1,handles.axes1);
Copyplot(handles.axes2,handles.axes2);
%  控制各控件的‘Visible’属性
set(handles.text20,'Visible','off');
set(handles.text21,'Visible','off');
set(handles.pushbutton7,'Visible','off');
set(handles.pushbutton8,'Visible','off');
%  清除之前所截取的内容
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

%  绘制截取前的波形图
Copyplot(handles.axes1,handles.axes1);
Copyplot(handles.axes2,handles.axes2);
%  控制各控件的‘Visible’属性
set(handles.text20,'Visible','off');
set(handles.text21,'Visible','off');
set(handles.pushbutton7,'Visible','off');
set(handles.pushbutton8,'Visible','off');
