function TF=cent2fahr_v4(TC)
%This function will convert temperature in centigrade to fahrenheit
%Created by NAME on DATE
%-
%TC - (input) temperature in centigrade
%TF - (output) temperature in Fahrenheit
global scale offset

TF=TC*scale+offset;
%I am going to intentionally sabotage the code here...
scale=NaN;