function OutDocxEnglish(PathName,FileName,handles,hd)
%  从hd中载入基本信息
STLA=hd{1,1}(32,1);    %  Station latitude (degrees, north positive).
STLO=hd{1,1}(33,1);    %  Station longitude (degrees, east positive).
EVLA=hd{1,1}(36,1);    %  Event latitude (degrees, north positive). 
EVLO=hd{1,1}(37,1);    %  Event longitude (degrees, east positive). 
KSTNM=hd{2,1};         %  Station name.
StartData=hd{26,1};    
StartTime=hd{27,1}; 
ET=[StartData,', ',StartTime];
maxcoef=hd{28,1};
maxd=hd{29,1};
maxt=hd{30,1};
%  从控件中载入用户输入参数
t1=get(handles.CASub1.edit1,'String');
t2=get(handles.CASub1.edit2,'String');
temp=str2num(t2)-str2num(t1);
d1=get(handles.CASub1.edit3,'String');
d2=get(handles.CASub1.edit4,'String');
d3=get(handles.CASub1.edit5,'String');
t3=get(handles.CASub1.edit6,'String');
t4=get(handles.CASub1.edit7,'String');
t5=get(handles.CASub1.edit8,'String');
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
%  绘制表格，在光标所在位置插入一个14行6列的表格，并返回句柄DTI。
DTI=Document.Tables.Add(Selection.Range,16,6);  
%  设置表格边框
DTI.Borders.OutsideLineStyle='wdLineStyleSingle';
DTI.Borders.InsideLineStyle='wdLineStyleSingle';
DTI.Rows.Item(14).Borders.Item(1).LineStyle='wdLineStyleNone';  %  将第15行的上边框线删除
DTI.Rows.Alignment='wdAlignRowCenter';  %  令表格居中
%  设置表格列宽
column_width=[53.7736,84.1434,53.7736,84.1434,53.7736,84.1434];
for i=1:6
    DTI.Columns.Item(i).Width=column_width(i);
end
%  合并单元格。
DTI.Cell(1,1).Merge(DTI.Cell(1,6));
DTI.Cell(2,1).Merge(DTI.Cell(2,6));
for i=5:9
    DTI.Cell(i,1).Merge(DTI.Cell(i,6));
end
for i=10:12
    DTI.Cell(i,1).Merge(DTI.Cell(i,3));
    DTI.Cell(i,2).Merge(DTI.Cell(i,4));
end
for i=13:16
    DTI.Cell(i,1).Merge(DTI.Cell(i,6));
end
%  设置表格内的文字位置，大小等信息。
DTI.Range.Font.Size=10.5;  %  全文设置为五号字
DTI.Cell(1,1).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  第1行居中
DTI.Cell(1,1).Range.Font.Size=26;  %  第一行用三号字
DTI.Cell(1,1).Range.Font.Bold=4;  %  字体加粗
for i=3:4
    for j=1:6
        DTI.Cell(i,j).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  3到4行字体居中
    end
end
for i=10:12
    for j=1:2
        DTI.Cell(i,j).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  字体居中
    end
end
DTI.Cell(13,1).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  第13行居中
DTI.Cell(14,1).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  第14行居中
DTI.Cell(15,1).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  第15行居中
DTI.Cell(16,1).Range.Paragraphs.Alignment='wdAlignParagraphRight';  %  第16行右对齐
%  写入表格内容。
%  表格标题部分
DTI.Cell(1,1).Range.Text='Correlation Analysis Report';  %  表格标题内容
%  基本信息部分
DTI.Cell(2,1).Range.Text='Bisic Information : ';
DTI.Cell(3,1).Range.Text='Station name: ';
DTI.Cell(3,2).Range.Text=KSTNM;
DTI.Cell(3,3).Range.Text='Station longitude: ';
DTI.Cell(3,4).Range.Text=num2str(STLO);
DTI.Cell(3,5).Range.Text='Station latitude: ';
DTI.Cell(3,6).Range.Text=num2str(STLA);
DTI.Cell(4,1).Range.Text='Event time: ';
DTI.Cell(4,2).Range.Text=ET;
DTI.Cell(4,3).Range.Text='Event longitude: ';
DTI.Cell(4,4).Range.Text=num2str(EVLO);
DTI.Cell(4,5).Range.Text='Event latitude: ';
DTI.Cell(4,6).Range.Text=num2str(EVLA);
DTI.Cell(5,1).Range.Text='User''s Input Parameters : ';
DTI.Cell(6,1).Range.Text=['Selected ',num2str(temp),' seconds waveform data from ',t1,' s to ',t2,' s.'];
DTI.Cell(7,1).Range.Text=['Rotated angle is from ',d1,'° to ',d2,'°, step :',d3,'°.'];
DTI.Cell(8,1).Range.Text=['Delayed time is from ',t1,'° to ',t2,'°, step :',t3,'°.'];
DTI.Cell(9,1).Range.Text='Result : ';
DTI.Cell(10,1).Range.Text='The max correlation coefficient :';
DTI.Cell(10,2).Range.Text=num2str(maxcoef);
DTI.Cell(11,1).Range.Text='Polarization direction :';
DTI.Cell(11,2).Range.Text=[num2str(maxd),'°'];
DTI.Cell(12,1).Range.Text='Delayed time :';
DTI.Cell(12,2).Range.Text=[num2str(maxt),'s'];
%  将handles.axes1~3图形复制到粘贴板,并在第13～15行单元格贴图。
for i=13:15
    h=figure('Visible','off');
    delete(get(h,'Children'));  %  删除figure内的子对象，避免坐标轴重叠
    %  将要储存的图像复制到新figure上。
    eval(['hstr=handles.axes',num2str(i-12),';'])
    copyobj(hstr,h);
    %  将图像复制到剪切板。
    hgexport(h,'-clipboard');
    DTI.Cell(i,1).Range.Paragraphs.Item(1).Range.Paste;
    %  关闭新figure。
    close(h);
end
%  在第16行输出时间
ti=now;
str=datestr(ti,0);
str0=[str(1:12),str(13:14),'h',str(16:17),'min',str(19:20),'s'];
DTI.Cell(16,1).Range.Text=str0;
Selection.Start=Content.end;  %  将光标移动到文本最后
Selection.TypeParagraph;  %  回车
%  保存文档。
Document.SaveAs2([PathName,FileName]); 
Document.Close;  %  关闭Word文件，否则第二次及以后输入时，服务器界面将可见
