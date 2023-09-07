function TF=cent2fahr_v3(TC,scale,offset)

%This function will convert temperature in centigrade to fahrenheit
%Created by D.F. Hill - Sep, 2023
%-
%TC - (input) temperature in centigrade
%TF - (output) temperature in Fahrenheit

TF=TC*scale+offset;
