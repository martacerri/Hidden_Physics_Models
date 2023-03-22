%% Korteweg-de Vries equation (two-soliton solution)
function [x,t,usol] = gen_data_KdV(nn, steps, lambda1, lambda2)
%     % INPUT VARIABLES
%     % nn : number of steps in space
%     % steps: number of steps in time
%     % u0 = @(x) initial condition
%     % lambda1: transport coefficient
%     % lambda2: coefficient of the term 3rd derivative
% 
%     % OUTPUT:
%     % usol: solution

dom = [-30 30]; x = chebfun('x',dom); tspan = linspace(0,20,steps+1);
S = spinop(dom, tspan);
S.lin = @(u) -lambda2*diff(u,3);            %derivata terza
S.nonlin = @(u) -lambda1*0.5*diff(u.^2);    % trasporto         % spin cannot parse "u.*diff(u)"
S.init = (1/2)*sech((sqrt(1)/2)*(x + 20)).^2 - (0.5/2)*sech((sqrt(0.5)/2)*(x - 10)).^2;
u = spin(S,nn,1e-4);            % u = spin(S,nn,1e-4,'plot','off');  

usol = zeros(nn,steps+1);
for i = 1:201
    usol(:,i) = u{i}.values;
end

x = linspace(-30,30,nn+1);
x = x(1:end-1);
t = tspan;
% pcolor(t,x,usol); shading interp, axis tight, colormap(jet);
% save('KdV_sine.mat','t','x','usol')