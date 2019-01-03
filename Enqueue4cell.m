function [Q,head,tail]=Enqueue4cell(Q,n,head,tail,x)
%  x为1行m列的cell矩阵，Q为能存储n-1行m列的cell矩阵。
%  函数功能：将x插入到Q的第tail行。
%  注意Q不会overflow，因为当tail等于head时，会删除第head行（相当于Dequeue）。
m=length(x);
for i=1:m
    Q{tail,i}=x{1,i};
end
if ( tail == n )
    tail=1;
else
    tail=tail+1;
end
if ( tail == head )
    for i=1:m
        Q{head,i}=[];
    end
    if ( head == n )
        head=1;
    else
        head=head+1;
    end
end
    
    
    
