function xprime=lorenz_dfh(t,x,p);
sig=p(1);
beta=p(2);
rho=p(3);

xprime=[-sig*x(1)+sig*x(2); rho*x(1)-x(2)-x(1)*x(3); -beta*x(3)+x(1)*x(2)];
