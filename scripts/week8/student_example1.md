## In-Class Example 1
You will want to spend some time exploring isoutlier on your own, as it is very complete, and very customizable. For now, let us just test out a few simple things. Begin your code by defining this data:

```
data=gevrnd(0,10,1,[1000,1]);
```
This will create a vector of 1000 random numbers which are not normally-distributed. You can see this if you issue a command like

```
hist(data,100);
```

1. Use isoutlier (type 'help isoutlier' at command window for help) to return a boolean vector that identifies the outliers (default method is based on what is called the median absolute deviation (MAD) and uses a threshold of +/- 3 MAD from the median to identify outliers)
2. Make a plot that shows the original data and also the data with the outliers removed. One way to do this is:

```
plot(data,'.'); %orig data plot
hold on
tmp=data; %make copy of the data
tmp(isoutlier(data))=NaN; %remove the outlier points
plot(tmp,'r.');
```
There are many other ways to do this as well...up to you how you want to visualize the full data and also the 'surviving' data.

3. Repeat the above process, but use the 'mean' method in isoutlier. This uses +/- 3 standard deviations away from the mean
4. Repeat the above process, but use the 'quartiles' method. This uses the exact definition that we used in class
5. Finally, repeat the above process, but use the 'percentiles' method and select 10 and 90 as the percentiles for defining thresholds

 
