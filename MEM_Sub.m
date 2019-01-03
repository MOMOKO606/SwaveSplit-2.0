function varargout = MEM_Sub(varargin)
% MEM_SUB MATLAB code for MEM_Sub.fig
%      MEM_SUB, by itself, creates a new MEM_SUB or raises the existing
%      singleton*.
%
%      H = MEM_SUB returns the handle to a new MEM_SUB or the handle to
%      the existing singleton*.
%
%      MEM_SUB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEM_SUB.M with the given input arguments.
%
%      MEM_SUB('Property','Value',...) creates a new MEM_SUB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MEM_Sub_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MEM_Sub_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MEM_Sub

% Last Modified by GUIDE v2.5 27-Jan-2016 15:48:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MEM_Sub_OpeningFcn, ...
                   'gui_OutputFcn',  @MEM_Sub_OutputFcn, ...
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


% --- Executes just before MEM_Sub is made visible.
function MEM_Sub_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MEM_Sub (see VARARGIN)

%  输入参数1为句柄h，此处为主界面figure的句柄。
h=varargin{1};
%  利用guihandles获得与句柄h相关联的handles结构体。
handles.MainHandles= guihandles(h);

% Choose default command line output for MEM_Sub
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MEM_Sub wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MEM_Sub_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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
%  判断：当当前点坐标在当前坐标系范围内，并且当前坐标上有图（不是空坐标系）时,并且当前坐标系不是隐形时，创建图例，图例显示当前点的坐标。
%  创建图例的过程：
%  1、首先创建一个组对象，设置图例显示组对象的子对象。
%  2、创建组对象的子对象为（0，0）点，并且令其不可见。这么做是为了在创建图例时产生2个字符串。
%  3、删除图例中的线，更改图例中字符串的内容，令其显示当前点坐标。
str=get(gca,'Visible');
flag=strcmp(str,'on');
if ((pos(1,1)-xmin)*(xmax-pos(1,1))>0 && (pos(1,2)-ymin)*(ymax-pos(1,2))>0 && isempty(get(gca,'children'))~=1 && flag)  
    h_group=hggroup;                                                                                              
    set(get(get(h_group,'Annotation'),'LegendInformation'),'IconDisplayStyle','children');
    line(0,0,'HitTest','off','Parent',h_group,'Visible','off');
    h_legend=legend(gca,'show');
    delete(findobj(h_legend,'Type','line'));
    h_text=findobj(h_legend,'Type','text');
    set(h_text(1),'Position',[0.1 0.7 0],'String',sprintf('x:%5.2f',pos(1,1)));
    set(h_text(2),'Position',[0.1 0.3 0],'String',sprintf('y:%5.2f',pos(1,2)));
    setappdata(gca,'h_legend',h_legend);
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



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  载入采样间隔
hd=getappdata(handles.axes1,'hd');
t1=hd{1,1}(1,1);
hd=getappdata(handles.axes2,'hd');
t2=hd{1,1}(1,1);
hd=getappdata(handles.axes3,'hd');
t3=hd{1,1}(1,1);
t1=round(t1*1000000)/1000000;  % 控制6位有效数字
t2=round(t2*1000000)/1000000;  % 控制6位有效数字
t3=round(t1*1000000)/1000000;  % 控制6位有效数字
%  读取用户输入的截取时间。
st=get(handles.edit5,'String');
st=str2num(st);
ct=get(handles.edit6,'String');
ct=str2num(ct);
%  输入的起始/终止时间为空或不是数字时
if ( isempty(st) || isempty(ct)  )
    errordlg('Please re-enter the start/end time .','Error');
end
%  判断用户选择的分量图、输入的截取时间是否符合要求。
if ( t1 ~= t2 || t2 ~= t3 || t1 ~= t3 )
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
%  判断起始时间是否小于终止时间
if ( st >= ct )
    errordlg('Please re-enter the start/end time .','Error');
