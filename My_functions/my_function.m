function output = my_function(filename, testcase, label)

load(filename, 'usol', 't', 'x');

params = compute_parameters(filename,testcase,label,t,x);

output = my_class(testcase,params,usol,t,x);

% params è una struct (classe)
% plots plotta lambda @(N) e @(t)

% output = struct ('parameters_estimated',             params,...
%                  'plot_lambda',                      plot_lambda(params),...            % si può fare?? classe in matlab...
%                  'suggest_N',                        plot_interpolantN(params),...
%                  'lambda',                           lambda_statistics(params),...
%                  'plot_solution',                    plot_sol(params),...
%                  'plot_estimated_solution',          plot_estim_sol(params)...
%                  );

end