clear all 
close all
%set the initial conditions
Y10=0.5;
Y20=0;
%set the domain rainge
xspan=[0,4];
%create vector of initial conditions
Y0=[Y10 Y20];

%constants
p=[9.81 1];
%solve it! Note that I am using a function that I wrote and that is
%supplied with the notes for this week.
[x,y]=ode45(@pendulum2,xspan,Y0,[],p);
figure(1)
plot(x,y)
grid on
xlabel('t');ylabel('y1 and y2');legend('y1','y2')