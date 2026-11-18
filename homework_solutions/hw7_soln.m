%------------------------------------------------------------------------%
% CE640/OC512-MATLAB
% HW 7 Solution
%------------------------------------------------------------------------%

clear all
close all
clc

% projectile motion. The basic equations for horizontal and vertical
% velocity are given by:
% u' = -\gamma*|V|*u
% v' = -\gamma*|V|*v - g

% We have two more equations which are the fundamental definitions of
% velocity
% x' = u
% y' = v 

% ICs:
%   x(0) = 0; y(0) = 0
%   u(0) = |V|cos(theta) - The |V| is magnitude of velocity vector
%   v(0) = |V|sin(theta)

% Recast as system of 4 ODEs:
%   z1 = x; z2 = y; z3 = x' = u; z4 = y' = v
%   z1(0) = 0; z2(0) = 0; z3 = |V|cos(theta); z4 = |V|sin(theta)

theta = 40; %degrees
gamma = [0,0.05,0.1,0.2]; %drag coefficient
speedinit = 180; %m/s
grav = 9.81; %m/s^2

 x0 = 0;
 y0 = 0;
 u0 = speedinit*cosd(theta);
 v0 = speedinit*sind(theta);
 Z0 = [x0 y0 u0 v0]; %ICs
 tvec = 0:0.1:30; %s (need to make sure this is long enough)

figure(1)
for j = 1:length(gamma)
    p = [gamma(j) grav];
    [t,ztemp] = ode45(@myfunc_projectile,tvec,Z0,[],p);
    subplot(2,2,j)
    plot(ztemp(:,1),ztemp(:,2))
    xlabel('x (m)'); ylabel('y (m)');
    title(['gamma = ' num2str(gamma(j))])
    axis([0 max(ztemp(:,1)) 0 max(ztemp(:,2))])
end

% function to calculate derivatives
function zprime = myfunc_projectile(t,z,p)

gamma = p(1);
grav = p(2);

% specify the 'derivative functions' for the four ODEs
zprime = [z(3);
    z(4);
    -gamma*sqrt(z(3).^2 + z(4).^2)*z(3);
    -gamma*sqrt(z(3).^2 + z(4).^2)*z(4) - grav];
end

