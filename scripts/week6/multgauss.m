function [ yout ] = multgauss( beta,x )
%beta is amp, C, and sigma

%initialize vector of output values
yout=zeros(size(x));

if size(beta,2)~=3
    disp('Input matrix has incorrect number of columns.')
    return
else
    for i=1:size(beta,1)
        yout=yout+beta(i,1)*gaussmf(x,[beta(i,3) beta(i,2)]);
    end
end
end
