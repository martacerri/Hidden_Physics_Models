function [error, error_noise, lambda1, lambda2, lambda1_noise, lambda2_noise] = equation(N0,N1,tn,label,filename,testcase)

m = length(tn);
n = length(N0);         % == length(N1)

error = zeros(n,m);
error_noise = zeros(n,m);
lambda1 = zeros(n,m);
lambda2 = zeros(n,m);
lambda1_noise = zeros(n,m);
lambda2_noise = zeros(n,m);

if strcmp(testcase,'burgers')
    for i = 1:n
        for j = 1:m
            [error(i,j), error_noise(i,j), lambda1(i,j), lambda2(i,j), lambda1_noise(i,j), lambda2_noise(i,j)] = Burgers(N0(i),N1(i),tn(j),label,filename);
        end
    end

elseif strcmp(testcase,'kdv')
    for i = 1:n
        for j = 1:m
            [error(i,j), error_noise(i,j), lambda1(i,j), lambda2(i,j), lambda1_noise(i,j), lambda2_noise(i,j)] = KDV(N0(i),N1(i),tn(j),label,filename);
        end
    end
end

end