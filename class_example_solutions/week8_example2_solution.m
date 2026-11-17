%week 8 - example 2

clear all
close all
clc

%load file

[y,fs]=audioread(['../scripts/week8/recording.m4a']);

%play file
disp('Hit return to play original file')
pause
soundsc(y,fs);

%add noise to file
y2=y+rand(size(y))*.2-0.1;

%play file
disp('Hit return to play distorted file')
pause
soundsc(y2,fs);

%try to smooth
y3=smooth(y2,5);

%play file
disp('Hit return to play slightly smoothed file')
pause
soundsc(y3,fs);

%try to smooth a LOT
y4=smooth(y2,100);

%play file
disp('Hit return to play heavily smoothed file')
pause
soundsc(y4,fs);

%try to smooth 'just right'
y5=smooth(y2,40);

%play file
disp('Hit return to play moderately smoothed file')
pause
soundsc(y5,fs);
