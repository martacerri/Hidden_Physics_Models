function [x,t,usol] = gen_data_burgers(xspan, tspan, lambda1, lambda2)
%     % INPUT VARIABLES
%     % nn : number of steps in space
%     % steps: number of steps in time
%     % u0 = @(x) initial condition
%     % lambda1: transport coefficient, here negative
%     % lambda2: diffusion coefficient, here positive
% 
%     % OUTPUT:
%     % usol: solution
                          
nn = length(xspan);
steps = length(tspan);

dom = [-8 8]; 
x = chebfun('x',dom); 
%tspan = linspace(0,12,steps+1);
S = spinop(dom, tspan);
S.lin = @(u) + lambda2*diff(u,2);           %diffusione
S.nonlin = @(u) - ((lambda1)/2)*diff(u.^2);   % spin cannot parse "u.*diff(u)" %trasporto
S.init = (7/4)*normpdf(x, -2, 0.7);  %exp(-(x+2).^2);
u = spin(S,nn,1e-4);

usol = zeros(nn,steps+1);
for i = 1:steps+1
    usol(:,i) = u{i}.values;
end

x = xpan;
t = tspan;

%pcolor(t,x,real(usol)); shading interp, axis tight, colormap(jet);
%save('burgers_sine.mat','t','x','usol')