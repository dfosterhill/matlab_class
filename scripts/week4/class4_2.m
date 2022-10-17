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

%% FPRINTF - take 1
% fprintf gives you AMAZING control over output. Create a 'test' array

home
disp('fprintf case 1')
A=randn(10,3)
fid=fopen('dataout1.txt','w');
fprintf(fid,'%f',A);
fclose(fid);                 %what a mess. Note the fclose!

%% FPRINTF - take 2
% Ok, we have to clean that up...let us try using format specifiers, just
% like we did with file input

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
fprintf(fid,'%8.4f%8.4f%8.4f\n',A');
fclose(fid);                 
% What is the 8.4?? A total of 8 columns, with 4 decimal places. The other 
% spaces are for the period, possibly a negative sign, a digit in the ones
% place and a leading space. You have to carefully think through your 
% 'field widths' when you are creating specifiers. 

%% FPRINTF - take 5
% Let's make a mistake on purpose...see what happens?

home
B=100*A % I am making the 'width' of my numbers larger now!
disp('fprintf case 5')
fid=fopen('dataout5.txt','w');
fprintf(fid,'%8.4f%8.4f%8.4f\n',B');
fclose(fid)     %does this work? NOPE. Why not?

%% FPRINTF - Class Exercise.

C=10*A

%Redo my work above (take 4) and figure out the  format string so that 
%the output file of C looks JUST like screen display (number of decimal 
%places, etc.)

%Good Luck!

%%
%Be sure to go check out the help menu for 'writetable' if you like the
%look of tables...