end
%  隐藏一些控件
%  隐藏静态字体
set(handles.text1,'Visible','off');
set(handles.text2,'Visible','off');
set(handles.text3,'Visible','off');
%  隐藏坐标系
set(handles.axes1,'Visible','off');
set(handles.axes2,'Visible','off');
set(handles.axes3,'Visible','off');
%  隐藏坐标系上的图
set(get(handles.axes1,'Children'),'Visible','off');
set(get(handles.axes2,'Children'),'Visible','off');
set(get(handles.axes3,'Children'),'Visible','off');
%  转换为截取区间的index
stindex=st/delta+1;
ctindex=ct/delta+1;
%  载入窗长的变化范围
minwl=get(handles.edit11,'String');
minwl=str2num(minwl);
if ( minwl == 1 )
    errordlg(['The min length of time window is 2 sampling points.'],'Error');
    return
end
maxwl=get(handles.edit12,'String');
maxwl=str2num(maxwl);
%  table共有n+1行
data=get(handles.uitable2,'data');
n=maxwl-minwl+1;
%  载入三分量振幅数据
x=getappdata(handles.axes1,'sdata');
y=getappdata(handles.axes2,'sdata');
z=getappdata(handles.axes3,'sdata');
k=1;
temp1=[];  %  存放最大特征值对应的窗口的终点
temp2=[];  %  存放最大特征值对应的特征向量
%  计算最大特征值及其对应的特征向量
for wl=minwl:maxwl
    maxvalue=-inf;
    maxvect=[];
    for i=stindex:ctindex
        j=i+wl-1;
        M=[x(i:j),y(i:j),z(i:j)];
        W=cov(M);
        [V,D]=eig(W);
        [A,value,vect]=MaxEig(V,D);
        if ( value > maxvalue )
            maxvalue=value;
            maxvect=vect;
            R=1-A(2)/value;            
            data{k,5}=[num2str(i),' , ',num2str(j)];
            p=j;
        end
    end
    temp1=[temp1;p];
    temp2=[temp2,maxvect];
    data{k,1}=stindex;
    data{k,2}=ctindex+wl-1;
    data{k,3}=wl;
    data{k,4}=maxvalue;
    data{k,6}=[num2str(maxvect(1)),' , ',num2str(maxvect(2)),' , ',num2str(maxvect(3))];
    data{k,7}=R;
    k=k+1;
end
%  table赋值
set(handles.uitable2,'data',data);
%  最大的最大特征值窗口终点
a=mode(temp1);
str=char(hd{27,1});
b{1}=['The arrival time of the fast/slow shear-waver is: ',num2str((a-1)*delta),' s past ',str,'.'];
%  最大的最大特征值对应的特征向量   
for i=1:n
    if ( temp1(i) == a )
        index=i;
    end
end
mmvect=temp2(:,index);
deg=GetPolar(mmvect);
b{2}=['The polarization direction is: ',num2str(deg),' °.'];
Str=[];
for i=1:2
    Str=strvcat(Str,char(b{i}));
