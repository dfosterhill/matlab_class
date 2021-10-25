function [ yout ] = multgauss( x,beta )
%this goes along with week3solution.m
%beta matrix contains amp, C, and sigma

%intialize output vector
yout=zeros(size(x))

if size(beta,2)~=3
    Disp('Input matrix has incorrect number of columns.')
    return
else
    for i=1:size(beta,1)
        %update output vector (we are doing a running sum...)
        yout=yout+beta(i,1)*gaussmf(x,[beta(i,3) beta(i,2)]);
    end
end
end