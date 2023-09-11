% Week 3 - Example 1 - Solution

clear all
home

%create a loop
for j = 1:20 %20 iterations
    number=randn(1);    %the (1) is used to just create a single number
    if number<0
        disp(['The number ' num2str(number) ' is negative'])
    else
        disp(['The number ' num2str(number) ' is positive'])
    end
end

