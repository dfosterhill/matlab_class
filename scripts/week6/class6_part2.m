% nonlinear solvers.  Explore the use of matlab's nonlinear solution routines
% to find model parameters

%To do this, we are going to make use of some code we wrote earlier in the
%term. Remember the multGauss exercise? You wrote a function that, given
%input amplitudes, locations, and 'widths', would compute individual
%gaussian profiles and then add them up. 

% Lets begin by generating a synthetic data set that is the 
%superposition of a few Gaussians
close all
clear all; clc

amp = [1 .8 0.5];         % amplitudes of the Gaussians
mu = [2 5 9];             % locations
sigma = [1 0.75 1.5];     % standard deviations
beta = [amp' mu' sigma'];   % matrix of our true parameters

x = [0: 0.1: 15];           % this is the solution domain

y = multgauss(beta,x);    % create sum of Gaussians. This vector y serves
                           % as the 'data' for our exercise. The next thing we 
                           % will do is to use the multgauss function as
                           % our 'model' function and determine the
                           % necessary parameters.                        

figure(1); clf
plot(x,y)                   % examine the data
hold on

%note: this data was created with NINE parameters. That's a lot to figure
%out.

%We are going to figure this out with the lsqcurvefit function. Sometimes
%we have to 'help' it out by supply possible upper and lower bounds on the
%parameters. My LB will be 0 for all three params. My UB will be 2, 10, and
%5 for the amplitudes, locations, and widths.

UB = repmat([2 10 5], 3, 1);     
LB = repmat([0 0 0], 3, 1);

%we also have to supply 'starting values' for the parameter search.
%Sometimes we have to good initial guesses, other times matlab can do
%amazing things with bad initial guesses. Here, I am going to guess
%starting values of 1 for all three parameters and for all three gaussians.

guess=ones(3,3)*.1

betaFitbounded = lsqcurvefit('multgauss', guess, x, y, LB, UB)
yestbound=multgauss(betaFitbounded,x);
plot(x,yestbound,'ro')
legend('original data','curve fit')
