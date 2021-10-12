%Week 3 Part 2 - Matlab Class
%Dave Hill

%This will look at flow control and programming goodies...

clear all
close all
home

%% BLOCK 3.1

%let us start with for loops. A for loop allows a piece of code to
%repeatedly executed. A for loop is distinguished by a 'loop counter'
%variable. A for loop is typically used when the number of iterations is
%known PRIOR to going into the loop. The general structure is:

% for [loop variable] = [range]
%    [stuff happens here]
% end

%an example
clear all
close all
home

for n=1:100
    x(n)=sin(n*pi/10);
end
figure(1)
plot(x)
title('simple plot created with for loop')

disp('Any key to continue')
pause
clc

%try this (caution!)

for n=1:100
    x=sin(n*pi/10);
end
figure(2)
plot(x)     %what happened here?
title('Can you find the error?')
disp('Any key to continue')
pause
clc
 
%what if loop is empty?

for n=1:100
end

disp(' Did anything useful happen? Any key to continue')
pause
clc

%you can 'nest' loops (as many as you want, but be careful!)
%make a gaussian 'bump' and plot it.

tic
for x=1:11
    for y=1:11
        z(x,y)=exp(-((x-6)/4)^2-((y-6)/4)^2);
    end
end
figure(3)
pcolor(z);
shading flat
toc

disp('Any key to continue')
pause
clc

%ok that was pretty fast, but 'coarse'. Try:

clear all
tic
for x=1:1100
    for y=1:1100
        z(x,y)=exp(-((x-600)/400)^2-((y-600)/400)^2);
    end
end
figure(4)
pcolor(z); shading flat
toc

%fair bit slower!! So, nested for loops can be very
%inefficient as they become large.

disp('Any key to continue')
pause
clc

%Notes. The 'loop variable' does not need to run from 1 to N in increments
%of 1. That IS the default, if write something like for n = 1:N. You can
%have things count backwards:

for n=100:-1:1
    x(n)=sin(n*pi/10);
end
figure(5)
plot(x)
title('Counting backwards')

%you can also 'count' by fractions of an integer. For example

for n=1:.1:100
    x(n)=sin(n*pi/10);
end


%% BLOCK 3.1.1
%Ok, so what went wrong above?? --> can NOT have a decimal number as an
%index...

%If, for some reason, you MUST count by some interval or over some range
%(negative integers) that will give you problems in terms of a subscript,
%you can bring in a placholder counter variable.
clc
counter=0; 
for n = 0: 0.1: 10 
	counter = counter + 1;
	x(counter) = sin(n*pi);
end
figure
plot(x)

%% Block 3.2

%Next, let us consider while loops. These are similar to for loops in that
%the general idea is to repeatedly execute some piece of code. However, the
%key difference is that, where a for loop uses a finite 'counter' to
%iterate through the code, a while loop uses some boolean (true or false)
%condition to determine whether or not to carry out another iteration. The
%general format is:

%while true
%   [do stuff]
%end

%Here is a simple example
close all
clear all
clc

n=1;
while n<10
    disp(['n = ' num2str(n)])
    n=n+1;
end

disp('Any key to continue')
pause

%A potential problem with while loops is that you might get in a situation
%where the boolean argument is NEVER false and you are stuck in an infinite
%loop. For example, if you forget to 'increment' the counter. Try:

n=1;
while n<10
    disp(['n = ' num2str(n)])
end

%you will need to 'ctl-c' to kill the infinite loop.
%% BLOCK 3.2.1

%you can safeguard against this with a break command. Note that the example
%below uses an 'if' loop which we have not discussed yet, so sit tight on
%that until later.

n=1;
num_iterations=0;
while n<10
    disp(['n = ' num2str(num_iterations)])
    if num_iterations>25
        disp(['terminated at ' num2str(num_iterations) ' iterations'])
        break
    end
    num_iterations=num_iterations+1;
end

%% BLOCK 3.3

%Third, let us consider 'if' statments. These are not 'loops' in the sense
%that code does not get repeated. Rather, an if statement uses a boolean
%condition to decide whether or not to execute a certain piece of code. At
%its simplest, it looks like

%if true
%   [do stuff]
%end

clear all
close all
clc

f=6
%check if f is even
if mod(f,2)==0
    disp('f is even')
end

disp('Any key to continue')
pause

%so, if a certain condition is satisfied, then some code is executed. If
%not, then NOTHING is done. A slight variation is

%if true
%   [do stuff]
%else
%   [do other stuff]
%end

f=5
%check if f is even
if mod(f,2)==0
    disp('f is even')
else
    disp('f is odd')
end

disp('Any key to continue')
pause

%so, in this case, if the boolean condition is not satisfied, rather than
%NOTHING happening, something ELSE happens. Yet another variation is

%if true
%   [do stuff]
%elseif true
%   [do other stuff]
%else 
%   [do other other stuff]
%end

f=0
%check if f greater than zero, less than zero, or zero
if f>0
    disp('f is positive')
elseif f<0
    disp('f is negative')
else
    disp('looks like f is zero')
end

%% BLOCK 3.4

%Finally, let us look at the 'switch' command. This is really just like a
%series of if / elseif commands. In many cases, using switch results in
%cleaner, more compact code. Here is an example
close all
clear all
clc

val=3;
switch val
    case 1
        disp('one')
    case 2
        disp('two')
    case 3
        disp('three')
    otherwise
        disp('something else')
end


