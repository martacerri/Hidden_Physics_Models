function obj = lambda_statistics(obj)

params = obj.params;

lambda1 = params.lambda1;
lambda2 = params.lambda2;

[n, m] = size(lambda1);
lambda1 = reshape(lambda1,n*m,1);
lambda2 = reshape(lambda2,n*m,1);

l1 = median(lambda1);
l2 = median(lambda2);

figure
boxplot(lambda1);
title(['\lambda_1 = ',num2str(l1)],'Interpreter', 'tex','FontSize',15);

figure
boxplot(lambda2);
title(['\lambda_2 = ',num2str(l2)],'Interpreter', 'tex','FontSize',15);

obj.l1 = l1;
obj.l2 = l2;

if strcmp(obj.testcase,"ks")
    lambda3 = params.lambda3;
    lambda3 = reshape(lambda3,n*m,1);
    l3 = median(lambda3);

    figure
    boxplot(lambda3);
    title(['\lambda_3 = ',num2str(l3)],'Interpreter', 'tex','FontSize',15);

    obj.l3 = l3;
end

end