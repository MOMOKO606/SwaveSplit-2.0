function Delete_EWNS_Index(handles)
%  读取当前被选为EW、NS、Z分量图像的axes句柄。
hEW=getappdata(handles.figure1,'hEW');
hNS=getappdata(handles.figure1,'hNS');
hZ=getappdata(handles.figure1,'hZ');
%  判断被删除图像是否被选为EW、NS、Z分量，进而对参数和右键菜单进行调整。
if (gca == hEW)
    set(handles.ChooseEW,'Checked','off');
    EWindex=0;
    EWtemp=-1;
    hEW=[];
%  将调整后的参数、句柄更新。    
    setappdata(handles.figure1,'EWindex',EWindex);
    setappdata(handles.figure1,'EWtemp',EWtemp);
    setappdata(handles.figure1,'hEW',hEW);
elseif ( gca == hNS )
    set(handles.ChooseNS,'Checked','off');
    NSindex=0;
    NStemp=-1;
    hNS=[];
%  将调整后的参数、句柄更新。    
    setappdata(handles.figure1,'NSindex',NSindex);
    setappdata(handles.figure1,'NStemp',NStemp);
    setappdata(handles.figure1,'hNS',hNS);
elseif ( gca == hZ )
    set(handles.ChooseZ,'Checked','off');
    Zindex=0;
    Ztemp=-1;
    hZ=[];
%  将调整后的参数、句柄更新。    
    setappdata(handles.figure1,'Zindex',Zindex);
    setappdata(handles.figure1,'Ztemp',Ztemp);
    setappdata(handles.figure1,'hZ',hZ);    
end

