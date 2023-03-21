function [] = plot_lambda(params)

N0 = params.N0;
N1 = params.N1;
tn = params.tn;
error = params.error;
error_noise = params.error_noise;
lambda1 = params.lambda1;
lambda2 = params.lambda2;

N = length(N0);
NN = sqrt(N);
flag1 = NN > floor(NN);
flag2 = NN >= floor(NN) + 0.5;
NN = floor(NN);

figure
for i = 1:N
    subplot(NN + flag1, NN + flag2,i)              % logical true/false
    plot(tn,error(i,:),'ro');
    title(['Error (N0,N1)=(',num2str(N0(i)),',',num2str(N1(i)),')'],'Interpreter', 'tex','FontSize',15);
end

figure
for i = 1:N
    subplot(NN + flag1, NN + flag2,i) 
    plot(tn,error_noise(i,:),'ro');
    title(['Error noise (N0,N1)=(',num2str(N0(i)),',',num2str(N1(i)),')'],'Interpreter', 'tex','FontSize',15);
end

figure
for i = 1:N
    subplot(NN + flag1, NN + flag2,i)
    plot(tn,lambda1(i,:),'ro');
    title(['Lambda1 (N0,N1)=(',num2str(N0(i)),',',num2str(N1(i)),')'],'Interpreter', 'tex','FontSize',15);
end

figure
for i = 1:N
    subplot(NN + flag1, NN + flag2,i)
    plot(tn,lambda2(i,:),'ro');
    title(['Lambda2 (N0,N1)=(',num2str(N0(i)),',',num2str(N1(i)),')'],'Interpreter', 'tex','FontSize',15);
end

end