function xprime=lorenz_dfh(t,x,p);
% x is a vector that contains x,y,z (the three things we are solving for)
% p is a vector that contains sigma, beta, and rho
sig=p(1);
beta=p(2);
rho=p(3);

% return the 'right hand sides' of the three equations (the derivative functions)
xprime=[-sig*x(1)+sig*x(2); rho*x(1)-x(2)-x(1)*x(3); -beta*x(3)+x(1)*x(2)];
