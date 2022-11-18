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
%   y1 = x; y2 = y; y3 = x' = u; y4 = y' = v
%   y1(0) = 0; y2(0) = 0; y3 = |V|cos(theta); y4 = |V|sin(theta)

theta = 40; %degrees
gamma = [0,0.05,0.1,0.2]; %drag coefficient
speedinit = 180; %m/s
grav = 9.81; %m/s^2

 x0 = 0;
 y0 = 0;
 u0 = speedinit*cosd(theta);
 v0 = speedinit*sind(theta);
 Y0 = [x0 y0 u0 v0]; %ICs
 tvec = 0:0.1:30; %s (need to make sure this is long enough)

figure(1)
for j = 1:length(gamma)
    p = [gamma(j) grav];
    [t,ytemp] = ode45(@myfunc_projectile,tvec,Y0,[],p);
    %retain only the x,y position
    x(:,j) = ytemp(:,1);
    y(:,j) = ytemp(:,2);
    subplot(2,2,j)
    plot(ytemp(:,1),ytemp(:,2))
    xlabel('x (m)'); ylabel('y (m)');
    title(['gamma = ' num2str(gamma(j))])
    axis([0 max(ytemp(:,1)) 0 max(ytemp(:,2))])
end

% function to calculate derivatives
function yprime = myfunc_projectile(t,y,p)

gamma = p(1);
grav = p(2);

% specify the 'derivative functions' for the four ODEs
yprime = [y(3)
    y(4)
    -gamma*sqrt(y(3).^2 + y(4).^2)*y(3)
    -gamma*sqrt(y(3).^2 + y(4).^2)*y(4) - grav];
end

