function [] = direct_prediction(N0,N1,tn,testcase)

[~,~,lambda1,lambda2,~,~] = equation(N0,N1,tn,label,filename,testcase);

l1 = mean(lambda1);
l2 = mean(lambda2);

figure
plot(tn,lambda1,'ro');
hold on
plot([tn(1), tn(end)],[l1,l1],'b-');
title(['\lambda_1 = ',num2str(l1)]);

figure
plot(tn,lambda2,'ro');
hold on
plot([tn(1), tn(end)],[l2, l2],'b-');
title(['\lambda_1 = ',num2str(l2)]);

end