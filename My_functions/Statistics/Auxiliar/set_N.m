function [N] = set_N(N,testcase)

if strcmp(testcase,'burgers') && N >= 90
    N = 90;
elseif strcmp(testcase,'kdv') && N >= 130
    N = 130;
elseif strcmp(testcase,'ks') && N >= 350
    N = 350;
elseif strcmp(testcase,'schrodinger') && N >= 90
    N = 90;
elseif strcmp(testcase,'ns') && N >= 300
    N = 300;
else
    N = N;
end

end