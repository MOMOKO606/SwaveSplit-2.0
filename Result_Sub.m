function varargout = Result_Sub(varargin)
% RESULT_SUB MATLAB code for Result_Sub.fig
%      RESULT_SUB, by itself, creates a new RESULT_SUB or raises the existing
%      singleton*.
%
%      H = RESULT_SUB returns the handle to a new RESULT_SUB or the handle to
%      the existing singleton*.
%
%      RESULT_SUB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULT_SUB.M with the given input arguments.
%
%      RESULT_SUB('Property','Value',...) creates a new RESULT_SUB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Result_Sub_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Result_Sub_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Result_Sub

% Last Modified by GUIDE v2.5 27-Jan-2016 15:56:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Result_Sub_OpeningFcn, ...
                   'gui_OutputFcn',  @Result_Sub_OutputFcn, ...
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


% --- Executes just before Result_Sub is made visible.
function Result_Sub_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Result_Sub (see VARARGIN)

%  输入参数1为句柄h，此处为主界面figure的句柄。
h=varargin{1};
%  利用guihandles获得与句柄h相关联的handles结构体。
handles.Mainhandles= guihandles(h);


% Choose default command line output for Result_Sub
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Result_Sub wait for user response (see UIRESUME)
% uiwait(handles.figure1);


%  从临时文件'SwaveTempotary1.mat'中载入队列Q
if ( exist('SwaveTempotary1.mat') )
    load('SwaveTempotary1.mat');
    set(handles.pushbutton1,'enable','on');
    set(handles.pushbutton2,'enable','on');
    set(handles.pushbutton3,'enable','on');
    set(handles.pushbutton4,'enable','on');
    set(handles.pushbutton5,'enable','on');
    set(handles.pushbutton6,'enable','on');
    %  从临时文件'SwaveTempotary2.mat'中载入head和tail
    load('SwaveTempotary2.mat');
else
    set(handles.pushbutton1,'enable','off');
    set(handles.pushbutton2,'enable','off');
    set(handles.pushbutton3,'enable','off');
    set(handles.pushbutton4,'enable','off');
    set(handles.pushbutton5,'enable','off');
    set(handles.pushbutton6,'enable','off');
    return
end
ncell=201;
Str=[];
k=1;
%  从Q中载入文件名
if ( tail > head )
    for i=tail-1:-1:head
        %  创建字符串
        str1=Trans2Str(Q{i,1},k);
        Str=[Str;str1];
        k=k+1;
    end
else
    for i=tail-1:-1:1
        %  转换为字符串
        str1=Trans2Str(Q{i,1},k);
        Str=[Str;str1];
        k=k+1;
    end
    for i=ncell:-1:head
        str1=Trans2Str(Q{i,1},k);
        Str=[Str;str1];
        k=k+1;
    end
end
set(handles.listbox1,'String',Str);


% --- Outputs from this function are returned to the command line.
function varargout = Result_Sub_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  载入Q，head和tail
load('SwaveTempotary1.mat');
load('SwaveTempotary2.mat');
ncell=201;  %  设定临时文件中存储的Q不超过ncell行
%  读取用户选定的listbox内容
v=get(handles.listbox1,'Value');
if ( isempty(v) )
    errordlg('Please Select item.');
    return
end
%  转换index
p=TransIndex( v,head,tail,ncell );
%  删除Q中的内容
[~,n]=size(Q);
lp=length(p);
for i=1:lp
    for j=1:n
        Q{p(i),j}=[];
    end
end
%  修改Q，head和tail
k=1;
sum=0;
if ( tail > head )
    for i=tail-1:-1:head
        if ( ischar(Q{i,1}) )
            for j=1:n
                temp{k,j}=Q{i,j};
            end
            k=k+1;
            sum=sum+1;
        end
    end
elseif ( tail == 1 )
    for i=ncell:-1:head
        if ( ischar(Q{i,1}) )
            for j=1:n
                temp{k,j}=Q{i,j};
            end
            k=k+1;
            sum=sum+1;
        end
    end
