function [error_l1,error_l2,z1,z2] = error_lessN(N0,N1,l1,l2,tn,testcase,datafile,label)

N_ref=4;
error_l1=zeros(N_ref,1);
error_l2=zeros(N_ref,1);
N=zeros(N_ref,1);
z1 = zeros(N_ref,length(tn));
z2 = zeros(N_ref,length(tn));

for i=1:N_ref
    N0=ceil(N0/(2^(i)));
    N1=ceil(N1/(2^(i)));
    [l1_i,l2_i] = direct_prediction(N0,N1,tn,testcase,datafile,label);
    z1(i,:)=l1_i;
    z2(i,:)=l2_i;
    error_l1(i)=norm(l1-l1_i);
    error_l2(i)=norm(l2-l2_i);
    N(i)=N0;
end

figure 
subplot(1,2,1)
plot(N,error_l1,'ro');
subplot(1,2,2)
plot(N,error_l2,'bo');