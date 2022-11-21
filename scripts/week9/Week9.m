% CE 640 / OC 512
% Week 9
% Mapping stuff...

% We often have a need to create visuals and perform quantitative analysis
% on data that is associated with geograpic (lat / lon) coordinates. That
% can sometime complicate our analysis. Therefore, it is important that we
% are fluent in working with data both in geographic and in projected
% coordinates. In today's class, we will explore numerous aspects of the
% Mapping toolbox.

%% Block 1.
% Let us begin simply.

clear all
close all
clc

figure(1)

latlim=[40 51];
lonlim=[-126 -115]; %set some limits
worldmap(latlim,lonlim);

%% 
%ok, so that is a bit boring. But, do note the axes...they are lat/long 
% and they are not 'straight.' Can we add something to see?

states = shaperead('usastatehi','UseGeoCoords',true);
prov=shaperead('prv_ca','UseGeoCoords',true);
h3=geoshow([states.Lat],[states.Lon],'Color','black','LineWidth',0.5);
h4=geoshow([prov.Lat],[prov.Lon],'Color','black','LineWidth',0.5);

%note that USA states are built into matlab. Canadian provinces, I had to
%go find as a separate shapefile. Poke around online and you can find most
%anything you want as a publicly available shapefile. Here is just one
%place you could go:
% https://library.carleton.ca/find/gis/geospatial-data/shapefiles-canada-united-states-and-world

%also, not the use here of geoshow and that LAT goes first, then LON...that
%is different order from most matlab plotting (x first, then y).

%also, note that the 'hi' in the 'usastatehi' refers to the resolution of
%the state boundaries. With very, very high resolution, these types of
%files can get extremely large. If you redo the code block above with
%'usastatelo' and zoom in on both that, and the high version, you can see
%the difference.

%%
%So, that's pretty cool. The 'worldmap' that we called sets up a map
%extent that is 'suitable' for the requested area. What happens if we
%choose a different area?

figure(2)
latlim=[25 85];
lonlim=[-175 -65];
worldmap(latlim,lonlim);  
states = shaperead('usastatehi','UseGeoCoords',true);
prov=shaperead('prv_ca','UseGeoCoords',true);
h3=geoshow([states.Lat],[states.Lon],'Color','black','LineWidth',0.5);
h4=geoshow([prov.Lat],[prov.Lon],'Color','black','LineWidth',0.5);

% why does it look that way? The geographic coordinate information (i.e., a
% piece of the sphere of earth) has been rendered using a particular
% projection. The default is Plate Carree, aka Equidistant Conic.

%%
%What happens if we don't use worldmap? Note that the 'states' variable is
%a structure with 51 entries (50 states + D.C.). Each entry in the
%structure has vectors of lat and lon. Let's loop over them and plot. Go
%back and review the notes (week 2) on structures if you forget how to
%access a particular entry.

figure(3)
for j=1:length(states)
    plot(states(j).Lon,states(j).Lat,'Color','black','LineWidth',0.5)
    hold on
end

%So, that works, but gives you are a rather unsatisfying result, in terms
%of distorted sizes, etc. Note that a degree of longitude is NOT constant
%(in terms of how many km) as you change latitude...but this way of
%plotting things forces it to be constant. Ugh.

%We can more or less do the same thing with mapshow. Be sure you understand
%the difference between mapshow and geoshow.

figure(4)
h3=mapshow([states.Lon],[states.Lat],'Color','black','LineWidth',0.5);
h4=mapshow([prov.Lon],[prov.Lat],'Color','black','LineWidth',0.5);

%% Tons of built-in Matlab stuff...
clear all
close all

%let's play around with some of the built in goodies that come with
%mapping...e.g., Let's go to europe (in this case the lon / lat limits are
%set by matlab to span the region of interest)
figure(1)
h = worldmap('Europe');

%let's look at the map structure
mstruct = getm(h)

%check out the projection (it is equidistant conic)
mstruct.mapprojection

%let's add some fun visual stuff...these are all built in sources of data
%in matlab.
figure(2)
h = worldmap('Europe');
geoshow('landareas.shp', 'FaceColor', [0.15 0.5 0.15])
geoshow('worldlakes.shp', 'FaceColor', 'cyan')
geoshow('worldrivers.shp', 'Color', 'blue')
geoshow('worldcities.shp', 'Marker', '.',...
'MarkerEdgeColor', 'red')

%let's place a label..
labelLat = 35;
labelLon = 14;
textm(labelLat, labelLon, 'Mediterranean Sea')
%note that 'textm' is needed and NOT 'text' to place the text. If you are
%'using a map' then if you wish to add points or a scatterplot, you have to
%use things like 'plotm' and 'scatterm' (the map analogs of the usual
%graphical functions you have learned to use). I 're-learn' this lesson
%often since I forget and get frustrated why things are not showing on my
%map!

