%this script allows user to select state, then station, then plot
%climatologies of snotel data.

%July 2018
%David Hill
%dfh@oregonstate.edu

clear all
close all
clc
fclose('all')

%name of file with snotel station info
fname1='snotelstationinfo.mat';
fname2='snotelstationdata.mat';

load(fname1);  %loads a structure called station
load(fname2);   %loads a structure called snoteldata

fh=figure(1)
h1=subplot('position',[0.1 0.5 0.4 0.3]);
h2=subplot('position',[0.58 0.5 0.4 0.3]);
h3=subplot('position',[0.1 0.1 0.4 0.3]);
h4=subplot('position',[0.58 0.1 0.4 0.3]);
plothandles=[h1 h2 h3 h4];

statelist=unique(station.state);
hb=uicontrol('style','popupmenu')
set(hb,'Units','normalized')
set(hb,'Position',[0.1 0.9 0.2 0.05])
set(hb,'String',statelist);

hb2=uicontrol('style','popupmenu')
set(hb2,'Units','normalized')
set(hb2,'Position',[0.3 0.9 0.2 0.05])
set(hb2,'String','n/a');
set(hb2,'Visible','on');

set(hb,'CallBack',{@liststations, station, hb2})

lb1=uicontrol('style','text');
set(lb1,'Units','normalized')
set(lb1,'Position',[0.1 0.95 0.2 0.05])
set(lb1,'String','Select State');

%set(hb2,'String',statelist);
set(hb2,'CallBack',{@processdata, station, snoteldata, plothandles})

lb2=uicontrol('style','text');
set(lb2,'Units','normalized')
set(lb2,'Position',[0.3 0.95 0.2 0.05])
set(lb2,'String','Select Station');








