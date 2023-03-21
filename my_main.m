addpath Functions
addpath Functions\Kernels\
addpath Functions\Utilities
addpath Functions\Examples
addpath My_functions
addpath My_functions\Plots
addpath My_functions\Statistics
addpath My_functions\Statistics\Auxiliar
%%
datafile = '1_Kdv_2sec_0.5_3.mat';
testcase = set_test(2);
label = 1;

output = my_function(datafile, testcase, label);
%%
output.plot_lambda;
%%
output.suggest_N;
%%
output.lambda;
%%
output.plot_solution;
%%
output.plot_estimated_solution;
%%
direct_prediction(45,45,output.params.tn,testcase,datafile,label);

%%
% datafile = input('\n\n Indicate data.mat file (with its path): \n\n','s');          % '../burgers_paper_case8.2.mat'
% 
% testcase = input('\n\n Indicate testcase (1,2,..): \n 1) Burgers \n 2) KdV \n\n','s');
% testcase = set_test(str2num(testcase));
% 
% label = input('\n\n Indicate label (1,2,..): \n 1) Normal \n 2) Boundary sensors\n\n','s');
% label = str2num(label);

datafile = 'burgers.mat';
testcase = set_test(1);
label = 1;

load(datafile);
tn = randsample(2:length(burgerst),ceil(0.2*length(t)));
tn = sort(tn);

[l1,l2] = direct_prediction(45,45,tn,testcase,datafile,label);


[errorl1,errorl2,z1,z2]=error_lessN(45,45,l1,l2,tn,testcase,datafile,label);

figure
for i=1:4
subplot(2,2,i)
plot(tn,z1(i,:),'ro');
hold on
plot([tn(1), tn(end)],[mean(z1(i,:)), mean(z1(i,:))],'b-');
title(['\lambda_1 = ',num2str(mean(z1(i,:))), ' N0=',num2str(ceil(45/2^(i)))],'Interpreter', 'tex','FontSize',15);
legend(num2str(errorl1(i)));
xlabel('tn');
ylabel('lambda')
end 

figure
for i=1:4
subplot(2,2,i)
plot(tn,z2(i,:),'bo');
hold on
plot([tn(1), tn(end)],[mean(z2(i,:)), mean(z2(i,:))],'b-');
title(['\lambda_2 = ',num2str(mean(z2(i,:))),' N0=',num2str(ceil(45/2^(i)))],'Interpreter', 'tex','FontSize',15);
legend(num2str(errorl2(i)));
xlabel('tn');
ylabel('lambda')
end 

