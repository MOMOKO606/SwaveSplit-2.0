function varargout = HHT_Sub(varargin)
% HHT_SUB MATLAB code for HHT_Sub.fig
%      HHT_SUB, by itself, creates a new HHT_SUB or raises the existing
%      singleton*.
%
%      H = HHT_SUB returns the handle to a new HHT_SUB or the handle to
%      the existing singleton*.
%
%      HHT_SUB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HHT_SUB.M with the given input arguments.
%
%      HHT_SUB('Property','Value',...) creates a new HHT_SUB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HHT_Sub_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HHT_Sub_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HHT_Sub

% Last Modified by GUIDE v2.5 27-Jan-2016 15:46:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HHT_Sub_OpeningFcn, ...
                   'gui_OutputFcn',  @HHT_Sub_OutputFcn, ...
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


% --- Executes just before HHT_Sub is made visible.
function HHT_Sub_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HHT_Sub (see VARARGIN)

%  �������1Ϊ���h���˴�Ϊ������figure�ľ����
h=varargin{1};
%  ����guihandles�������h�������handles�ṹ�塣
handles.MainHandles= guihandles(h);

% Choose default command line output for HHT_Sub
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

children=get(handles.figure1,'Children');
p=findobj(children,'Tag','');
delete(p);


% UIWAIT makes HHT_Sub wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HHT_Sub_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  �����û���ѡaxes�ϵĲ����������
hhtdata=getappdata(gca,'hhtdata');
%  �����������ж�Ӧ��ͼ�ξ��
hplot=getappdata(handles.figure1,'hplot');
hc=getappdata(handles.figure1,'hc');
%  ���»����������еĲ���ͼ
set(hplot,'YData',hhtdata);
%  ������º��sdata���ݵ���ǰaxes��Application Data��
setappdata(hc,'sdata',hhtdata);
%  �رյ�ǰ����
close(handles.figure1);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  �رյ�ǰ����
close(handles.figure1);
