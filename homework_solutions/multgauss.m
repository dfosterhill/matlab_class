function [ yout ] = multgauss( x,beta )
%this goes along with week3solution.m
%beta matrix contains amp, C, and sigma in columns

%intialize output vector
yout=zeros(size(x));

%perform simple error checking; break if not the correct (3) number of columns
if size(beta,2)~=3
    disp('Input matrix has incorrect number of columns.')
    yout=yout*NaN; %do this to flag as incorrect output.
    return
else
    %loop over the number of rows
    for i=1:size(beta,1)
        %update output vector (we are doing a running sum...)
        yout=yout+beta(i,1)*gaussmf(x,[beta(i,3) beta(i,2)]);
    end
end
end