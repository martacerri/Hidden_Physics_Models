function [N] = set_N(N,testcase)

if strcmp(testcase,'burgers') && N >= 90
    N = 90;
elseif strcmp(testcase,'kdv') && N >= 130
    N = 130;
else
    N = N;
end

end