else
    for i=tail-1:-1:1
        if ( ischar(Q{i,1}) )
            for j=1:n
                temp{k,j}=Q{i,j};
            end
            k=k+1;
            sum=sum+1;
        end
    end
    for i=ncell:-1:head
        if ( ischar(Q{i,1}) )
            for j=1:n
                temp{k,j}=Q{i,j};
            end
            k=k+1;
            sum=sum+1;
        end
    end
end
%  当listbox被删空时
if ( sum == 0 )
    pushbutton2_Callback(hObject, eventdata, handles);
    return
end
head=1;
tail=sum+1;
Q=flipud(temp);
%  修改listbox
Str=[];
k=1;
for i=tail-1:-1:head
    %  创建字符串
    str1=Trans2Str(Q{i,1},k);
    Str=[Str;str1];
    k=k+1;
end
set(handles.listbox1,'Value',1);
set(handles.listbox1,'String',Str);
%  保存临时文件
save('SwaveTempotary1.mat','Q');
save('SwaveTempotary2.mat','head','tail');
    

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete('SwaveTempotary1.mat');
delete('SwaveTempotary2.mat');
set(handles.pushbutton1,'enable','off');
set(handles.pushbutton2,'enable','off');
set(handles.pushbutton3,'enable','off');
set(handles.pushbutton4,'enable','off');
set(handles.pushbutton5,'enable','off');
set(handles.pushbutton6,'enable','off');
set(handles.listbox1,'String','');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  读取当前设置的输出路径。
DefaultPath=getappdata(handles.Mainhandles.figure1,'path2');
%  打开对话框
[FileName,PathName]=uiputfile('*.txt','Save as',DefaultPath);
%  当用户在对话框中点击“取消”时，Open_Callback停止。
if ( FileName == 0 )
    return
end
%  读取用户选定的listbox内容
v=get(handles.listbox1,'Value');
if ( isempty(v) )
    errordlg('Please Select item.');
    return
end
%  载入Q，head和tail
load('SwaveTempotary1.mat');
load('SwaveTempotary2.mat');
ncell=201;  %  设定临时文件中存储的Q不超过ncell行
%  转换index
p=TransIndex( v,head,tail,ncell );
n=length(p);
fid=fopen([PathName,FileName],'w');
for j=1:n
    t=Q{p(j),3}';
    for i=1:13
        fprintf(fid,'%s\r\n',t{i,1});
    end
    fprintf(fid,'%s\r\n',' ');
    fprintf(fid,'%s\r\n','***********************************************************************************************');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  读取当前设置的输出路径。
DefaultPath=getappdata(handles.Mainhandles.figure1,'path2');
%  读取用户选定的listbox内容
v=get(handles.listbox1,'Value');
if ( isempty(v) )
    errordlg('Please Select item.');
    return
end
%  载入Q，head和tail
load('SwaveTempotary1.mat');
load('SwaveTempotary2.mat');
ncell=201;  %  设定临时文件中存储的Q不超过ncell行
%  转换index
p=TransIndex( v,head,tail,ncell );
OutFigs(DefaultPath,Q,p);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  读取用户选定的listbox内容
v=get(handles.listbox1,'Value');
if ( isempty(v) )
    errordlg('Please Select item.');
    return
end
%  载入Q，head和tail
load('SwaveTempotary1.mat');
load('SwaveTempotary2.mat');
ncell=201;  %  设定临时文件中存储的Q不超过ncell行
%  转换index
p=TransIndex( v,head,tail,ncell );
RosePlot(Q,p);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  读取用户选定的listbox内容
v=get(handles.listbox1,'Value');
if ( isempty(v) )
    errordlg('Please Select item.');
    return
end
%  载入Q，head和tail
load('SwaveTempotary1.mat');
load('SwaveTempotary2.mat');
ncell=201;  %  设定临时文件中存储的Q不超过ncell行
%  转换index
p=TransIndex( v,head,tail,ncell );
LocationPlotSum(Q,p);
