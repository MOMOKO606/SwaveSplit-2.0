function [Q,head,tail]=Enqueue4cell(Q,n,head,tail,x)
%  xΪ1��m�е�cell����QΪ�ܴ洢n-1��m�е�cell����
%  �������ܣ���x���뵽Q�ĵ�tail�С�
%  ע��Q����overflow����Ϊ��tail����headʱ����ɾ����head�У��൱��Dequeue����
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
    
    
    
