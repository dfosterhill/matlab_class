%demonstration of profiling
%CE640/OC512
%D. Hill

%this simply demonstrates how to use the 'profiler' in matlab. This will
%help you identify bottlenecks in your code.

clear all
close all

%First create a scatterset of data. Don't need to place this in a function,
%but do so just for illustration purposes
num=2000;
[x,y]=makepoints(num);
z=exp(-(x/10).^2-(y/10).^2);

%plot it
figure(1)
scatter(x,y,5,z,'filled')

%create mesh on which to interpolate
[X,Y]=meshgrid(linspace(-5,5,1000),linspace(-5,5,1000));
Z=griddata(x,y,z,X,Y,'linear');
%plot it
figure(2)
surf(X,Y,Z);shading flat;view([0 90]);

%so, to test this out click on the 'run and time' button in the Run menu.
