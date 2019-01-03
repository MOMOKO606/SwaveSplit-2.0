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

%  �������1Ϊ���h���˴�Ϊ������figure�ľ����
h=varargin{1};
%  ����guihandles�������h�������handles�ṹ�塣
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

%  ���㵱ǰ����ϵx�ᡢy������귶Χ��
xmin=min(get(gca,'XLim'));  
xmax=max(get(gca,'XLim'));
ymin=min(get(gca,'YLim'));
ymax=max(get(gca,'YLim'));
pos=mean(get(gca,'CurrentPoint'));      %  ��õ�ǰ�����ꡣ
%  �жϣ�����ǰ�������ڵ�ǰ����ϵ��Χ�ڣ����ҵ�ǰ��������ͼ�����ǿ�����ϵ��ʱ,���ҵ�ǰ����ϵ��������ʱ������ͼ����ͼ����ʾ��ǰ������ꡣ
%  ����ͼ���Ĺ��̣�
%  1�����ȴ���һ�����������ͼ����ʾ�������Ӷ���
%  2�������������Ӷ���Ϊ��0��0���㣬�������䲻�ɼ�����ô����Ϊ���ڴ���ͼ��ʱ����2���ַ�����
%  3��ɾ��ͼ���е��ߣ�����ͼ�����ַ��������ݣ�������ʾ��ǰ�����ꡣ
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

%  ����������
hd=getappdata(handles.axes1,'hd');
t1=hd{1,1}(1,1);
hd=getappdata(handles.axes2,'hd');
t2=hd{1,1}(1,1);
hd=getappdata(handles.axes3,'hd');
t3=hd{1,1}(1,1);
t1=round(t1*1000000)/1000000;  % ����6λ��Ч����
t2=round(t2*1000000)/1000000;  % ����6λ��Ч����
t3=round(t1*1000000)/1000000;  % ����6λ��Ч����
%  ��ȡ�û�����Ľ�ȡʱ�䡣
st=get(handles.edit5,'String');
st=str2num(st);
ct=get(handles.edit6,'String');
ct=str2num(ct);
%  �������ʼ/��ֹʱ��Ϊ�ջ�������ʱ
if ( isempty(st) || isempty(ct)  )
    errordlg('Please re-enter the start/end time .','Error');
end
%  �ж��û�ѡ��ķ���ͼ������Ľ�ȡʱ���Ƿ����Ҫ��
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
%  �ж���ʼʱ���Ƿ�С����ֹʱ��
if ( st >= ct )
    errordlg('Please re-enter the start/end time .','Error');
end
%  ����һЩ�ؼ�
%  ���ؾ�̬����
set(handles.text1,'Visible','off');
set(handles.text2,'Visible','off');
set(handles.text3,'Visible','off');
%  ��������ϵ
set(handles.axes1,'Visible','off');
set(handles.axes2,'Visible','off');
set(handles.axes3,'Visible','off');
%  ��������ϵ�ϵ�ͼ
set(get(handles.axes1,'Children'),'Visible','off');
set(get(handles.axes2,'Children'),'Visible','off');
set(get(handles.axes3,'Children'),'Visible','off');
%  ת��Ϊ��ȡ�����index
stindex=st/delta+1;
ctindex=ct/delta+1;
%  ���봰���ı仯��Χ
minwl=get(handles.edit11,'String');
minwl=str2num(minwl);
if ( minwl == 1 )
    errordlg(['The min length of time window is 2 sampling points.'],'Error');
    return
end
maxwl=get(handles.edit12,'String');
maxwl=str2num(maxwl);
%  table����n+1��
data=get(handles.uitable2,'data');
n=maxwl-minwl+1;
%  �����������������
x=getappdata(handles.axes1,'sdata');
y=getappdata(handles.axes2,'sdata');
z=getappdata(handles.axes3,'sdata');
k=1;
temp1=[];  %  ����������ֵ��Ӧ�Ĵ��ڵ��յ�
temp2=[];  %  ����������ֵ��Ӧ����������
%  �����������ֵ�����Ӧ����������
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
%  table��ֵ
set(handles.uitable2,'data',data);
%  �����������ֵ�����յ�
a=mode(temp1);
str=char(hd{27,1});
b{1}=['The arrival time of the fast/slow shear-waver is: ',num2str((a-1)*delta),' s past ',str,'.'];
%  �����������ֵ��Ӧ����������   
for i=1:n
    if ( temp1(i) == a )
        index=i;
    end
end
mmvect=temp2(:,index);
deg=GetPolar(mmvect);
b{2}=['The polarization direction is: ',num2str(deg),' ��.'];
Str=[];
for i=1:2
    Str=strvcat(Str,char(b{i}));
