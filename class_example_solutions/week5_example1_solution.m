% Week 5 - Example 1 - Solution

clear all
close all
home

x=linspace(0,2*pi,100);
y1=sin(x); %this is my basic sin wave.

%pick random number between -1 and 1 (uniform distribution)
threshold = -1 + 2 * rand(1);

y2=y1;
y2(y2<threshold) = NaN; %here, we mask out values below the threshold. 
%Anything that remains we will plot as red.

y3=y1;
y3(y3>threshold) = NaN; %here, we mask out values above the threshold. 
%Anything that remains we will plot as green.

%make plot
figure(1)
plot(x,y1,'b.'); %I use dots so that we can distinguish the three plots more easily.
hold on
plot(x,y2,'r');
plot(x,y3,'g');

%add horizontal line
plot([0 2*pi],[threshold threshold],'b')

%add legend
h3=legend('Full Wave','Portion above threshold','Portion below threshold','Threshold value');
h3.FontName='Arial'; h3.FontSize=16;
h=xlabel('x'); h.FontName='Arial'; h.FontSize=16;
h2=ylabel('y'); h2.FontName='Arial'; h2.FontSize=16;