%% What's up with Projections?
clear all
close all

%So, when you invoke 'worldmap' you are really creating a certain
%projection that will be used in displaying the data. The projection maps
%geographic coordinates to flat, projected coordinates that can be
%displayed on a 2-d image. You can also assign projections using the axesm
%command.

%what projections are available?
strmat = maps('namelist')
strmat = maps('idlist')
%note that the 'id' list is just the short, 'working version' name of the
%projection, the full name is given in the name list.

%Lets check this out a bit. In each of the following three cases I set the
%projection first with axesm, and then make a plot.

figure(1)
axesm miller
h = geoshow('landareas.shp');

figure(2)
axesm ortho
h = geoshow('landareas.shp');

figure(3)
axesm lambert
h = geoshow('landareas.shp');

%% How to plot other things in map axes!
clear all
close all

%ok, so we can create a map,and we can plot stuff on that map. In the first
%part of these notes, we clevely did that with geoshow. Geoshow is awesome. But, there
%are other ways.

figure(1)

latlim=[40 51];
lonlim=[-126 -115]; %set some limits
worldmap(latlim,lonlim); 

%let's plot state boundaries
states = shaperead('usastatehi','UseGeoCoords',true);
for j=1:length(states)
    plotm(states(j).Lat,states(j).Lon,'Color','black','LineWidth',0.5)
    hold on
end

%let's plot CA provincial boundaries
prov=shaperead('prv_ca','UseGeoCoords',true);
for j=1:length(prov)
    plotm(prov(j).Lat,prov(j).Lon,'Color','black','LineWidth',0.5)
    hold on
end

%So, as you can see, this basically did the same thing as before. NOTE: we
%used the plotm command, NOT the plot command. That is key. This is a 'map'
%plot, not a regular plot.

%What about basic point data? Here I will read in the lat/lon information
%about the locations of ski areas in OR and WA and add them to the plot
[num,txt,raw]=xlsread('or_wa_ski_areas.xlsx');
LAT=num(:,1); LON=num(:,2);
plotm(LAT,LON,'o');

%or, we can use scatterm. Remember, scatter is cool since you can color the
%symbols according to some value. Say, elevation, or whatever. BUT:
%remember...you use plotm and not plot and the lat comes first, then the
%lon...

%% Quantitative Analysis? 

%Ok, so many people are probably familiar with GIS tools in ARC, or QGIS,
%or something like that. Basically, tons of tools that can be run to query
%data in a certain area, do interesting things and so on. ARC is awesome in
%that way. Can we do similar sorts of things in Matlab? Sure, to some
%extent...

clear all
close all

%For example, what if we want to identify whether or not certain points are in a certain
%boundary? This can be a common task when working with geospatial data.
%Find all the homes in a certain city, or, in this case, find all of the
%ski areas that are in Oregon.

%first find the index of Oregon in the states structure that we encountered
%earlier. This is a bit tricky, but 'ismember' is a super cool function

states = shaperead('usastatehi','UseGeoCoords',true);
I=find(ismember({states.Name},'Oregon'));
disp(['Oregon is entry number ' num2str(I) ' in the states structure'])

% lets plot JUST Oregon, not all the states
figure(1)
latlim=[40 51];
lonlim=[-126 -115]; %set some limits
worldmap(latlim,lonlim); 

plotm(states(I).Lat,states(I).Lon,'k');
[num,txt,raw]=xlsread('or_wa_ski_areas.xlsx');
LAT=num(:,1); LON=num(:,2);
plotm(LAT,LON,'o'); 
%by the way, note that I have not used a 'hold' command. When you make
%plots in a map axis, you don't need to...

% use inpolygon to find only the points inside the state. Inpolygon is an
% amazing function to know of...
IN=inpolygon(LON,LAT,states(I).Lon,states(I).Lat);
plotm(LAT(IN),LON(IN),'r.')

%% How to measure things...
clear all
close all
clc 

%now what about calculations of things? Say distances or areas. Remember
%geo coords (lat, lon) are not very helpful in that regard. We have to
%PROJECT the data.

%So, one thing you CAN do, is you can actually project the data. This is
%different from what we have done so far. Sure, we created plots that were
%projected, but we sent into those plots lon / lat vectors...we did not
%actually 'project' the vectors to turn them into X and Y vectors.

%Now, we are not going to go too deep into this since it is a extensive topic. The
%FIRST thing you need to do is decide on a projection. Here in Oregon, UTM
%Zone 10 is a good projection. UTM is generally good for fairly small
%domains.

