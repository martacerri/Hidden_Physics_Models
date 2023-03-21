function [] = plot_estim_sol(l1,l2,usol,t,x)

% call generator to return the solution with my values of l1,l2

figure
contourf(t,x,usol);
title(['Exact solution u_t + ',num2str(l1),' uu_x - ',num2str(l2),'u_{xx} = 0'],'Interpreter', 'tex','FontSize',15);
colorbar

end