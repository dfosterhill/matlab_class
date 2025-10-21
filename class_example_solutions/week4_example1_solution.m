% Week 4 - Example 1 - Solution

clear all
home

%note that running this requires the presence of the file called
%week4_example1_input.txt, which is a simple text file that this script
%will read.

%I will try doing this with tables
T=readtable('week4_example1_input.txt')

%Now, if you look at T, you'll see that the 'Error' (row 2, column 2)
%string has been replaced by a NaN. That's pretty helpful since we can now
%immediately compute means. Watch:

meanvalues = nanmean(T{:,:})

%note that tables are a bit fiddly...just nanmean(T) will not work. If you
%don't like this, you can convert to an array

Tarray=table2array(T)
meanvalues2=nanmean(Tarray)


