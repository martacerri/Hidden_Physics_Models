l1 = output.l1;
l2 = output.l2;
l3 = output.l3;

figure
subplot(2,2,2)
plot(l1,'ro','LineWidth',2);
hold on
plot([0,6],[median(l1) median(l1)],'b-','LineWidth',2);
title(['\lambda_1=',num2str(median(l1))],'FontSize',20);
xlabel('simulation #n','FontSize',15);
ylabel('\lambda','FontSize',15);
subplot(2,2,3)
plot(l2,'ro','LineWidth',2);
hold on
plot([0,6],[median(l2) median(l2)],'b-','LineWidth',2);
title(['\lambda_2=',num2str(median(l2))],'FontSize',20);
xlabel('simulation #n','FontSize',15);
ylabel('\lambda','FontSize',15);
subplot(2,2,4)
plot(l3,'ro','LineWidth',2);
hold on
plot([0,6],[median(l3) median(l3)],'b-','LineWidth',2);
title(['\lambda_2=',num2str(median(l3))],'FontSize',20);
xlabel('simulation #n','FontSize',15);
ylabel('\lambda','FontSize',15);

