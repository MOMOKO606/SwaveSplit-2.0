function deg = GetPolar( vector )
x=vector(1);
y=vector(2);
if ( x > 0 && y > 0 )  % alpha在0~90°
    deg=acosd(x);
elseif ( x > 0 && y < 0 )  % alpha在270°~360°
    deg=360-acosd(x);
elseif ( x < 0 && y > 0 )  % alpha在90°~180°
    deg=acosd(x);
elseif ( x < 0 && y < 0 )   % alpha在180°~270°
    deg=360-acosd(x);
elseif ( x == 0 )
    deg=90;
end