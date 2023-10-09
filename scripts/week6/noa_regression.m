%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code performs multiple linear regression analysis on a set of basin
% characteristics pulled from an excel file called
% USGS_merged_flow_trimmed.xlsx in the same folder as this m-file
% (S:\shared\GOA_Runoff\Streamflow\Analysis\USGS).
% 
% The difference between this code and previous attempts at multiple linear
% regression is that this considers power law:
% 
%          Q = A*(x1^a1)*(x2^a2)*...
%   log10(Q) = log10(A) + a1*log10(x1) + a2*log10(x2) + ...
%

clear all
close all

%this reads in the monthly mean flow data from sheet 4 of the excel file.
[numf,txtf,rawf]=xlsread('USGS_merged_flow_trimmed.xlsx',4,'C4:CC15');

%this reads in the monthly mean precipitation data
[nump,txtp,rawp]=xlsread('USGS_merged_flow_trimmed.xlsx',5,'C4:CC15');

%this reads in the basin characteristics
[numc,txtc,rawc]=xlsread('USGS_merged_flow_trimmed.xlsx',6,'C4:CC15');


% flow and precip parameters
flow = numf;
logflow = log10(numf);
logprecip = log10(nump);

% Basin characteristics
logarea = log10(numc(2,:));
logslope = log10(numc(3,:));
loglength = log10(numc(4,:));
logelev = log10(numc(5,:));
loglake = log10(numc(6,:)+1);          % for parameters that are represented
logforest = log10(numc(7,:)+1);        % as percents, we add 1 in the log
logglacier = log10(numc(8,:)+1);       % function, to ensure all positive values
loglat = log10(numc(9,:));
loglong = log10(numc(10,:));
logsnofall = log10(numc(11,:));
logjanmin = log10(numc(12,:)+18);      % this makes sure temperature is positive***

% ***these correction factors are applied as per USGS report by Wiley and
% Curran (2003) - Water-Resources Investigations Report 03-4114.

% Define the parameters to be evaluated, starting with precipitation

a1 = zeros(12,max(size(nump)));

for p=1:12
    a1(p,:) = (logprecip(p,:));
end

a1 = a1';

a2 = logarea';
a3 = logslope';
a4 = loglength';
a5 = logelev';
a6 = loglake';
a7 = logforest';
a8 = logglacier';
a9 = loglat';
a10= loglong';
a11= logsnofall';
a12= logjanmin';

% Put the output in column form
y = logflow';

% Put all parameters into a matrix with a column of 1's first. Rows of this
% matrix correspond to different watersheds, columns to different
% explanatory variables, the third dimension to month (1-12).
for n = 1:12
    basin_char(:,:,n) = [ones(max(size(a1)),1), a1(:,n), a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12];
end
% Matlab's regression function
b = zeros(13,12);

for n = 1:12 %do different regression for each month of year.
    b(:,n) = regress(y(:,n),basin_char(:,:,n));
end


% Now, to plot the results, we need to compare the actual flow with the 
% flow calculated via regression analysis, where y is our actual flow.
% 
% To compute analysis-derived flows we must go back to our original 
% equation:
%          Q = A*(x1^a1)*(x2^a2)*...
% In this case we have 12 parameters and the coefficients in the b vector
% correspond to the "a" terms.

z = linspace(1,1E6);   % To create 1:1 line

 loglog(z,z)
 hold on

for m = 1:12
    for ii = 1:max(size((logflow)))
        calculated_flow(m,ii) = (10^(b(1,m)))*(nump(m,ii)^(b(2,m)))*...
            (numc(2,ii)^(b(3,m)))*(numc(3,ii)^(b(4,m)))*(numc(4,ii)^(b(5,m)))*...
            (numc(5,ii)^(b(6,m)))*((numc(6,ii)+1)^(b(7,m)))*...
            ((numc(7,ii)+1)^(b(8,m)))*((numc(8,ii)+1)^(b(9,m)))*...
            (numc(9,ii)^(b(10,m)))*(numc(10,ii)^(b(11,m)))*...
            (numc(11,ii)^(b(12,m)))*((numc(12,ii)+18)^(b(13,m)));
    end

    % This plots the data on log-log axes
    scatter(flow(m,:),calculated_flow(m,:),'o')
    title('Multiple Linear Regression')
    xlabel('reported flow')
    ylabel('calculated flow')
    hold on
end

legend('Unity','January','February','March','April','May','June','July'...
    ,'August','September','October','November','December','Location','Northwest');
hold off


%see things like stepwiselm, fitlm, and so on. Huge, huge topic in Matlab!

%Also be aware that regress will spit out all sorts of performance
%statistics that are important to understand.