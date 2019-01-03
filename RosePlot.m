function RosePlot(Q,p)
n=length(p);
theta=[];
for i=1:n
    k=p(i);
    %  ����hd
    hd=Q{k,2};
    %  ����maxd
    maxd=hd{29,1};
    theta=[theta;maxd];
end
theta=theta*pi/180;
x=theta+pi;
theta=[theta;x];
figure;
rose(theta,72);
view(90, -90);
    