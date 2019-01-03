function p=TransIndex( v,head,tail,n )
if ( tail > head )
    p=[tail-1:-1:head];
else
    if ( tail == 1 )
        p=[n:-1:head];
    else
        p=[tail-1:-1:1];
        t=[n:-1:head];
        p=[p,t];
    end
end
p=p(v);   
    
    
    
