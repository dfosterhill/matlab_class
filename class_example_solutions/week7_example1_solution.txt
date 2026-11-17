%quick exercise to integrate equations of pendulum motion
clear all 
close all

%equation is: theta'' + (g/L)theta = 0
%recast as two equations:

%z1 = theta
%z2 = theta' = z1'

%z1' = z2
%z2' = -(g/L)z1

%set the initial conditions
z10=0.5; %displacement in radians
z20=0;  %angular velocity in radians / sec

%set the domain range
tspan=[0,4];

%create vector of initial conditions
z0=[z10 z20];

%vector of constants
p=[9.81 1]; %gravity (m/s2) and length (m)
%solve it! 
[t,z]=ode45(@pendulum2,tspan,z0,[],p);
figure(1)
plot(t,z)
grid on
xlabel('t');ylabel('z1 and z2');legend('z1 = theta','z2 = d(theta)/dt')

function zprime=pendulum2(t,z,p);
g=p(1);
L=p(2);
zprime=[z(2); -g*L*z(1)];
end
