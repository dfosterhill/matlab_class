function TF=cent2fahr_v4(TC)

%This function will convert temperature in centigrade to fahrenheit
%Created by D.F. Hill - Sep 2023

%TC - (input) temperature in centigrade
%TF - (output) temperature in Fahrenheit
global scale offset

TF=TC*scale+offset;
%I am going to intentionally sabotage the code here...
scale=NaN;
