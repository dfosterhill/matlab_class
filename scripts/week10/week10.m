% CE 640 / OC 512
% Week 10
% data, data, data.....
% d.f. hill 
% updated 2020

clear all
close all
clc

%Ok, to sum up this academic term, we want to 'do stuff' with data in Matlab.
%Analyze, read, write, plot, you name it. As we near the end, let us
%briefly talk about 'common data formats' and also some neat tricks for
%accessing data from common sources.

%% Block 1
% First, data access. Yes, you can hunt down data sets one at a time, from
% various federal (most often) and state sources. Depending upon the
% agency, this is painful or (relatively) painless.

% With many agencies, there is a fairly friendly GUI for accessing limited
% sets of data. If you are interested in getting a LOT of data, it is often
% useful to find a back door and use FTP commands to retrieve the data.

%EXAMPLE - let us look at the NCDC climate normals. They can be found at: 
%ftp://ftp.ncdc.noaa.gov/pub/data/normals/1981-2010/

%You USED to be able to easily browse ftp sites with a web browser. For the
%most part that has gone away. So, the command below will do different
%things for different people, depending on your operating system and
%browser settings. For me, on my Mac, the command below opens up a dialog
%box. By choosing 'guest' at that dialog box, I am connecting via what is
%called 'anonymous ftp.' When I authenticate as a guest (no password
%required), I get a Finder (mac) window showing me the contents of the ftp
%site below. Nice. Now I can poke around and download files if I want.

%first, show the web interface
web('ftp://ftp.ncdc.noaa.gov/pub/data/normals/1981-2010/')

%% Block 1.1
%Ok, but doing that all manually is a bit of a pain. What if we wanted to
%download tons of files? Or, schedule (once a week, say) the download of
%updated files. We start by creating a FTP object.
ts=ftp('ftp.ncdc.noaa.gov');

%this basically just opens the door. Now we need to move around to the
%particular folder we want. Where are we? Try an ls (list) command

disp('Do a directory listing...what happens?')
ls
%% Block 1.2
%Huh. That just displayed our 'local' directory listing (ie., on our computer)
%How do we see a directory listing at the place we just connected to?

dir(ts)

%% Block 1.3
%great, that works. Now, we need to change directory into products, and do
%another listing once we are there

cd(ts,'pub/data/normals/1981-2010/products');
dir(ts)

%% Block 1.4
%you'll notice several folders to choose from. Let's try precip and then
%once again look at the listing

cd(ts,'precipitation')
dir(ts)

%% Block 1.5
%So, what is there is a bunch of data files. The particular structure, etc.
%of those files is not that important for this exercise. How do we get the
%data? Let's try the annual precip file. After running this, make sure that
%the file shows up in your folder on your local machine!

mget(ts,'ann-prcp-normal.txt');

%% Block 1.6
%note the use of the * wildcard below to get ALL of the files that start with ann
mget(ts,'ann*')

close(ts);

%% Block 1.7

%please look at webread and urlread for other examples for how Matlab can
%be used to access online data.

%% Block 2

% GUI (graphical user interface) awesomeness. So, this term we have mostly
% worked with .m files and .mlx files. It is completely possible to create
% 'interfaces' with buttons and file menus, and other bells and whistles in
% Matlab. These can be very nice to provide to people as a piece of
% 'software' that you want them to use. The notes here will walk you
% through one incredible package that is a portal to all kinds of climate
% and streamflow data. So, it combines the 'fetching' ability of FTP with a
% really nice GUI interface. 

% There is one excellent matlab package, developed by the Georgia Coastal
% Ecosystems LTER, that helps to automate the retrieval of data from common
% sources. It is at:

% http://gce-lter.marsci.uga.edu/public/im/tools/toolbox_download.htm
% NOTE: Updated as of 2019...go get the latest!

% 1. Unzip the provided file.
% 2. Enter main folder
% 3. type startup
% 4. Select Data Editor
% 5. File --> Import Data

