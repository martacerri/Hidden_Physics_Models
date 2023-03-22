addpath Functions
addpath Functions\Kernels\
addpath Functions\Utilities
addpath Functions\Examples
addpath Functions\Generators
addpath Functions\chebfun-master\
addpath My_functions
addpath My_functions\Plots
addpath My_functions\Statistics
addpath My_functions\Statistics\Auxiliar

datafile = '../kdv.mat';
testcase = set_test(2);
label = 1;

%output = my_function(datafile, testcase, label);
%%
output.plot_lambda;
%%
output.suggest_N;
%%
output.lambda;
%%
output.plot_solution;
%%
[output.l1, output.l2] = direct_prediction(45,45,output.params.tn,testcase,datafile,label);
%%
output.plot_estimated_solution;

%%
% datafile = input('\n\n Indicate data.mat file (with its path): \n\n','s');          % '../burgers_paper_case8.2.mat'
% 
% testcase = input('\n\n Indicate testcase (1,2,..): \n 1) Burgers \n 2) KdV \n\n','s');
% testcase = set_test(str2num(testcase));
% 
% label = input('\n\n Indicate label (1,2,..): \n 1) Normal \n 2) Boundary sensors\n\n','s');
% label = str2num(label);

addpath Functions\Kernels\KS

%datafile = '../kuramoto_sivashinsky.mat';           % accede ai kernels sbagliati...ho dovuto rimuovere tutto dal path e includere solo KS

datafile = '../burgers.mat';
testcase = set_test(3);
label = 1;

load(datafile);
if strcmp(datafile,"../kuramoto_sivashinsky.mat")
    t = tt;
    u = uu;
end

coeff = 0.02;

tn = randsample(2:length(t)-1,ceil(coeff*length(t)));
tn = sort(tn);

%[output.l1,output.l2,output.l3] = direct_prediction(301,299,tn,testcase,datafile,label);
[output.l1,output.l2,output.l3] = direct_prediction(45,45,tn,testcase,datafile,label);


%%
% Test KS generated like a Burger

addpath Functions\Kernels\KS

datafile = '../ks_forBurgers.mat';
testcase = set_test(3);
label = 1;

load(datafile);
if strcmp(datafile,"../kuramoto_sivashinsky.mat")
    t = tt;
    u = uu;
end

coeff = 0.1;

tn = randsample(2:length(t)-1,ceil(coeff*length(t)));
tn = sort(tn);

%[output.l1,output.l2,output.l3] = direct_prediction(301,299,tn,testcase,datafile,label);
[output.l1,output.l2,output.l3] = direct_prediction(45,45,tn,testcase,datafile,label);


%%
% Schrodinger

addpath Functions\Kernels\Schrodinger

datafile = '../nls.mat';
testcase = set_test(4);
label = 1;

load(datafile);
if strcmp(datafile,"../kuramoto_sivashinsky.mat")
    t = tt;
    u = uu;
end

coeff = 0.05;

tn = randsample(2:length(t)-1,ceil(coeff*length(t)));
tn = sort(tn);

[output.l1,output.l2] = direct_prediction(50,50,tn,testcase,datafile,label);

%%
% Navier-Stokes

addpath Functions\Kernels\Navier_Stokes
datafile = '../cylinder_fine.mat';
testcase = set_test(5);
label = 1;

load(datafile);
if strcmp(datafile,"../kuramoto_sivashinsky.mat")
    t = tt;
    u = uu;
elseif strcmp(datafile,"../cylinder_fine.mat")
    t = t_star;
end

coeff = 0.03;

tn = randsample(2:length(t)-1,ceil(coeff*length(t)));
tn = sort(tn);

[output.l1,output.l2] = direct_prediction(100,100,tn,testcase,datafile,label);

%%
% Navier-Stokes (bordo)

addpath Functions\Kernels\Navier_Stokes
datafile = '../cylinder_fine.mat';
testcase = set_test(5);
label = 2;

load(datafile);
if strcmp(datafile,"../kuramoto_sivashinsky.mat")
    t = tt;
    u = uu;
elseif strcmp(datafile,"../cylinder_fine.mat")
    t = t_star;
end

tn = 10;

[output.l1,output.l2] = direct_prediction(50,50,tn,testcase,datafile,label);


%%
% Navier-Stokes (bordo sinistro)

addpath Functions\Kernels\Navier_Stokes
datafile = '../cylinder_fine.mat';
testcase = set_test(5);
label = 3;

load(datafile);
if strcmp(datafile,"../kuramoto_sivashinsky.mat")
    t = tt;
    u = uu;
elseif strcmp(datafile,"../cylinder_fine.mat")
    t = t_star;
end

tn = 10;

[output.l1,output.l2] = direct_prediction(50,50,tn,testcase,datafile,label);


%%
pcolor(t,x,real(usol)); 
shading interp, 
axis tight, 
colormap(jet);
colorbar;

%%
pcolor(tt,x,real(uu)); 
shading interp, 
axis tight, 
colormap(jet);
colorbar;

%%
subplot(2,1,1)
pcolor(t,x,real(usol'));
shading interp, 
axis tight, 
colormap(jet);
colorbar;
title('Re(h)','FontSize',20);
subplot(2,1,2)
pcolor(t,x,imag(usol'));
shading interp, 
axis tight, 
colormap(jet);
colorbar;
title('Im(h)','FontSize',20);

%%
coeff = 0.05;

tn = randsample(2:length(t)-1,ceil(coeff*length(t)));
tn = sort(tn);

datafile = 'burgers_paper_case8.mat';
testcase = set_test(1);
[error_l1,error_l2,error_l3,z1,z2,z3] = error_lessN(45,45,0.1,0.01,tn,testcase,datafile,1);
