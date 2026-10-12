% Week 3 - Example 2 - Solution

clear all
home

%set the coefficients of the equation. Pick whatever you want.
a = 1;
b = 1;
c = 1;

%call the function

[x1,x2] = quad_equation(a,b,c)

function [root1, root2] = quad_equation(A,B,C)

root1=(-B+sqrt(B^2-4*A*C))/(2*A);
root2=(-B-sqrt(B^2-4*A*C))/(2*A);
end