% 6. Let us try USGS (www)
% 7. Select Oregon
% 8. Select Mary's River and click 'copy' button
% 9. Select Date Range. I chose 1/1/2012 until 12/1/2013.
% 10. Click proceed.
% 11. Adjust column list as desired. ***Click on the various columns. In
% the lower portion of dialog, note the things you can change, including a
% flag option.
% 12. Try tools / plotting / 2dline/symbol. After plot appears, explore
% menu options...tons of ways to customize and export.
% 13. Try file / export / text file.

% Close those windows and try again. Once data editor is open:
% 1. File / Import Data / NCDC
% 2. Select Corvallis State University
% 3. Set date range to be just 2013.
% 4. Explore plots and export as before!

%% Block 2.1

% Next,I would like to show you a much simpler GUI that I built. This was
% done several years ago, and it's not super pretty, but it gets the job
% done. Begin by opening up 'snotel_select.m'. 

% If you scroll through this, there is actually not much there. There IS
% the creation of a plot (using subplot).

% And, then on line 27, things start to happen. The two data files included
% with this have a lot of information about the locations of some 800 Snow
% Telemetry stations in the western USA. Then, for each station, there are
% like 40 years of snow data. Lines 27 through 37 set up two 'drop down'
% boxes for the user. The user must first select a state and then, based on
% that state selection, the second drop down box populates with the
% stations in that state!

% Lines 39 and 47 are possibly the most important, when it comes to
% understanding a GUI. The GUI 'listens' for actions taken by the user. For
% example, a selection in a drop down box. Then, based on that action, a
% function gets called. For example, if the user selects a state, the
% 'liststations' function is called, and it populates the station drop down
% box. If the 'select station' dropdown box is then used to pick a station,
% the 'process data' function is called. I apologize, this function is
% pretty complicated...it is doing a TON. It is going into the provided
% data file, extracting ALL the data for the chosen station and then making
% a pretty complicated plot to show the results.

% So, this collection of files gives you an 'under the hood' look at how a
% GUI operates in Matlab. Want to create your own? There are excellent
% tools in Matlab for this, and excellent tutorials. See:

% https://www.mathworks.com/videos/gui-building-in-matlab-97169.html

%% Block 3
% Next let us talk about netCDF. Visit here: http://www.unidata.ucar.edu/software/netcdf/
% Some key features:
% 1. Self-describing. netCDF file contains information about the data
% 2. Portable. Can be accessed by computers with different ways of storing
% numbers
% 3. Scalable. Small subsets of large data files can be easily accessed.
% 4. Appendable. Data can be added without having to copy / redefine data
% structure.
% 5. Sharable. Many people can access at same time

% netCDF was largely developed by UCAR. WIDELY used in atmospheric /
% oceanic communities.
clear all
close all
home

%use finfo to get basic information about a file
finfo=ncinfo('sample.nc')
disp(' ')
disp('This is high-level information on the file; key to continue'); pause;
home 

%We can look at the attributes of the data stored in the file
finfo.Attributes
disp(' ')
disp('This shows you the attributes of the file; key to continue'); pause;
home

%Each attribute can have a name
finfo.Attributes(1).Name
disp(' ')
disp('This shows you the name of the first attribute; key to continue'); pause
home

%Ok, well now we can look at the 'value' for this 'name.'
finfo.Attributes(1).Value
disp(' ')
disp('This shows you the value of the first attribute; key to continue'); pause
home 

%Attributes are like 'metadata'. Here, we look at the variables (data)
%themselves
finfo.Variables
disp(' ')
disp('This lists the variables in the file; key to continue'); pause
home

%Let's look at some of the data
disp('Name and size of first variable')
finfo.Variables(1).Name
finfo.Variables(1).Size  %num of lon values.
disp(' ')
disp('Name and size of last variable')
finfo.Variables(end).Name
finfo.Variables(end).Size %num of tos values (hourly values for one day).
%So, it is beginning to look like we have gridded data on a lon / lat grid.
pause
home

