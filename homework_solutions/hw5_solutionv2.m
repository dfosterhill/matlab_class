%oc512 /ce640

%This script loads all '.asc' files in the folder it resides in 
%and generates a plot of the sum of gridded data in the folder 
%(total annual precipitation). There are many ways to do this (use advanced
%methods like readgeoraster, etc.). I will keep things simple by using
%commands like fopen, textscan, and so on. Note that the first six lines of
%ESRI ASCII files are of the following (rigid) format:
%ncols 407
%nrows 229
%xllcorner -124.73958333333
%yllcorner 41.73958333333
%cellsize 0.02083333333
%NODATA_value -9999

clear all
close all
home

var=dir('*.asc');
numfiles=length(var);   %number of .asc files to analyze.

%open just the first file to get header info. This does not need to be
%repeated, since all files have the same header.

fname=var(1).name
fid=fopen(fname);
data=textscan(fid,'%s %f',1); ncols=data{2};
data=textscan(fid,'%s %f',1); nrows=data{2};
data=textscan(fid,'%s %f',1); xllcorner=data{2};
data=textscan(fid,'%s %f',1); yllcorner=data{2};
data=textscan(fid,'%s %f',1); cellsize=data{2};
data=textscan(fid,'%s %f',1); NODATA_value=data{2};
fclose(fid)

%create vector of x (lon) and y (lat) values
lon=xllcorner+[0:1:ncols-1]*cellsize;
lat=yllcorner+[0:1:nrows-1]*cellsize;

%create matrices of lon lat for later use in plottingl
[LON,LAT]=meshgrid(lon,lat);

%initialize an array of zeros to use for our running total.
totalprecip=zeros(nrows,ncols);

%loop over the files to read in the data.
for n = 1:numfiles
    fname=var(n).name;
    fid=fopen(fname);
    
    %next use textscan, skid the headers, and just dump it into a long
    %vector
    data=textscan(fid,'%f','HeaderLines',6);
    
    %this next line ia tricky...I am converting the long vector into an
    %array matching the dimensions of the lat / lon grid. Then, I have to
    %flip it. Why? Because ESRI ascii grids list data starting from the LL
    %corner, but matlab likes to list data starting from UL corner. This
    %always confuses me, and I usually have to do some trial and error to
    %get things right!
    precipdata=flipud([reshape(data{:},ncols,nrows)]');
    
    %Next, the 'nodata' values of -9999 will mess up our map. I would like
    %to 'blank then out.' This is easy to do if we turn them to NaNs.
    precipdata(precipdata==NODATA_value)=NaN;
    
    %add current month to running sum.
    totalprecip=totalprecip+precipdata;
    fclose(fid)
    disp(['month ' num2str(n)])

end

%Main product #1: Figure depecting annual total precipitation over the
%domain described by the files that were read in above.
figure(1)
set(gcf,'PaperPosition',[1 1 5 4])
pcolor(LON,LAT,totalprecip);
shading flat
xlabel('Lon');ylabel('Lat');
title('Annual precip (mm)');
colorbar
print -dpng -r300 totalprecip.png



