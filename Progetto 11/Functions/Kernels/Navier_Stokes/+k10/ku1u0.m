function [K] = ku1u0(x, y, xp, yp, hyp, ubarp, vbarp, dt, i)

logsigma = hyp(1);
logthetax = hyp(2);
logthetay = hyp(3);

a1 = hyp(4);
a2 = hyp(5);

n_x = size(x,1);
n_y = size(y,1);
n_xp = size(xp,1);
n_yp = size(yp,1);

x = repmat(x,1,n_xp);
y = repmat(y,1,n_yp);
xp = repmat(xp',n_x,1);
yp = repmat(yp',n_y,1);

ubarp = repmat(ubarp',n_x,1);
vbarp = repmat(vbarp',n_y,1);

switch i


case 0

K=exp(1).^(logsigma+(-4).*logthetay+(-1/2).*exp(1).^((-1).*logthetax).*(x+ ...
  (-1).*xp).^2+(-1/2).*exp(1).^((-1).*logthetay).*(y+(-1).*yp).^2).*(exp( ...
  1).^(2.*logthetay).*(exp(1).^logthetay+(-1).*(y+(-1).*yp).^2)+a1.*dt.* ...
  exp(1).^((-1).*logthetax+logthetay).*(exp(1).^(2.*logthetay).*ubarp.*(x+ ...
  (-1).*xp)+3.*exp(1).^(logthetax+logthetay).*vbarp.*(y+(-1).*yp)+(-1).* ...
  exp(1).^logthetay.*ubarp.*(x+(-1).*xp).*(y+(-1).*yp).^2+(-1).*exp(1) ...
  .^logthetax.*vbarp.*(y+(-1).*yp).^3)+dt.*exp(1).^(a2+(-2).*logthetax).*( ...
  3.*exp(1).^(2.*(logthetax+logthetay))+exp(1).^(logthetax+3.*logthetay)+( ...
  -1).*exp(1).^(3.*logthetay).*(x+(-1).*xp).^2+(-6).*exp(1).^(2.* ...
  logthetax+logthetay).*(y+(-1).*yp).^2+(-1).*exp(1).^(logthetax+2.* ...
  logthetay).*(y+(-1).*yp).^2+exp(1).^(2.*logthetay).*(x+(-1).*xp).^2.*(y+ ...
  (-1).*yp).^2+exp(1).^(2.*logthetax).*(y+(-1).*yp).^4));


case 1 % logsigma

K=exp(1).^(logsigma+(-4).*logthetay+(-1/2).*exp(1).^((-1).*logthetax).*(x+ ...
  (-1).*xp).^2+(-1/2).*exp(1).^((-1).*logthetay).*(y+(-1).*yp).^2).*(exp( ...
  1).^(2.*logthetay).*(exp(1).^logthetay+(-1).*(y+(-1).*yp).^2)+a1.*dt.* ...
  exp(1).^((-1).*logthetax+logthetay).*(exp(1).^(2.*logthetay).*ubarp.*(x+ ...
  (-1).*xp)+3.*exp(1).^(logthetax+logthetay).*vbarp.*(y+(-1).*yp)+(-1).* ...
  exp(1).^logthetay.*ubarp.*(x+(-1).*xp).*(y+(-1).*yp).^2+(-1).*exp(1) ...
  .^logthetax.*vbarp.*(y+(-1).*yp).^3)+dt.*exp(1).^(a2+(-2).*logthetax).*( ...
  3.*exp(1).^(2.*(logthetax+logthetay))+exp(1).^(logthetax+3.*logthetay)+( ...
  -1).*exp(1).^(3.*logthetay).*(x+(-1).*xp).^2+(-6).*exp(1).^(2.* ...
  logthetax+logthetay).*(y+(-1).*yp).^2+(-1).*exp(1).^(logthetax+2.* ...
  logthetay).*(y+(-1).*yp).^2+exp(1).^(2.*logthetay).*(x+(-1).*xp).^2.*(y+ ...
  (-1).*yp).^2+exp(1).^(2.*logthetax).*(y+(-1).*yp).^4));


case 2 % logthetax

K=(1/2).*exp(1).^(logsigma+(-4).*logthetay+(-1/2).*exp(1).^((-1).* ...
  logthetax).*(x+(-1).*xp).^2+(-1/2).*exp(1).^((-1).*logthetay).*(y+(-1).* ...
  yp).^2).*(exp(1).^((-1).*logthetax).*(x+(-1).*xp).^2.*(exp(1).^(2.* ...
  logthetay).*(exp(1).^logthetay+(-1).*(y+(-1).*yp).^2)+a1.*dt.*exp(1).^(( ...
  -1).*logthetax+logthetay).*(exp(1).^(2.*logthetay).*ubarp.*(x+(-1).*xp)+ ...
  3.*exp(1).^(logthetax+logthetay).*vbarp.*(y+(-1).*yp)+(-1).*exp(1) ...
  .^logthetay.*ubarp.*(x+(-1).*xp).*(y+(-1).*yp).^2+(-1).*exp(1) ...
  .^logthetax.*vbarp.*(y+(-1).*yp).^3)+dt.*exp(1).^(a2+(-2).*logthetax).*( ...
  3.*exp(1).^(2.*(logthetax+logthetay))+exp(1).^(logthetax+3.*logthetay)+( ...
  -1).*exp(1).^(3.*logthetay).*(x+(-1).*xp).^2+(-6).*exp(1).^(2.* ...
  logthetax+logthetay).*(y+(-1).*yp).^2+(-1).*exp(1).^(logthetax+2.* ...
  logthetay).*(y+(-1).*yp).^2+exp(1).^(2.*logthetay).*(x+(-1).*xp).^2.*(y+ ...
  (-1).*yp).^2+exp(1).^(2.*logthetax).*(y+(-1).*yp).^4))+(-2).*dt.*exp(1) ...
  .^((-2).*logthetax+2.*logthetay).*(exp(1).^(a2+logthetax)+a1.*exp(1) ...
  .^logthetax.*ubarp.*(x+(-1).*xp)+(-2).*exp(1).^a2.*(x+(-1).*xp).^2).*( ...
  exp(1).^logthetay+(-1).*(y+(-1).*yp).^2));


case 3 % logthetay

K=exp(1).^(logsigma+(-4).*logthetay+(-1/2).*exp(1).^((-1).*logthetax).*(x+ ...
  (-1).*xp).^2+(-1/2).*exp(1).^((-1).*logthetay).*(y+(-1).*yp).^2).*(exp( ...
  1).^(3.*logthetay)+2.*exp(1).^(2.*logthetay).*(exp(1).^logthetay+(-1).*( ...
  y+(-1).*yp).^2)+(exp(1).^(2.*logthetay).*(exp(1).^logthetay+(-1).*(y+( ...
  -1).*yp).^2)+a1.*dt.*exp(1).^((-1).*logthetax+logthetay).*(exp(1).^(2.* ...
  logthetay).*ubarp.*(x+(-1).*xp)+3.*exp(1).^(logthetax+logthetay).* ...
  vbarp.*(y+(-1).*yp)+(-1).*exp(1).^logthetay.*ubarp.*(x+(-1).*xp).*(y+( ...
  -1).*yp).^2+(-1).*exp(1).^logthetax.*vbarp.*(y+(-1).*yp).^3)+dt.*exp(1) ...
  .^(a2+(-2).*logthetax).*(3.*exp(1).^(2.*(logthetax+logthetay))+exp(1).^( ...
  logthetax+3.*logthetay)+(-1).*exp(1).^(3.*logthetay).*(x+(-1).*xp).^2+( ...
  -6).*exp(1).^(2.*logthetax+logthetay).*(y+(-1).*yp).^2+(-1).*exp(1).^( ...
  logthetax+2.*logthetay).*(y+(-1).*yp).^2+exp(1).^(2.*logthetay).*(x+(-1) ...
  .*xp).^2.*(y+(-1).*yp).^2+exp(1).^(2.*logthetax).*(y+(-1).*yp).^4)).*(( ...
  -4)+(1/2).*exp(1).^((-1).*logthetay).*(y+(-1).*yp).^2)+a1.*dt.*exp(1).^( ...
  (-1).*logthetax+2.*logthetay).*(2.*exp(1).^logthetay.*ubarp.*(x+(-1).* ...
  xp)+3.*exp(1).^logthetax.*vbarp.*(y+(-1).*yp)+(-1).*ubarp.*(x+(-1).*xp) ...
  .*(y+(-1).*yp).^2)+dt.*exp(1).^(a2+(-2).*logthetax+logthetay).*(6.*exp( ...
  1).^(2.*logthetax+logthetay)+3.*exp(1).^(logthetax+2.*logthetay)+(-3).* ...
  exp(1).^(2.*logthetay).*(x+(-1).*xp).^2+(-6).*exp(1).^(2.*logthetax).*( ...
  y+(-1).*yp).^2+(-2).*exp(1).^(logthetax+logthetay).*(y+(-1).*yp).^2+2.* ...
  exp(1).^logthetay.*(x+(-1).*xp).^2.*(y+(-1).*yp).^2)+a1.*dt.*exp(1).^(( ...
  -1).*logthetax+logthetay).*(exp(1).^(2.*logthetay).*ubarp.*(x+(-1).*xp)+ ...
  3.*exp(1).^(logthetax+logthetay).*vbarp.*(y+(-1).*yp)+(-1).*exp(1) ...
  .^logthetay.*ubarp.*(x+(-1).*xp).*(y+(-1).*yp).^2+(-1).*exp(1) ...
  .^logthetax.*vbarp.*(y+(-1).*yp).^3));


case 4 % a1

K=dt.*exp(1).^(logsigma+(-1).*logthetax+(-3).*logthetay+(-1/2).*exp(1).^(( ...
  -1).*logthetax).*(x+(-1).*xp).^2+(-1/2).*exp(1).^((-1).*logthetay).*(y+( ...
  -1).*yp).^2).*(exp(1).^(2.*logthetay).*ubarp.*(x+(-1).*xp)+3.*exp(1).^( ...
  logthetax+logthetay).*vbarp.*(y+(-1).*yp)+(-1).*exp(1).^logthetay.* ...
  ubarp.*(x+(-1).*xp).*(y+(-1).*yp).^2+(-1).*exp(1).^logthetax.*vbarp.*(y+ ...
  (-1).*yp).^3);


case 5 % a2

K=dt.*exp(1).^(a2+logsigma+(-2).*logthetax+(-4).*logthetay+(-1/2).*exp(1) ...
  .^((-1).*logthetax).*(x+(-1).*xp).^2+(-1/2).*exp(1).^((-1).*logthetay).* ...
  (y+(-1).*yp).^2).*(3.*exp(1).^(2.*(logthetax+logthetay))+exp(1).^( ...
  logthetax+3.*logthetay)+(-1).*exp(1).^(3.*logthetay).*(x+(-1).*xp).^2+( ...
  -6).*exp(1).^(2.*logthetax+logthetay).*(y+(-1).*yp).^2+(-1).*exp(1).^( ...
  logthetax+2.*logthetay).*(y+(-1).*yp).^2+exp(1).^(2.*logthetay).*(x+(-1) ...
  .*xp).^2.*(y+(-1).*yp).^2+exp(1).^(2.*logthetax).*(y+(-1).*yp).^4);


otherwise
        
        K = zeros(n_x, n_xp);
end

end
