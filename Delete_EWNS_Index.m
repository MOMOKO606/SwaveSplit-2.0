function Delete_EWNS_Index(handles)
%  ��ȡ��ǰ��ѡΪEW��NS��Z����ͼ���axes�����
hEW=getappdata(handles.figure1,'hEW');
hNS=getappdata(handles.figure1,'hNS');
hZ=getappdata(handles.figure1,'hZ');
%  �жϱ�ɾ��ͼ���Ƿ�ѡΪEW��NS��Z�����������Բ������Ҽ��˵����е�����
if (gca == hEW)
    set(handles.ChooseEW,'Checked','off');
    EWindex=0;
    EWtemp=-1;
    hEW=[];
%  ��������Ĳ�����������¡�    
    setappdata(handles.figure1,'EWindex',EWindex);
    setappdata(handles.figure1,'EWtemp',EWtemp);
    setappdata(handles.figure1,'hEW',hEW);
elseif ( gca == hNS )
    set(handles.ChooseNS,'Checked','off');
    NSindex=0;
    NStemp=-1;
    hNS=[];
%  ��������Ĳ�����������¡�    
    setappdata(handles.figure1,'NSindex',NSindex);
    setappdata(handles.figure1,'NStemp',NStemp);
    setappdata(handles.figure1,'hNS',hNS);
elseif ( gca == hZ )
    set(handles.ChooseZ,'Checked','off');
    Zindex=0;
    Ztemp=-1;
    hZ=[];
%  ��������Ĳ�����������¡�    
    setappdata(handles.figure1,'Zindex',Zindex);
    setappdata(handles.figure1,'Ztemp',Ztemp);
    setappdata(handles.figure1,'hZ',hZ);    
end

