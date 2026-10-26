% CE640 / OC 512
% Week 5 - Part 2
% animations.

close all
clear all
clc
N=100;  %number of frames;
theta=45; %launch angle
V=10;    %velocity in m/s
g=9.81; %gravity
u0=V*cosd(theta);
v0=V*sind(theta);
tend=2*v0/g;
t=linspace(0,tend,N);
x=u0*t;
y=-1/2*g*t.^2+v0*t;

for i=1:N
    figure(1)
    hold off
    plot(x(i),y(i),'ro','MarkerSize',10,'MarkerFaceColor','red')
    hold on
    axis([0 12 0 3])
    plot(x(1:i),y(1:i))
    M(i)=getframe(gcf);%(gcf);
end

disp('Let us try to playback the movie. Hit key to continue')
pause

figure(2)
movie(M)

disp('Ok, that was odd. We have to fiddle with the axes to')
disp('avoid having an axis inside an axis. Hit key to continue')
pause

figure(3)
axes('Position',[0 0 1 1]); %tricky to get playback axes just right....
movie(M);

close all

disp('Ok, that worked. But let me show you a better way. Hit key to continue')
pause

%save to file
writerObj = VideoWriter('projectile.avi');
open(writerObj);

for i=1:N
    figure(1)
    hold off
    plot(x(i),y(i),'ro','MarkerSize',10,'MarkerFaceColor','red')
    hold on
    axis([0 12 0 3])
    plot(x(1:i),y(1:i));
    frame=getframe(gcf);
    writeVideo(writerObj,frame);
end

close(writerObj);

%% Exporting your Graphic

% So, ok, say we have created a cool graphic. How do we best save / export
% it?

clear all
close all
clc

x=linspace(0,2*pi,100);
y=cos(x);
figure(1)
plot(x,y)
xlabel('x');ylabel('y');title('Line plot'); %as simple as it gets

% We could try to 'print this'

print -dpng -r72 testfigure.png

disp('Any key to continue')
pause

% When we do this, several things...first, the figure is a bit 'grainy' or
% 'pixelated' when we zoom in. Maybe try this:

print -dpng -r300 testfigure2.png

disp('Any key to continue')
pause

%Ok, so that is much better...when we zoom in on the figure, it has much
%better resolution.

%but, honestly, the size of the font seems a bit small compared to the
%figure size. We might wish things to be in a bit better proportion.

%We could deal with this by changing the font everywhere (labels, title,
%etc.). But, that is a pain.

%Instead, we could leave the font as is, and change the figure size!

set(gcf,'PaperPosition',[1 1 4 3])
print -dpng -r300 testfigure3.png











