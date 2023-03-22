function [error_l1,error_l2,error_l3,z1,z2,z3] = error_lessN(N0,N1,l1,l2,tn,testcase,datafile,label)

N_ref=7;

error_l1=zeros(N_ref,1);
error_l2=zeros(N_ref,1);
error_l3=zeros(N_ref,1);

N=zeros(N_ref,1);
z1 = zeros(N_ref,length(tn));
z2 = zeros(N_ref,length(tn));
z3 = zeros(N_ref,length(tn));

for i=1:N_ref
    %N0=ceil(N0/(2^(i)));
    %N1=ceil(N1/(2^(i)));
    N0 = N0-5;
    N1 = N1-5;

    [l1_i,l2_i,l3_i] = direct_prediction(N0,N1,tn,testcase,datafile,label);
    z1(i,:)=l1_i;
    z2(i,:)=l2_i;
    %error_l1(i)=norm(l1-l1_i)/norm(l1);
    %error_l2(i)=norm(l1-l1_i)/norm(l1);
    error_l1(i)=abs(l1-median(l1_i))/abs(l1);
    error_l2(i)=abs(l2-median(l2_i))/abs(l2);

    if strcmp(testcase,"ks")
        z3(i,:)=l3_i;
        error_l3(i)=abs(l3-median(l3_i))/abs(l3);
    end

    N(i)=N0;
end

if strcmp(testcase,"ks")
    figure 
    subplot(2,2,1)
    semilogy(N,error_l1,'ro');
    subplot(2,2,2)
    semilogy(N,error_l2,'bo');
    semilogy(2,2,3)
    plot(N,error_l3,'bo');
else
    figure 
    subplot(1,2,1)
    semilogy(N,error_l1,'ro');
    subplot(1,2,2)
    semilogy(N,error_l2,'bo');
end

end
