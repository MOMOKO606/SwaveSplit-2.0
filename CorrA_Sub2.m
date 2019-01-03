function varargout = CorrA_Sub2(varargin)
% CORRA_SUB2 M-file for CorrA_Sub2.fig
%      CORRA_SUB2, by itself, creates a new CORRA_SUB2 or raises the existing
%      singleton*.
%
%      H = CORRA_SUB2 returns the handle to a new CORRA_SUB2 or the handle to
%      the existing singleton*.
%
%      CORRA_SUB2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CORRA_SUB2.M with the given input arguments.
%
%      CORRA_SUB2('Property','Value',...) creates a new CORRA_SUB2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CorrA_Sub2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CorrA_Sub2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CorrA_Sub2

% Last Modified by GUIDE v2.5 29-Dec-2015 21:32:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CorrA_Sub2_OpeningFcn, ...
                   'gui_OutputFcn',  @CorrA_Sub2_OutputFcn, ...
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


% --- Executes just before CorrA_Sub2 is made visible.
function CorrA_Sub2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CorrA_Sub2 (see VARARGIN)

%  输入参数1为句柄h，此处为CorrA_Sub1.figure的句柄。
h=varargin{1};
%  利用guihandles获得与句柄h相关联的handles结构体。
handles.CASub1=guihandles(h);
%  输入参数1为句柄h，此处为Main_SwaveSplit_2.figure的句柄。
h=varargin{2};
%  利用guihandles获得与句柄h相关联的handles结构体。
handles.Mainhandles=guihandles(h);
%  更新结构体。
guidata(hObject,handles);

% Choose default command line output for CorrA_Sub2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CorrA_Sub2 wait for user response (see UIRESUME)
% uiwait(handles.figure3);


% --- Outputs from this function are returned to the command line.
function varargout = CorrA_Sub2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function righthand_btn1_Callback(hObject, eventdata, handles)
% hObject    handle to righthand_btn1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Rbtn_Savepic_Callback(hObject, eventdata, handles)
% hObject    handle to Rbtn_Savepic (see GCBO)
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
%  创建一个文件保存对话框。
[FileName,PathName]=uiputfile(...
{'*.fig','MATLAB Figure(*.fig)';'*.jpg','JPEG image(*.jpg)';...
 '*.bmp','Bitmap file(*.bmp)';'*.tif','TIFF image(*.tif)';'*.*','All Files(*.*)'},...
 'Save As',pwd);
if (FileName == 0)
    %  当用户点击“取消”时，关闭新建figure，函数终止。
    close(newfig);
    return
else
    set(newfig,'Visible','on');           %  需要将figure的Visible属性设置为可见，否则打开保存好的图时，屏幕上什么都不会出现。
    saveas(newfig,fullfile(PathName,FileName));
    close(newfig);
end


% --------------------------------------------------------------------
function Copypic_Callback(hObject, eventdata, handles)
% hObject    handle to Copypic (see GCBO)
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


% --- Executes during object creation, after setting all properties.
function uipanel4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function radiobutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes on button press in radiobutton1.


function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton2,'Enable','on');
set(handles.radiobutton1,'Enable','off');


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton1,'Enable','on');
set(handles.radiobutton2,'Enable','off');


% --------------------------------------------------------------------
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%  读取当前设置的输出路径。
path=getappdata(handles.Mainhandles.figure1,'path2');
%  载入radiobutton参数
v1=get(handles.radiobutton1,'Value');
v2=get(handles.radiobutton2,'Value');
%  载入文件头
hd=getappdata(handles.CASub1.figure1,'hd');
filename=[deblank(hd{2,1}),'_',hd{26,1},'_',hd{27,1}];
%  根据用户选择的输出格式生成default文件名
if ( v1 == 1 )
    filename=[path,'\',filename,'.txt'];
    %  创建一个输出文件对话框。
    [FileName,PathName]=uiputfile('*.txt','Save as',filename);
elseif ( v2 == 1 )
    filename=[path,'\',filename,'.docx'];
    %  创建一个输出文件对话框。
    [FileName,PathName]=uiputfile('*.docx','Save as',filename);
end
%  当用户在对话框中点击“取消”时，Open_Callback停止。
if ( FileName == 0 )
    return
end
if ( v1 == 1 )
    output=getappdata(handles.CASub1.figure1,'output');
    %  输出结果到文件中
    fid=fopen([PathName,FileName],'w');
    for i=1:13
        fprintf(fid,'%s\r\n',output{i,1});
    end
    fclose(fid);
elseif ( v2 == 1 )
    OutDocxEnglish(PathName,FileName,handles,hd);
end
    
    
