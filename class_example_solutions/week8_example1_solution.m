%Week 8 Example 1 Solution
clear all
close all
clc

%create data
data=gevrnd(0,10,1,[1000,1]);

%visualize the data
figure(1)
hist(data,100);
title('Histogram of random numbers')

%Use MAD option
figure(2)
plot(data,'.');
hold on
tmp=data;
tmp(isoutlier(data))=NaN;
plot(tmp,'r.');
legend('Full dataset','Surviving points')
title('Default method in isoutlier')

%Use mean option
figure(3)
plot(data,'.');
hold on
tmp=data;
tmp(isoutlier(data,'mean'))=NaN;
plot(tmp,'g.');
legend('Full dataset','Surviving points')
title('Mean method in isoutlier')

%Use quartiles option
figure(4)
plot(data,'.');
hold on
tmp=data;
tmp(isoutlier(data,'quartiles'))=NaN;
plot(tmp,'ro');
legend('Full dataset','Surviving points')
title('Quartiles method in isoutlier')

%Use percentiles option
figure(5)
plot(data,'.');
hold on
tmp=data;
tmp(isoutlier(data,'percentiles',[10 90]))=NaN;
plot(tmp,'go');
legend('Full dataset','Surviving points')
title('Percentiles [10 90] method in isoutlier')