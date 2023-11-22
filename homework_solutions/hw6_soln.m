%hw 6 solution
%oc512/ce640
%david f hill
%oregon state university

clear all
close all
clc

%I will try this two ways. But, first, define data and parameters.
u=[57.12 75.78 83.77 89.58 94.16 97.99 100.81 102.12 102.62]'; %cm/s
y=[0.073 0.44 0.81 1.19 1.56 1.93 2.3 2.67 3.04]'; %cm
nu=0.01;    %cm2/s
k=0.41; %dimensionless

%% Smoth Wall Fit using nlinfit
%define anonymous function that calculates velocity (dimensional) based on
%supplied vector of vertical locations and vector of constants. This is for
%the SMOOTH case.
usmooth=@(C,y)  C/k*log(y.*C/nu);

%Initial guess for parameter. 
C0=10;

%solve for optimal parameters
[Cest,R,J,COVB,MSE] = nlinfit(y,u,usmooth,C0); %this is the one line that essentially solves the problem.
%see help nlinfit to understand the left hand side. The MSE is a measure of
%the error
disp(['Smooth Wall. Best fit for u*: ' num2str(Cest)])
disp(['Error is: ' num2str(MSE)])

%visualize results
figure(1)
plot(u,y,'o'); hold on; %this plots the data

%compute the model results
ymodel=linspace(y(1),y(end),100);   %use more points for a smoother curve
umodel=usmooth(Cest,ymodel); %this calculates the model-fit data with the best parameters
plot(umodel,ymodel,'r')  %this plots the model best fit

xlabel('u (cm/s)');
ylabel('y (cm)');
legend('Data','Smooth Model')

%% Smooth Wall Fit with 'fit' function

ft=fittype( @(C,x)  C/k*log(x.*C/nu) ); %define equation --> MUST use x (?)
F1=fit(y,u,ft,'Lower',0,'Upper',10); %perform the fit

figure(2)
plot(u,y,'o'); hold on %plot the data
plot(F1(y),y,'r'); %plot the fit
title('Smooth Wall using FIT')
xlabel('y (cm)');
ylabel('u (cm / s)');
legend('Data','Smooth Model')