%To do this, we have to create a projection structure. For the general
%case, you would begin by using defaultm (creates a default structure and
%you can tailor it from there.

%UTM is super popular so there are lots of tools for this. We can actually
%use matlab to figure out our UTM zone (it is 10T).

states = shaperead('usastatehi','UseGeoCoords',true);
I=find(ismember({states.Name},'Oregon'));

%pull out just the OR boundary
lat=states(I).Lat; lon=states(I).Lon;

%figure out the UTM zone...note that I do this by taking the mean value of
%the lat and the lon points...
OR_UTM_ZONE=utmzone(nanmean(lat),nanmean(lon));
disp(['It looks like Oregon is in zone ' OR_UTM_ZONE])

%set up the projection structure
utmstruct=defaultm('utm')
%now we can make some changes to the structure...For example the default
%zone will NOT be the correct zone for Oregon. IIRC, it is the zone that
%lies at the prime meridian (31N)
utmstruct.zone=OR_UTM_ZONE;
utmstruct.geoid = wgs84Ellipsoid;   %don't worry much about this...
%now let us re-save the structure
utmstruct=defaultm(utmstruct); 

%read in ski areas
[num,txt,raw]=xlsread('or_wa_ski_areas.xlsx');
LAT=num(:,1); LON=num(:,2);

%With the projection set, we now do the transform with mfwdtran. This takes
%lat / lon values and converts them to meters, based upon the projection.
[ORx,ORy]=mfwdtran(utmstruct,lat,lon);
[skix,skiy]=mfwdtran(utmstruct,LAT,LON);

figure(1)
plot(ORx,ORy,'k');
hold on
plot(skix,skiy,'ro')
xlabel('Easting (m)'); ylabel('Northing (m)');
axis equal

%and, now that all of the data are projected and have x and y coordinates
%in meters, you can simply measure things, compute areas, and so on.

%note my use of axis equal. Axis equal makes no sense if you have things in
%lon and lat since those (degrees) are not equal except at the equator.
%Here, issuing this command with projected coordinates (in meters) will 
%give you a very nice and accurate picture of Oregon.

%Let's check on the area of Oregon. The polyarea function is a-MAY-zing.
OR_area=polyarea(ORx(1:end-1),ORy(1:end-1)); 
%note notation to avoid 1st and last points being the same

disp(['The area of Oregon in km^2 is ' num2str(OR_area/1000/1000)])
%I get a result of about 250,000 km^2

%% Can we measure stuff without having to project it first??
clear all
close all
clc

%ok. What if you want to directly measure things, using geographic coords?
%Luckily, Matlab recognizes that that is a common task and it has a bunch
%of great scripts in place to help you out. 

%Let's check on Oregon's area directly from the state boundary in
%geographic coords.

%We first have to specify the ellipsoid model of the earth. There are many!
%Otherwise, we will get an answer in terms of the % of the sphere, which is
%not what we want.

states = shaperead('usastatehi','UseGeoCoords',true);
I=find(ismember({states.Name},'Oregon'));

lat=states(I).Lat; lon=states(I).Lon;

E=referenceEllipsoid('wgs84');
OR_area_from_geo=areaint(lat(1:end-1),lon(1:end-1),E);
disp(['The area of Oregon in km^2 from areaint is ' num2str(OR_area_from_geo/1000/1000)])

%Note that this result is pretty spot on with what we found before!

%Linear distances can be computed using the distance function and then
%deg2km. The distance function computes distances along 'great circle arcs'
%connecting two points. 

%Let's test this by computing the distance (as the crow flies) between Mt
%Bachelor and Hoodoo.

[num,txt,raw]=xlsread('or_wa_ski_areas.xlsx');
LAT=num(:,1); LON=num(:,2);
I=find(ismember(txt(:,1),'Hoodoo'));
J=find(ismember(txt(:,1),'Mt. Bachelor'));
I=I-1; J=J-1; %adjustment due to header line

ski_distance=distance(LAT(I),LON(I),LAT(J),LON(J));
ski_dist_km=deg2km(ski_distance);
disp(['The distance between Bachelor and Hoodoo is ' num2str(ski_dist_km) ' km'])

%confirm this with google maps!!

%% How do I make prettier maps??
%Ok, the above is neat, but sometimes we are looking to make quick
%attractive maps. 

clear all
close all
figure(1)

latlim=[40 51];
lonlim=[-126 -115]; %set some limits  

%lets add some data...
[num,txt,raw]=xlsread('or_wa_ski_areas.xlsx');
LAT=num(:,1); LON=num(:,2);
geoscatter(LAT,LON,10,'Filled','MarkerEdgeColor','k')

geobasemap colorterrain
geolimits(latlim,lonlim);

figure(2)
geoscatter(LAT,LON,10,'Filled','MarkerEdgeColor','k')
geobasemap darkwater
geolimits(latlim,lonlim);

figure(3)
geoscatter(LAT,LON,10,'Filled','MarkerEdgeColor','k')
geobasemap grayterrain
geolimits(latlim,lonlim);

%There are various basemaps available. You MAY need to install them...

%% What about gridded data in geographic coords?
clear all
close all
clc

%So, we often wish to work with gridded 'raster' data. Think of weather
%data, land cover data, elevation data, most anything. These data come with
%different coverages, different spatial resolutions, etc. Sometime the
%spatial resolution is 1 km, sometimes it is 10 m (or less)! This can be a
%HUGE amount of data.

%In your work, you will sometimes house that data locally on your computer
%and do a lot of file management to work with it. Other times, you may wish
%to access only a subset of that data on the fly, so to speak. This can be
%an efficient way to go, since you only access, process, and visualize the
%data that you actually want.

%This gets very complicated very quickly. The WMS (web map service) in
%Matlab is sorta like Google Earth Engine. It is a door into a vast
%collection of datasets. We will just look at a brief example.

elevation = wmsfind('elevation');  %this returns hits to ANY dataset containing the word elevation.

gtopolayer = refine(elevation,'Foundation.GTOPO30', ...
    'SearchField','layername')  %refine this to a specific digital elevation model (Gtopo)

figure(1)
latlim=[25 85];
lonlim=[-175 -65];
ax = worldmap(latlim,lonlim);
mstruct = gcm;
oceanColor = [0 170 255];

[elevationImage, R] = wmsread(gtopolayer,'Latlim', ...
   mstruct.maplatlimit,'Lonlim',mstruct.maplonlimit, ...
   'BackgroundColor',oceanColor);

geoshow(elevationImage,R);
title({'Elevation'},'FontWeight','bold')

%One note about 'online access' of datasets. They change. New ones show up,
%old ones go away, some get relocated. This means that searches that find
%one particular dataset now may not work in the future. This is a constant
%challenge of working with online datasets.

%% GLOBE!
%I never get tired of the amazing things you can do...One cool thing is
%that you can plot and rotate a globe...and then you can add contours,
%vectors, and other things to it. 
% 
%NOTE: this requires the Climate Data Toolbox. You can get it from the File Exchange. Or, 
%click on 'Add-ons,' then 'get Add-ons,' then search for Climate Data 
%toolbox.
% 

clear all
close all
clc

% Let's load some sample data. This file is just some gridded weather
%re-analysis data...It is netcdf format, which we will cover in great
%detail in Week 10.
filename = 'ERA_Interim_2017.nc';

sp = ncread(filename,'sp');
T = ncread(filename,'t2m');
%next two things are wind fields (east-west and north-south)
u10 = ncread(filename,'u10');
v10 = ncread(filename,'v10');

lon = double(ncread(filename,'longitude'));
lat = double(ncread(filename,'latitude'));
% Turn lat,lon arrays into grids:
[Lat,Lon] = meshgrid(lat,lon);

% create a globe
figure(1)
globeimage

%rotate it around.
disp('any key to continue'); pause;

%add some wind vectors...then rotate it around again!
globequiver(Lat,Lon,mean(u10,3),mean(v10,3),1.5,'density',60)


%% Viewshed Example

clear all
close all

% this is one of the coolest things...you can compute, from a terrain
% model, what points you can see and what points you can not.

% use peaks as an example

Z = 500*peaks(100);
refvec = [1000 0 0];
[lat1,lon1,lat2,lon2] = deal(-0.027,0.05,-0.093,0.042);
     
[visgrid,visleg] = viewshed(Z,refvec,lat1,lon1,100);
[vis,visprofile,dist,zi,lattrk,lontrk] ...
   = los2(Z,refvec,lat1,lon1,lat2,lon2,100);

axesm('globe','geoid',earthRadius('meters'))
meshm(visgrid,visleg,size(Z),Z); 
axis tight
camposm(-10,-10,1e6)
camupm(0,0)
colormap(flipud(summer(2))) 
brighten(0.75)
shading interp 
camlight
h = lcolorbar({'obscured','visible'});
h.Position = [.875 .45 .02 .1];

plot3m(lattrk([1;end]),lontrk([1; end]), ...
   zi([1; end])+[100; 0],'r','linewidth',2)
plotm(lattrk(~visprofile),lontrk(~visprofile), ...
   zi(~visprofile),'r.','markersize',10)
plotm(lattrk(visprofile),lontrk(visprofile), ...
   zi(visprofile),'g.','markersize',10)




