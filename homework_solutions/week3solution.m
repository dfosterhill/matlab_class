%hw3 solution
%ce640/oc512
%dfhill
%oregon state university...

clear all
close all
clc

%this mfile will define the paramters (amplitudes, standard deviations, locations)
%of numerous bell-curves (gaussian profiles). It will then call a function
%that will sum those together.

%Define domain and the parameters for the four gaussians...

x=linspace(0,20,100);
amps=[0.1 0.5 1 2]';
Cs=[2 4 6 8]';
sigmas=[0.5 1 2 3]';
beta=[amps Cs sigmas];

%call multgauss, which will return the sum of the gaussians.
y=multgauss(x,beta);

if sum(isnan(y))==length(x)
    disp('Be sure to submit the correct number of input parameters')
else
    %plot the result
    figure(1)
    plot(x,y)
    xlabel('x');ylabel('y');title('sum of 4 gaussians')
end