%lets access some data with ncread and plot it
lon=ncread('sample.nc','lon');
lat=ncread('sample.nc','lat');
tos=ncread('sample.nc','tos');
figure(1)
pcolor(lon,lat,tos(:,:,1)'); shading flat
colorbar
xlabel('Lon');ylabel('Lat');title('Surface Temp in Kelvin')

%pretty slick...everything you need re: this dataset is packaged up really
%nicely with full metadata and description. THAT is the way to curate your
%data.

%% BLOCK 3.1
%We can also create netCDF files in matlab. Regardless of whether you use
%netCDF or another file format, it is worth being careful about describing
%your data. This brings up the general topic of METADATA.

%Have a look at https://en.wikipedia.org/wiki/Metadata_standard

%There are many standards, depending on your field. And, things can get
%mighty confusing! A good place to start is here:
%https://www.usgs.gov/data-management/metadata-creation
%One decent standard is FGDC-CSDGM, which stands for 'Federal Geographic
%Data Committee' and 'Content Standard for Digital Geospatial Metadata'. At
%the link immediately above, you will find, among other things, tools for
%creating metadata files. 

%For example, you can go here:
%https://usgs.github.io/fort-pymdwizard/index.html and download a windows /
%mac version of software that will help you create metadata files. 

%You can also go here: https://www.mdeditor.org/ and use an 'online'
%tool for creating metadata files. Basically, you will be prompted to enter
%information about your dataset via a number of dialog boxes and it will
%produce a working metadata file for you.

%Next, it is not always the case that you will follow 'strict' metadata
%standards. Often times, creating a good 'readme' file will suffice. Please
%see http://data.research.cornell.edu/content/readme for a great overview.
%This can be a simple text file that you include with each data file that
%you create. If you work in ASCII files, you can write all the metadata
%into the header. With netCDF, it can be written into the 'attributes' of the
%file.

%Let's do a little experiment by creating some fake data and then writing
%it to a netCDF file.

clear all
clc

%these next two lines basically allow us to overwrite the file if it
%already exists. Generally, there are tight controls in place that prevent
%this type of overwriting. Which is a good thing!

ncid=netcdf.create('testfile.nc','CLOBBER');
netcdf.close(ncid);

days=[1:365]';  %days of year, 2016
data=randn(365,1);  %fake data, who cares

nccreate('testfile.nc','time','Dimensions',{'t',length(days)});
ncwrite('testfile.nc','time',days);

nccreate('testfile.nc','temp','Dimensions',{'t',length(data)});
ncwrite('testfile.nc','temp',data);

%lets write in some attributes about the variables
ncwriteatt('testfile.nc','time','long_name','Julian Days');
ncwriteatt('testfile.nc','time','units','Days since 1 Jan 2016');
ncwriteatt('testfile.nc','temp','long_name','Temperature');
ncwriteatt('testfile.nc','temp','units','deg C');

%lets write in some global attributes
ncwriteatt('testfile.nc','/','creation_date',datestr(now));
ncwriteatt('testfile.nc','/','creator','David Hill');
ncwriteatt('testfile.nc','/','description','Temperature data at Corvallis, Oregon');

disp('We have now written our file.')

%%
%That's it. The file has now been written! Don't belive it? Let's check.

clear all

%You can use the ncdisp command to show the metadata
home
ncdisp('testfile.nc')

%%
%You can use the ncinfo command to access information. For example

finfo=ncinfo('testfile.nc');
variablename1=finfo.Variables(1).Name
variablename2=finfo.Variables(2).Name
numpoints=finfo.Variables(1).Size

%%
%You can now use ncread to access the data that we wrote into the file
TIME=ncread('testfile.nc',variablename1);
TEMP=ncread('testfile.nc',variablename2);
figure(1)
plot(TIME,TEMP,'o');xlabel('Time (days) since 1 Jan 2016');
ylabel('Temp in deg C');

%so...the bottom line is this...it takes time and effort to write good data
%files. It is suuuuper tempting to neglect this aspect of your scientific
%work. In the short-term, it might work out ok for you, in terms of
%producing results and figure quickly. In the long-term, you will massively
%regret it. So, budget your time and ensure that you write good, well
%documented data files. The same goes for good, well documented codes.





