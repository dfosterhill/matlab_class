function yprime=pendulum2(x,y,p);
g=p(1);
L=p(2)
yprime=[y(2); -g*L*y(1)];
