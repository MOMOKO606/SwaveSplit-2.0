function OutDocxEnglish(PathName,FileName,handles,hd)
%  ��hd�����������Ϣ
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
%  �ӿؼ��������û��������
t1=get(handles.CASub1.edit1,'String');
t2=get(handles.CASub1.edit2,'String');
temp=str2num(t2)-str2num(t1);
d1=get(handles.CASub1.edit3,'String');
d2=get(handles.CASub1.edit4,'String');
d3=get(handles.CASub1.edit5,'String');
t3=get(handles.CASub1.edit6,'String');
t4=get(handles.CASub1.edit7,'String');
t5=get(handles.CASub1.edit8,'String');
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
%  ���Ʊ���ڹ������λ�ò���һ��14��6�еı�񣬲����ؾ��DTI��
DTI=Document.Tables.Add(Selection.Range,16,6);  
%  ���ñ��߿�
DTI.Borders.OutsideLineStyle='wdLineStyleSingle';
DTI.Borders.InsideLineStyle='wdLineStyleSingle';
DTI.Rows.Item(14).Borders.Item(1).LineStyle='wdLineStyleNone';  %  ����15�е��ϱ߿���ɾ��
DTI.Rows.Alignment='wdAlignRowCenter';  %  �������
%  ���ñ���п�
column_width=[53.7736,84.1434,53.7736,84.1434,53.7736,84.1434];
for i=1:6
    DTI.Columns.Item(i).Width=column_width(i);
end
%  �ϲ���Ԫ��
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
%  ���ñ���ڵ�����λ�ã���С����Ϣ��
DTI.Range.Font.Size=10.5;  %  ȫ������Ϊ�����
DTI.Cell(1,1).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  ��1�о���
DTI.Cell(1,1).Range.Font.Size=26;  %  ��һ����������
DTI.Cell(1,1).Range.Font.Bold=4;  %  ����Ӵ�
for i=3:4
    for j=1:6
        DTI.Cell(i,j).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  3��4���������
    end
end
for i=10:12
    for j=1:2
        DTI.Cell(i,j).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  �������
    end
end
DTI.Cell(13,1).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  ��13�о���
DTI.Cell(14,1).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  ��14�о���
DTI.Cell(15,1).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  ��15�о���
DTI.Cell(16,1).Range.Paragraphs.Alignment='wdAlignParagraphRight';  %  ��16���Ҷ���
%  д�������ݡ�
%  �����ⲿ��
DTI.Cell(1,1).Range.Text='Correlation Analysis Report';  %  ����������
%  ������Ϣ����
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
DTI.Cell(7,1).Range.Text=['Rotated angle is from ',d1,'�� to ',d2,'��, step :',d3,'��.'];
DTI.Cell(8,1).Range.Text=['Delayed time is from ',t1,'�� to ',t2,'��, step :',t3,'��.'];
DTI.Cell(9,1).Range.Text='Result : ';
DTI.Cell(10,1).Range.Text='The max correlation coefficient :';
DTI.Cell(10,2).Range.Text=num2str(maxcoef);
DTI.Cell(11,1).Range.Text='Polarization direction :';
DTI.Cell(11,2).Range.Text=[num2str(maxd),'��'];
DTI.Cell(12,1).Range.Text='Delayed time :';
DTI.Cell(12,2).Range.Text=[num2str(maxt),'s'];
%  ��handles.axes1~3ͼ�θ��Ƶ�ճ����,���ڵ�13��15�е�Ԫ����ͼ��
for i=13:15
    h=figure('Visible','off');
    delete(get(h,'Children'));  %  ɾ��figure�ڵ��Ӷ��󣬱����������ص�
    %  ��Ҫ�����ͼ���Ƶ���figure�ϡ�
    eval(['hstr=handles.axes',num2str(i-12),';'])
    copyobj(hstr,h);
    %  ��ͼ���Ƶ����а塣
    hgexport(h,'-clipboard');
    DTI.Cell(i,1).Range.Paragraphs.Item(1).Range.Paste;
    %  �ر���figure��
    close(h);
end
%  �ڵ�16�����ʱ��
ti=now;
str=datestr(ti,0);
str0=[str(1:12),str(13:14),'h',str(16:17),'min',str(19:20),'s'];
DTI.Cell(16,1).Range.Text=str0;
Selection.Start=Content.end;  %  ������ƶ����ı����
Selection.TypeParagraph;  %  �س�
%  �����ĵ���
Document.SaveAs2([PathName,FileName]); 
Document.Close;  %  �ر�Word�ļ�������ڶ��μ��Ժ�����ʱ�����������潫�ɼ�
