function ReadEvt(fileevt,filepath)
%  本函数用于单地震多台站数据转换

outfile=fileevt(1:(length(fileevt)-4));
filename=strcat(filepath,fileevt);
kkk=length(filename);
eventname=filename(1:(kkk-4));
evtf = fopen(filename,'r');
if evtf < 0
    error(['evt file does not exit:' filename]); %error
end
%  step one: header for all stations.
[evt.evtflag rcount] = fread(evtf,16,'uchar');%character*16
[evt.hosttype rcount] = fread(evtf,16,'uchar');%character*16
[evt.rectype rcount] = fread(evtf,1,'int32');%*4
[evt.process rcount] = fread(evtf,1,'int');%*4
%  96 台网参数
[evt.netname rcount] = fread(evtf,80,'uchar');%character*80 //120
[evt.stn_sum rcount] = fread(evtf,1,'int32'); %integer*4 
[evt.centlat rcount] = fread(evtf,1,'float32'); %real*4
[evt.centlon rcount] = fread(evtf,1,'float32'); %real*4
[evt.centalt rcount] = fread(evtf,1,'float32'); %real*4//
%  end 台网参数
%  120 保留
[evt.time rcount] = fread(evtf,3,'float64'); %double 3//160
[evt.latitude rcount] = fread(evtf,3,'float32'); %real*4 3
[evt.longitude rcount] = fread(evtf,3,'float32'); %real*4 3
[evt.depth rcount] = fread(evtf,3,'float32'); %real*4 3//12*3+160 =196
[evt.Ml rcount] = fread(evtf,3,'int16'); %int*2 3
[evt.Md rcount] = fread(evtf,3,'int16'); %int*2 3
[evt.Ms rcount] = fread(evtf,3,'int16'); %int*2 3
[evt.Mb rcount] = fread(evtf,3,'int16'); %int*2 3 //6*4 +196 =220
[evt.locname rcount] = fread(evtf,3*12,'uchar'); %'uchar'*12 3
% end 保留
[evt.data_begin rcount] = fread(evtf,1,'int32'); %int*4//36+220=
[evt.year rcount] = fread(evtf,1,'int16'); %int*2
[evt.mon rcount] = fread(evtf,1,'int16'); %int*2
[evt.day rcount] = fread(evtf,1,'int16'); %int*2
[evt.hour rcount] = fread(evtf,1,'int16'); %int*2
[evt.min rcount] = fread(evtf,1,'int16'); %int*2
[evt.sec rcount] = fread(evtf,1,'int16'); %int*2
[evt.rec_length rcount] = fread(evtf,1,'int32'); %int*4//16+36+220 =270
%  若地震数据头文件中未包含震级信息，为了后续处理数据的可用性，震级以0标注。
Mag1=deblank(char(evt.Ml'));
Xmag=length(Mag1);
if Xmag==0
    Mag=0;
else
    Mag=Mag1;
end
%  若地震数据头文件中未包含震级信息，为了后续处理数据的可用性，震级以0标注。
s1='001';
netname=char(evt.netname');
netname1=deblank(netname);
hhh=length(netname1);
if hhh<1
    Onetname1='NO';
elseif hhh>6
    Onetname1=netname1(1:6);
else
    Onetname1=netname1;
end
%  step two: header for each station and component
for ist = 1:evt.stn_sum
    [whead(ist).no rcount] = fread(evtf,1,'int32'); %int*4
    stnolist(ist) = whead(ist).no;
    [whead(ist).name rcount] = fread(evtf,20,'uchar'); %20
    [whead(ist).DASType rcount] = fread(evtf,10,'uchar');
    [whead(ist).wlen rcount] = fread(evtf,1,'int16');
    [whead(ist).VLtd rcount] = fread(evtf,1,'float32');% read*4
    [whead(ist).samp rcount] = fread(evtf,1,'int32');
    [whead(ist).comp rcount] = fread(evtf,1,'int32');
    [whead(ist).TranMode rcount] = fread(evtf,1,'int16');
    [whead(ist).TranIns rcount] = fread(evtf,12,'uchar');
    [whead(ist).TimerMode rcount] = fread(evtf,1,'int16');
    [whead(ist).ClkType rcount] = fread(evtf,12,'uchar');
    [whead(ist).ClkErr rcount] = fread(evtf,1,'float32');      
    [whead(ist).latitude1 rcount] = fread(evtf,1,'float32');      
    [whead(ist).longitude1 rcount] = fread(evtf,1,'float32');      
    [whead(ist).altitude1 rcount] = fread(evtf,1,'float32');      
    [whead(ist).azimuth rcount] = fread(evtf,1,'float32');      
    [whead(ist).incident rcount] = fread(evtf,1,'float32');      
    [whead(ist).weight rcount] = fread(evtf,1,'int16');
    [whead(ist).veloc rcount] = fread(evtf,1,'int16');
    [whead(ist).oritype rcount] = fread(evtf,1,'float32');      
    [whead(ist).seismometer rcount] = fread(evtf,8,'uchar');
    [whead(ist).smode rcount] = fread(evtf,1,'int16');
    [whead(ist).estype rcount] = fread(evtf,1,'int16');
    whead(ist).gain =zeros(1,whead(ist).comp);
    for icomp=1:whead(ist).comp
        whead(ist).comp_name{icomp} = char(fread(evtf,12,'uchar'))'; %component name
        comp_no = fread(evtf,1,'int32');  %component no.
        [whead(ist).gain(icomp)] = fread(evtf,1,'float32'); %gain.
        [whead(ist).step(icomp)]= fread(evtf,1,'int32');
        fseek(evtf, 12288,'cof');
    end
end
chanelnum=0;
for chanelkkk=1:evt.stn_sum;
    chanelnum=chanelnum+whead(chanelkkk).comp;
    chaneldat(chanelkkk)=whead(chanelkkk).samp*evt.rec_length;
    datmax=max(chaneldat);
end
waveform.wave=zeros(datmax,chanelnum);
for timenum=1:evt.rec_length
    readnum=0;
    fseek(evtf,0,'cof');
    for staion=1:evt.stn_sum;
        if whead(staion).wlen == 24; % 24 bits 
            BYTETYPE = 'int32';
        elseif whead(staion).wlen == 32
            BYTETYPE = 'int32';
        else
            BYTETYPE = 'int16';
        end
        waveform.dataflag = fread(evtf,1,'int32'); % integer*4
        len1 = (timenum-1)*whead(staion).samp+1;
        len2 = (timenum)*whead(staion).samp;
        for i=1:whead(staion).comp
            readnum=readnum+1;
            waveform.wave(len1:len2,readnum) =  fread(evtf,whead(staion).samp,BYTETYPE);
        end
    end
end
chanel=0;
%  创建进度条。
hwait=waitbar(0,'Decompressing...','Name','Please wait');
%  修改美观。
x=get(hwait,'children');
if ( length(x) > 1 )
    set(x(2),'Visible','off');
end
for sation=1:evt.stn_sum
    stationname=char(whead(sation).name(1:3)');
    outfilename=strcat(eventname,'_',stationname,'.asc');
    fout=fopen(outfilename,'w');
    fprintf(fout,'A3CZYX\n');
    fprintf(fout,'19\n');%文件头行数
    fprintf(fout,'(1P3E16.7)\n');%数据格式
    fprintf(fout,'%s\n','Station position');%台网
    fprintf(fout,'%f  %f  %f\n',whead(sation).longitude1,whead(sation).latitude1,whead(sation).altitude1);    
    %  台站经度（度）、纬度（度）、高程（米）
    if length(whead(sation).seismometer)~=0
        seismometer=deblank((char(whead(sation).seismometer))');
    else             %当evt文件中没有给出地震计的类型时,记为no seismometer                                             
        seismometer='no seismometer';
    end
    fprintf(fout,'%s\n',seismometer);%仪器
    fprintf(fout,'velocity\n');%数据种类  
    fprintf(fout,'%s\n','gain U>E>N');%日期
    fprintf(fout,'%f   %f    %f\n',whead(sation).gain(1),whead(sation).gain(2),whead(sation).gain(3));   %仪器增益  UD NS EW
    %  days:某年某月某日为该年的第几天
    fprintf(fout,'0\n');
    fprintf(fout,'seconds\n');
    fprintf(fout,'%16.7E\n',1/whead(sation).samp);
    fprintf(fout,'counts\n');
    fprintf(fout,'1.0000000E+00\n');%每个计数的振幅单位
    datnum=evt.rec_length*whead(sation).samp;
    %  最大矢量值 MAX(sqrt(z^2+y^2+x^2))
    chanel0=3*sation;
    for k3=1:datnum;
        ffmax(k3)=sqrt(waveform.wave(k3,chanel0-2)*waveform.wave(k3,chanel0-2)+waveform.wave(k3,...
                       chanel0-1)*waveform.wave(k3,chanel0-1)+waveform.wave(k3,chanel0)*waveform.wave(k3,chanel0));
    end
    vector_max=max(ffmax);
    fprintf(fout,'%16.7E\n',vector_max);%最大向量值
    fprintf(fout,'%4d %2d %2d %2d %4d %4d\n',evt.year,evt.mon+1,evt.day,evt.hour,evt.min,evt.sec);%开始时间
    fprintf(fout,'%d\n',evt.rec_length*whead(sation).samp);%采样点数目
    fprintf(fout,'EVENT= %s Ms= %2.1f\n',s1,Mag);
    fprintf(fout,'Station= %s\n',stationname);
    if whead(sation).comp==1
        for k3=1:datnum;
            chanel0=sation;
            fprintf(fout,'%6.1f \n',waveform.wave(k3,1));
        end
    else
        for k3=1:datnum;
        fprintf(fout,'%16.7E%16.7E%16.7E\n',waveform.wave(k3,chanel0-2),waveform.wave(k3,chanel0),waveform.wave(k3,chanel0-1));
        %%%转换后数据第一、二、三列分别为垂直、南北、东西
        end
    end
    fclose(fout);
    %  更新进度条
    rate=sation/evt.stn_sum;
    waitbar(rate,hwait,['Decompressing...',num2str(round(rate*10000)/100),'%']);
    
end
%  关闭进度条
close(hwait);
fclose all;
