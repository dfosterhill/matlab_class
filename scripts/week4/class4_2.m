% Week 4 - Part 2 
% File Output
% David Hill - Oregon State University

% Ok, so you've read in some data...you've done some stuff to it...now, can
% we write out that data so that someone else (lab mate; adviser; etc.) can
% do something useful with it?

%% One way to save data:
% We can always just use the save command. This stores the variables in a
% binary .mat file.
clear all
home
disp('basic save case')
x=1:1:1e6;
save simpledata.mat x   %note the size of this binary file is some 1.4 MB

%% Ok, but proprietary binary files are not very inclusive
% Is there some way to share data with people who don't have access to
% matlab? ASCII text is a great way to go.

home
disp('save ascii case')
save simpledata.txt x -ascii  %some 16 MB. Ouch. Open up file for a look.
%several things. Ugh, why a row?! And, Ugh, why all the digits?! This is
%clearly a waste. You can easily make it a column by using x' and not x
%(remember the way we created x created a row vector). Writing out a 
%column makes the file look more intuitive, but it is still a huge waste of
%memory for simple integers.

%% Too many options??
%This is where things get a bit overwhelming. There are options like
%dlmwrite, csvwrite, and others. When you look at the help entries for many
%of these, you will see things like 'not recommended.' Rather than us
%covering ALL of these options, I'd rather focus on just three.

%% FPRINTF - take 1
% fprintf gives you AMAZING control over output. It is very powerful, but
% it can be tricky to learn to use, just like fscanf was. Below, we are
% going to step through some of the basics in a sequential way...

% To start, create a 'test' array

home
disp('fprintf case 1')
A=randn(10,3)
fid=fopen('dataout1.txt','w'); %the 'w' tells Matlab we will write to this file
fprintf(fid,'%f',A); %the '%f' is a floating point format string
fclose(fid);                 %what a mess. Note the fclose!

%% FPRINTF - take 2
% Ok, we have to clean that up...let us try using format specifiers, just
% like we did with file input. In the code below, I am trying to get three
% numbers 'per line' and then use the newline character \n to start a new
% line.

home
A
disp('fprintf case 2')
fid=fopen('dataout2.txt','w');
fprintf(fid,'%f %f %f\n',A);
fclose(fid);  %better, but array is transposed. Why?? Because matlab operates down
%columns first, but data files get written out by rows!! The net effect is
%that the transpose of what we want gets written out.

%% FPRINTF - take 3

home
A
disp('fprintf case 3')
fid=fopen('dataout3.txt','w');
fprintf(fid,'%f %f %f\n',A'); %the key difference here is the A' not A. We
%force matalab to read across the rows first, and that is how files get
%written, so that works out perfectly.
fclose(fid);                 %Ok, that will do. Can we make it look nicer? 
%Line up columns, etc.

%% FPRINTF - take 4
% It is VERY nice to have columns line up neatly. That makes looking at a
% file much 'easier on the eyes' and everyone will appreciate it. So, let
% us be more 'specific' with our format specifiers.

home
A
disp('fprintf case 4')
fid=fopen('dataout4.txt','w');
fprintf(fid,'%8.2f%8.2f%8.2f\n',A');
fclose(fid);                 
% What is the 8.4?? A total of 8 columns, with 4 decimal places. The other 
% spaces are for the period, possibly a negative sign, a digit in the ones
% place and a leading space. You have to carefully think through your 
% 'field widths' when you are creating specifiers. 

%% WriteMatrix
%Now, writematrix is a pretty powerful way for you to write out a
%homogeneous (no mixed format allowed) array to a variety of file formats
%(text, csv, spreadsheet, and more). So, it's really good to known about. 

%basic usage:
writematrix(A,'dataout5.txt')
%this ends up creating a csv file with loooooong numbers and no spaces.

writematrix(A,'dataout6.txt','Delimiter','\t')
%this version uses tab delimeters, but still ends up with long numbers.

writematrix(round(A,4),'dataout7.txt','Delimiter','\t')
%this is a bit of a work-around to give you some control over the output
%numbers...if you want full control, then I suggest you stick with the very
%flexibil FPRINTF approach.

%% WriteTable
%Ok, so writematrix is pretty nice, but will ONLY work on homogeneous
%(e.g., all floating point numbers, all integers, etc.) matrices. Tables
%are powerful since they can contain a rich variety of different data
%types. Tables are kinda like 'dataframes' if you are familiar with Python.

%Let us construct a simple table...be sure to inspect it in the command
%window.
LastName = {'Smith';'Johnson';'Williams';'Jones';'Brown'};
Age = [38;43;38;40;49];
Height = [71;69;64;67;64];
Weight = [176;163;131;133;119];
BloodPressure = [124 93; 109 77; 125 83; 117 75; 122 80];

T = table(Age,Height,Weight,BloodPressure,...
    'RowNames',LastName)

%We can immediately write this out with:
writetable(T,'dataout8.txt','WriteRowNames',true) 
%note that you can change the delimiter and do other useful things...




