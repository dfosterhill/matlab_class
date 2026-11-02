% CE 640 / OC 512
% HW4 Solution #1
% this is just an alternative way to read in the data...I use textscan in
% this case...

clear all
close all
clc

%Let's start by reading in the data. I do this with textscan
fid=fopen('hw4_data.txt');

%first, read two header lines
headers=textscan(fid,repmat('%s',1,18),2); %repmat saves me typing it out 18 times!

%next read entire block of data
data=textscan(fid,'%d%d%d%d%d%d%f%f%f%f%f%d%f%f%f%f%f%f\n');

yr=data{1}(:); mo=data{2}(:); dy=data{3}(:); hr=data{4}(:); mn=data{5}(:);
atmp=data{14}(:);

%datenum only works with double precision numbers...don't ask me why.
yr=double(yr); mo=double(mo); dy=double(dy); hr=double(hr); mn=double(mn);
N=datenum(yr,mo,dy,hr,mn,zeros(size(mn))); %fake a vector of zeros for seconds

figure(1)
plot(N,atmp);
datetick('x',7)
xlabel('Day');ylabel('Air temperatures (deg C)')

figure(2)

wvht=data{9}(:);
wspd=data{7}(:);    

%need to remove 99 (no data values!)
wspd(find(wvht==99))=[];
wvht(find(wvht==99))=[];

plot(wvht,wspd,'.');
xlabel('Wave height (m)'); ylabel('Wind speed (m/s)');
% yes, there is some weak correlation there...

