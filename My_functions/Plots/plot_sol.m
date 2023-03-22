function [] = plot_sol(usol,t,x)

figure
contourf(t,x,real(usol));
title('Exact solution u_t + uu_x - 0.3u_{xx} = 0','Interpreter', 'tex','FontSize',15);
colorbar

end