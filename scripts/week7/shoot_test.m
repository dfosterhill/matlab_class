function out=shoot_test(in,z1_init,z1_final);

%this function will return (the variable 'out') the absolute error between a specified boundary
%condition (z1_final) and a computed boundary condition (1st element of the
%vector Y. This function will obtain the computed boundary condition by
%numerically integrating an ODE. It does this by calling ode45. In the
%above function call, the variable 'in' is an unknown initial condition,
%i.e. the value of dy/dt at x=0.z1_init is the initial condition on y
%at x=0. 

[X,Y]=ode45('shoot_test_2',[0 1],[z1_init in]);
sz=size(Y);
out=abs(z1_final-Y(sz(1),1));