end
%  输出结果
set(handles.edit13,'String',Str);
%  显示一些控件
set(handles.uitable2,'Visible','on');
set(handles.edit13,'Visible','on');
set(handles.pushbutton2,'Visible','on');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  隐藏控件
set(handles.uitable2,'Visible','off');
set(handles.edit13,'Visible','off');
set(handles.pushbutton2,'Visible','off');
%  显示控件
set(handles.text1,'Visible','on');
set(handles.text2,'Visible','on');
set(handles.text3,'Visible','on');
%  显示坐标系
set(handles.axes1,'Visible','on');
set(handles.axes2,'Visible','on');
set(handles.axes3,'Visible','on');
%  显示坐标系上的图
set(get(handles.axes1,'Children'),'Visible','on');
set(get(handles.axes2,'Children'),'Visible','on');
set(get(handles.axes3,'Children'),'Visible','on');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  读取当前设置的输出路径。
path=getappdata(handles.MainHandles.figure1,'path2');
hd=getappdata(handles.axes1,'hd');
filename=[deblank(hd{2,1}),'_',hd{26,1},'_',hd{27,1}];
filename=[path,'\',filename,'.docx'];  %  Default 文件名
%  创建一个输出文件对话框。
[FileName,PathName]=uiputfile('*.docx','Save as',filename);
%  当用户在对话框中点击“取消”时，Open_Callback停止。
if ( FileName == 0 )
    return
end
%  载入table中的数据
data=get(handles.uitable2,'data');
if ( isempty(data))
    return
end
[m,n]=size(data);
M=m+5;
N=n+1;
%  载入edit中的数据
Str=get(handles.edit13,'String');
%  创建Microsoft Word服务器。
Word=actxserver('Word.Application'); 
%  当函数运行完后，关闭Microsoft Word服务器。
c=onCleanup(@()Word.Quit);
% 打开该新建一个word文件，并保存。
Document=Word.Documents.Add;
Content=Document.Content;  %  返回Content接口句柄
Selection=Word.Selection;  %  返回Selection接口句柄
%  将光标位置移到文本的最后。
Selection.Start=Content.end;  
%  绘制表格，在光标所在位置插入一个M行N列的表格，并返回句柄DTI。
DTI=Document.Tables.Add(Selection.Range,M,N);
%  设置表格边框
DTI.Borders.OutsideLineStyle='wdLineStyleSingle';
DTI.Borders.InsideLineStyle='wdLineStyleSingle';
DTI.Rows.Alignment='wdAlignRowCenter';  %  令表格居中
DTI.Rows.Item(M-1).Borders.Item(1).LineStyle='wdLineStyleNone';  %  将倒数第2行的上边框线删除
%  设置表格列宽
column_width=[23,33,33,53,63,53,66,70];
for i=1:N
    DTI.Columns.Item(i).Width=column_width(i);
end
%  合并单元格
DTI.Cell(1,1).Merge(DTI.Cell(1,N));
DTI.Cell(M-2,1).Merge(DTI.Cell(M-2,N));
DTI.Cell(M-1,1).Merge(DTI.Cell(M-1,N));
DTI.Cell(M,1).Merge(DTI.Cell(M,N));
%  设置表格内的文字位置，大小等信息。
DTI.Range.Font.Size=10.5;  %  全文设置为12号字
DTI.Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  表格内字体居中
DTI.Cell(1,1).Range.Font.Size=18;  %  第一行用三号字
DTI.Cell(1,1).Range.Font.Bold=4;  %  字体加粗
DTI.Cell(M-2,1).Range.Font.Size=12;  %  倒数第三行用三号字
DTI.Cell(M-1,1).Range.Font.Size=12;  %  倒数第二行用三号字
DTI.Cell(M-2,1).Range.Paragraphs.Alignment='wdAlignParagraphLeft';  %  倒数第三行左对齐
DTI.Cell(M-1,1).Range.Paragraphs.Alignment='wdAlignParagraphLeft';  %  倒数第二行左对齐
DTI.Cell(M,1).Range.Paragraphs.Alignment='wdAlignParagraphRight';  %  最后一行右对齐
%  写入表格内容
%  表格标题部分
DTI.Cell(1,1).Range.Text='The Max Eigenvalue Analysis Report';  %  表格标题内容
%  第二行输入列名
DTI.Cell(2,2).Range.Text='Start Point';  
DTI.Cell(2,3).Range.Text='End Point';  
DTI.Cell(2,4).Range.Text='Window Length';  
DTI.Cell(2,5).Range.Text='The Maximum Eigenvalue';  
DTI.Cell(2,6).Range.Text='The Relevant Window';  
DTI.Cell(2,7).Range.Text='The Relevant Eigenvector';
DTI.Cell(2,8).Range.Text='Min Acceptable Rectilinearity';
%  输入表格内容
for i=3:M-3
    DTI.Cell(i,1).Range.Text=num2str(i-2); 
    for j=2:N
         str=data(i-2,j-1);
         str=str{1,1};
         if ( ~ischar(str) )
             str=num2str(str);
         end
         DTI.Cell(i,j).Range.Text=str;
    end
end
DTI.Cell(M-2,1).Range.Text=Str(1,:);
DTI.Cell(M-1,1).Range.Text=Str(2,:);
%  在最后一行输出时间
ti=now;
str=datestr(ti,0);
str0=[str(1:12),str(13:14),'h',str(16:17),'min',str(19:20),'s'];
DTI.Cell(M,1).Range.Text=str0;
Selection.Start=Content.end;  %  将光标移动到文本最后
Selection.TypeParagraph;  %  回车
%  保存文档。
Document.SaveAs2([PathName,FileName]); 
Document.Close;  %  关闭Word文件，否则第二次及以后输入时，服务器界面将可见
        
