% week 6 example problem 1 solution
% dave hill - oregon state university

clear all
close all
clc

% define the given data
x = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]';

y = [1.5904 0.7879 1.7116 1.8912 2.5287 2.8682 3.1552  ...
    2.3805 3.3594 3.4725 2.6418 2.7021 3.6023 4.6612  ...
    3.5538 4.1705 3.5707 4.7451 3.8691 4.4840]';

% define proposed fit
ft=fittype(@(a,x) x.^a);

% actually DO the fit
F1=fit(x,y,ft);

% make a plot
figure(1)
plot(x,y,'o');
hold on
plot(x,F1(x),'r');
xlabel('x'); ylabel('y'); legend('data','fit')

% print out the value of the best-fit coefficient
F1.a %note...it SHOULD be 0.5 or very close.