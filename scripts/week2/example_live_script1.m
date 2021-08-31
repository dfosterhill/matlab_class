%%%%%%%
% This is a test script
% Dave Hill
% Sep 2020
% update 2021
%%%%%%%

%make some data
x=1:1:10
y=x.^2

%make a plot
plot(x,y,'r')
hold on
plot(x,y,'bo')
hold off
xlabel('this is the x axis...');
ylabel('this is the y axis...');
