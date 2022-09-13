%oc512 /ce640

%This script loads all '.asc' files in the folder it resides in 
%and generates a texturemap of the sum of gridded data in the folder 
%(total annual precipitation). Additionally the script creates a short 
%animation which cycles through texture maps produced from each file in the 
% folder (monthly precipitation).
clear all
close all
home
%Reading all files in current folder into matlab and organizing data into
%easier formats for generating plots and videos. This includes creating 
%datenum for the month corresponding to each data file using information 
%in file names.
data = zeros(229,407,12);
var=dir('*.asc'); 
num_names = zeros(12,1);
for n = 1:length(var)
    [Z,R] = arcgridread(var(n).name); 
    names = var(n).name;
    num_names(n,:) = str2num(names(1,16:1:17));
    data(:,:,n) = Z;
end

%note; the above takes advantage of the builtin 'arcrgridread'. That is
%totally optional. Other approach is to read in the data via textscan or
%fscanf. If you do that, you use the info from the first 6 lines to create
%the meshes for plotting!

month_num = datenum(num2str(num_names),'mm');
month_str = datestr(month_num,'mmmm');
annual  = sum(data,3);

%Main product #1: Figure depecting annual total precipitation over the
%domain described by the files that were read in above.
figure (1)
hold on
mapshow(annual,R,'DisplayType','texturemap')
mapshow(annual,R,'DisplayType','contour','lineColor','black',...
        'LevelStep',1000)
c = colorbar;
c.Label.String = 'Total Annual Precipitation (mm)';
caxis([300,3000])
set(c, 'ylim', [0 1000]);
xlabel('Longitude')
ylabel('Latitude')
title('Total Annual Oregon Precipitation')

%Main Product #2: Generating video file containing an animation which
%cycles through grided monthly precipitation.
writerObj = VideoWriter('monthly_precip.avi');
writerObj.FrameRate = 0.5;
open(writerObj);

N = 12;
for n=1:N
    figure(2)
    hold off
    mapshow(data(:,:,n),R,'DisplayType','texturemap')
    hold on
    mapshow(data(:,:,n),R,'DisplayType','contour','lineColor','black',...
            'LevelStep',100)
    c = colorbar;
    c.Label.String = 'Total Monthly Precipitation (mm)';
    caxis([0,350])
    xlabel('Longitude')
    ylabel('Latitude')
    title(['Total Oregon Precipitation in ' month_str(n,:)]) 
    frame=getframe(gcf);
    writeVideo(writerObj,frame);
end

close(writerObj);

