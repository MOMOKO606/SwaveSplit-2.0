function [A,value,vect]=MaxEig(V,D)
A=[D(1,1),D(2,2),D(3,3)];
T=[1,2,3];
for i=2:3
    key=A(i);
    j=i-1;
    while (j > 0 && A(j) > key )
        A(j+1)=A(j);
        T(j+1)=T(j);
        j=j-1;
    end
    A(j+1)=key;
    T(j+1)=i;
end
value=A(3);
vect=V(:,T(3));

    