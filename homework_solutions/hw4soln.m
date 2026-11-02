% CE 640 / OC 512
% HW4 Solution #1

clear all
close all
clc

%Let's start by reading in the data. I found that importdata worked, but
%with one weird caveat. It read in the two headerlines. BUT the entire
%first row was stuck in the first entry of the first row. Weird. So, my
%code below does indeed work, but it's a bit weird.

[M delim header]=importdata('hw4_data.txt');

yr=M.data(:,1); mo=M.data(:,2); dy=M.data(:,3); hr=M.data(:,4); mn=M.data(:,5);

atmp=M.data(:,14);

N=datenum(yr,mo,dy,hr,mn,zeros(size(mn))); %fake vector of zeros for seconds

figure(1)
plot(N,atmp);
datetick('x',7)
xlabel('Day');ylabel('Air temperatures (deg C)')

figure(2)

wvht=M.data(:,9);
wspd=M.data(:,7);   %need to remove 99 (no data values!)

wspd(find(wvht==99))=[];
wvht(find(wvht==99))=[];

plot(wvht,wspd,'.');
xlabel('Wave height (m)'); ylabel('Wind speed (m/s)');
% yes, there is some weak correlation there...

%%
%Ok, problem 2. Let us first loop through and average the data. .
%loop over the 30 days of september. 99 and 999 values are removed prior to
%averaging. NOTE: last three columns are ALL missing data, so those will
%have 999 or 99 values (as appropriate) in the averaged fields.

for j=1:30
    I=find(dy==j);
    tmp=M.data(I,:);
    tmp(tmp==99)=NaN;
    tmp(tmp==999)=NaN;
    avgdata(j,:)=nanmean(tmp);
end

%put back missing values in last three columns
avgdata(:,16)=999;
avgdata(:,17:18)=99;

%delete hr and mn columns
avgdata(:,4:5)=[];

%write out file...

fid=fopen('hw4part2.txt','w');
%make first header row. I basically use the first row from the original
%file but I cut out the bits having to do with hour and min.
firstrow=M.textdata{1};
firstrow=[firstrow(1:10) firstrow(17:end)];
fprintf(fid,'%s\n',firstrow);
%hack together 2nd header row. This is hideous, sorry...
tmp=char(M.textdata(2,:));
secondrow=[strtrim(tmp(1,:)) '  ' strtrim(tmp(2,:)) ' ' strtrim(tmp(3,:)) ' '  ...
     strtrim(tmp(6,:)) ' ' ...
    strtrim(tmp(7,:)) '  ' strtrim(tmp(8,:)) '  ' strtrim(tmp(9,:)) '      ' ...
    strtrim(tmp(10,:)) '   ' strtrim(tmp(11,:)) ' ' strtrim(tmp(12,:)) '   '  ...
    strtrim(tmp(13,:)) '   ' strtrim(tmp(14,:)) '  ' strtrim(tmp(15,:)) '  ' ...
    strtrim(tmp(16,:)) '  ' strtrim(tmp(17,:)) '  ' tmp(18,:)];
fprintf(fid,'%s\n',secondrow);

fprintf(fid,'%4d%2d%3d%5.0f%5.1f%5.1f%5.1f%6.1f%5.1f%6.0f%7.1f%5.1f%5.1f%5d%5d%5d\n',avgdata')
fclose(fid)

