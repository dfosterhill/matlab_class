# In-Class Example 1
Ok, so let's break for a few minutes to do an inclass exercise now that you have a large menu of options available to you. I would like you to create and save a text file (call it whatever you want). The text file should have the following content. Pretend this is some data from a suite of environmental measurement devices. Note that the content in this file is tab-delimited.
> Sensor1 (deg)    Sensor2 (mmHg)    Sensor3 (m/s)
> 
> 18    760    8.6
> 
> 16.4    Error    12.0
> 
> 15.1    745    10.6

Ok, so that is it! One header line, and three rows of data. Note that you have one data entry that is an error code (it is a string, not a number). This is very common in terms of the data files that you might encounter in research that you do. It is tempting to manually go in and edit files, replacing the strings with something else that is easier to deal with. BUT, that's a huge pain when your data file has one million lines.
Ok, so once you have created this text file, and saved it, create a m-file that will read this file (using whatever method you want!) and will compute the average value (mean) of all of the valid values in each column. So, you will have to do some sort of 'checking' to see which rows are fully numeric and which are not, and deal with that. Don't stress if you find this challenging....this is just 15 min for you to play around with a few options and see if you can sort out which is best! Good luck.
