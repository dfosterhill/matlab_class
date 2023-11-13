function out=shoot_test_2(x,in)

%this function returns the 'derivative functions' for the ODE given by
%y'' + (-5-10x)y' - 10y = 0   When cast as a system of two first order ODEs
%we have:
%z1 = y
%z2 = z1' = y'

%z1' = z2
%z2' = (10x+5)z2 - 10z1

%the variable 'in' contains the ICs for z1 and z2. The variable 'out'
%contains the two computed derivatives.

z1=in(1);
z2=in(2);

out(1,1)=z2;
out(2,1)=(10*x+5).*z2-10*z1;
