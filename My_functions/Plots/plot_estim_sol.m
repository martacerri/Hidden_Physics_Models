function [u, err] = plot_estim_sol(l1,l2, usol, t,x, testcase)

% call generator to return the solution with my values of l1,l2
if testcase == "burgers"
    [x,t,u] = gen_data_burgers(x, t, l1, l2);
elseif testcase == "kdv"
    %[x,t,u] = gen_data_KdV(x, t, l1, l2);
    [x,t,u] = gen_data_KdV(length(x), length(t), l1, l2);
elseif testcase == "kdv"
    %[x,t,u] = gen_data_KdV(x, t, l1, l2);
    [x,t,u] = gen_data_KS(length(x), length(t), l1, l2, l3);
else
    error('Invalid tag');
end

figure                                  % mettere dentro if e scrivere le varie equazioni così...
contourf(t,x,u);
title(['Exact solution u_t + ',num2str(l1),' uu_x - ',num2str(l2),'u_{xx} = 0'],'Interpreter', 'tex','FontSize',15);
colorbar

err = norm(u-usol);

end