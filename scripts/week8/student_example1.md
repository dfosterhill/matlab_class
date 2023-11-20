## In-Class Example 1
You will want to spend some time exploring isoutlier on your own, as it is very complete, and very customizable. For now, let us just test out a few simple things. Begin your code by defining this data:

```
A = [57 59 60 100 59 58 57 58 300 61 62 60 62 58 57];
```
1. Use isoutlier (type 'help isoutlier' at command window for help) to return a boolean vector that identifies the outliers (default method is based on what is called the median absolute deviation (MAD) and uses a threshold of +/- 3 MAD from the median to identify outliers)
2. Use isoutlier, but use the 'mean' method. This uses +/- 3 standard deviations away from the mean
3. Use isoutlier, but use the 'quartiles' method. This uses the exact definition that we used in class
4. Finally, use isoutlier, but use the 'percentiles' method and select 20 and 80 as the percentiles for defining thresholds

 