end
%  ������
set(handles.edit13,'String',Str);
%  ��ʾһЩ�ؼ�
set(handles.uitable2,'Visible','on');
set(handles.edit13,'Visible','on');
set(handles.pushbutton2,'Visible','on');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ���ؿؼ�
set(handles.uitable2,'Visible','off');
set(handles.edit13,'Visible','off');
set(handles.pushbutton2,'Visible','off');
%  ��ʾ�ؼ�
set(handles.text1,'Visible','on');
set(handles.text2,'Visible','on');
set(handles.text3,'Visible','on');
%  ��ʾ����ϵ
set(handles.axes1,'Visible','on');
set(handles.axes2,'Visible','on');
set(handles.axes3,'Visible','on');
%  ��ʾ����ϵ�ϵ�ͼ
set(get(handles.axes1,'Children'),'Visible','on');
set(get(handles.axes2,'Children'),'Visible','on');
set(get(handles.axes3,'Children'),'Visible','on');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  ��ȡ��ǰ���õ����·����
path=getappdata(handles.MainHandles.figure1,'path2');
hd=getappdata(handles.axes1,'hd');
filename=[deblank(hd{2,1}),'_',hd{26,1},'_',hd{27,1}];
filename=[path,'\',filename,'.docx'];  %  Default �ļ���
%  ����һ������ļ��Ի���
[FileName,PathName]=uiputfile('*.docx','Save as',filename);
%  ���û��ڶԻ����е����ȡ����ʱ��Open_Callbackֹͣ��
if ( FileName == 0 )
    return
end
%  ����table�е�����
data=get(handles.uitable2,'data');
if ( isempty(data))
    return
end
[m,n]=size(data);
M=m+5;
N=n+1;
%  ����edit�е�����
Str=get(handles.edit13,'String');
%  ����Microsoft Word��������
Word=actxserver('Word.Application'); 
%  ������������󣬹ر�Microsoft Word��������
c=onCleanup(@()Word.Quit);
% �򿪸��½�һ��word�ļ��������档
Document=Word.Documents.Add;
Content=Document.Content;  %  ����Content�ӿھ��
Selection=Word.Selection;  %  ����Selection�ӿھ��
%  �����λ���Ƶ��ı������
Selection.Start=Content.end;  
%  ���Ʊ���ڹ������λ�ò���һ��M��N�еı�񣬲����ؾ��DTI��
DTI=Document.Tables.Add(Selection.Range,M,N);
%  ���ñ��߿�
DTI.Borders.OutsideLineStyle='wdLineStyleSingle';
DTI.Borders.InsideLineStyle='wdLineStyleSingle';
DTI.Rows.Alignment='wdAlignRowCenter';  %  �������
DTI.Rows.Item(M-1).Borders.Item(1).LineStyle='wdLineStyleNone';  %  ��������2�е��ϱ߿���ɾ��
%  ���ñ���п�
column_width=[23,33,33,53,63,53,66,70];
for i=1:N
    DTI.Columns.Item(i).Width=column_width(i);
end
%  �ϲ���Ԫ��
DTI.Cell(1,1).Merge(DTI.Cell(1,N));
DTI.Cell(M-2,1).Merge(DTI.Cell(M-2,N));
DTI.Cell(M-1,1).Merge(DTI.Cell(M-1,N));
DTI.Cell(M,1).Merge(DTI.Cell(M,N));
%  ���ñ���ڵ�����λ�ã���С����Ϣ��
DTI.Range.Font.Size=10.5;  %  ȫ������Ϊ12����
DTI.Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  ������������
DTI.Cell(1,1).Range.Font.Size=18;  %  ��һ����������
DTI.Cell(1,1).Range.Font.Bold=4;  %  ����Ӵ�
DTI.Cell(M-2,1).Range.Font.Size=12;  %  ������������������
DTI.Cell(M-1,1).Range.Font.Size=12;  %  �����ڶ�����������
DTI.Cell(M-2,1).Range.Paragraphs.Alignment='wdAlignParagraphLeft';  %  ���������������
DTI.Cell(M-1,1).Range.Paragraphs.Alignment='wdAlignParagraphLeft';  %  �����ڶ��������
DTI.Cell(M,1).Range.Paragraphs.Alignment='wdAlignParagraphRight';  %  ���һ���Ҷ���
%  д��������
%  �����ⲿ��
DTI.Cell(1,1).Range.Text='The Max Eigenvalue Analysis Report';  %  ����������
%  �ڶ�����������
DTI.Cell(2,2).Range.Text='Start Point';  
DTI.Cell(2,3).Range.Text='End Point';  
DTI.Cell(2,4).Range.Text='Window Length';  
DTI.Cell(2,5).Range.Text='The Maximum Eigenvalue';  
DTI.Cell(2,6).Range.Text='The Relevant Window';  
DTI.Cell(2,7).Range.Text='The Relevant Eigenvector';
DTI.Cell(2,8).Range.Text='Min Acceptable Rectilinearity';
%  ����������
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
%  �����һ�����ʱ��
ti=now;
str=datestr(ti,0);
str0=[str(1:12),str(13:14),'h',str(16:17),'min',str(19:20),'s'];
DTI.Cell(M,1).Range.Text=str0;
Selection.Start=Content.end;  %  ������ƶ����ı����
Selection.TypeParagraph;  %  �س�
%  �����ĵ���
Document.SaveAs2([PathName,FileName]); 
Document.Close;  %  �ر�Word�ļ�������ڶ��μ��Ժ�����ʱ�����������潫�ɼ�
        
