function adjstlabl(handles,EWindex,NSindex,Zindex,hEW,hNS,hZ)
set(handles.ChooseEW,'enable','on');
set(handles.ChooseNS,'enable','on');
set(handles.ChooseZ,'enable','on');
sum=EWindex+NSindex+Zindex;
if ( sum == 3 )
    if ( gca == hEW )
        set(handles.ChooseNS,'enable','off');
        set(handles.ChooseZ,'enable','off');
    elseif ( gca == hNS )
        set(handles.ChooseEW,'enable','off');
        set(handles.ChooseZ,'enable','off');
    else
        set(handles.ChooseEW,'enable','off');
        set(handles.ChooseNS,'enable','off');
    end
elseif ( sum == 2 )
      if ( EWindex == 0 )
          if ( gca == hZ )
              set(handles.ChooseNS,'enable','off');
              set(handles.ChooseEW,'enable','off');
          elseif ( gca == hNS )
              set(handles.ChooseEW,'enable','off');
              set(handles.ChooseZ,'enable','off');
          else
              set(handles.ChooseZ,'enable','off');
              set(handles.ChooseNS,'enable','off');
          end
      elseif ( NSindex == 0 )
          if ( gca == hZ )
              set(handles.ChooseEW,'enable','off');
              set(handles.ChooseNS,'enable','off');
          elseif ( gca == hEW )
              set(handles.ChooseNS,'enable','off');
              set(handles.ChooseZ,'enable','off');
          else
              set(handles.ChooseEW,'enable','off');
              set(handles.ChooseZ,'enable','off');
          end
      else
          if ( gca == hNS )
              set(handles.ChooseZ,'enable','off');
              set(handles.ChooseEW,'enable','off');
          elseif ( gca == hEW ) 
              set(handles.ChooseZ,'enable','off');
              set(handles.ChooseNS,'enable','off');
          else
              set(handles.ChooseNS,'enable','off');
              set(handles.ChooseEW,'enable','off');
          end
      end
elseif ( sum == 1 )
      if ( EWindex == 1 )
          if ( gca == hEW )
              set(handles.ChooseNS,'enable','off');
              set(handles.ChooseZ,'enable','off');
          else
              set(handles.ChooseEW,'enable','off');
          end
      elseif ( NSindex == 1 )
          if ( gca == hNS )
              set(handles.ChooseEW,'enable','off');
              set(handles.ChooseZ,'enable','off');
          else
              set(handles.ChooseNS,'enable','off');
          end
      elseif ( Zindex == 1 )
          if ( gca == hZ )
              set(handles.ChooseEW,'enable','off');
              set(handles.ChooseNS,'enable','off');
          else
              set(handles.ChooseZ,'enable','off');
          end
      end
  end
              
 