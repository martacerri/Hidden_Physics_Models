function params = compute_parameters(filename,testcase,label,t,x)

% if label == 1
%    coeff = 0.20;
% elseif label == 2
%    coeff = 0.30;
% else
%    coeff = 0.40;
% end

coeff = 0.2;          % quanti N0,N1 considerare ?

T = length(t)-1;
tn = 2:T;
tn = randsample(tn,ceil(0.2*T));
tn = sort(tn);

% if label == 2
%     x = linspace(1,length(x),ceil(length(x)/2));
% elseif label == 3 && length(x) >= 40
%     x = x([1:20,end-20:end],1);
% end

N = length(x);
N = set_N(N, testcase);         %burgers max 90, kdv max 150

NN = 1:N;
N0 = randsample(NN,ceil(coeff*N));
N1 = randsample(NN,ceil(coeff*N));
% N0 = randsample(NN,10);
% N1 = randsample(NN,10);

N0 = sort(N0);
N1 = sort(N1);

[error, error_noise, lambda1, lambda2, lambda1_noise, lambda2_noise] = equation(N0,N1,tn,label,filename,testcase);

params = struct ('lambda1',                 lambda1,...
                 'lambda1_noise',           lambda1_noise,...
                 'lambda2',                 lambda2,...
                 'lambda2_noise',           lambda2_noise,...
                 'error',                   error,...
                 'error_noise',             error_noise,...
                 'N0',                      N0,...
                 'N1',                      N1,...
                 'tn',                      tn...
                 );

end