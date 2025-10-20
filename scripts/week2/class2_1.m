%% Week 2 Part 1 - Matlab Class
%% Dave Hill
% In this script, we will look at the ways in which we can store information 
% in Matlab...namely elements, vectors, matrices, and so on.

clear all
close all
clc

%% Single vs. Double Precision
% We are going to begin by talking about variables and variable types. Let us 
% start by looking at a single variable

a = exp(1)
b = single(a)
whos

% Note, during the 'whos' command, that it is shown as double. What does this 
% mean? What is single precision? A single precision floating point number uses 
% 32 bits. Double precision? Uses 64 bits. Many more decimal digits. So, why not 
% use double for everything? Slower. And, in terms of saving data more storage required.
% BUT...storage is cheap. So, it is good to stick to double.

%% Integers
% There are also many kinds of integers, in addition to floating point numbers

home
int8(255)       %runs from -128 to 127
uint8(255)      %runs from 0 to 255 
uint8(-255)     %runs from 0 to 255

% So, what happened there? 2^8 is equal to 256. So, an eight bit integer has 
% 256 possible values, which run from 0 to 255 in the 'unsigned' (always positive) 
% case and -128 to 127 in the 'signed' (+ / -) case.

% When is an integer not an integer?? By default, Matlab thinks everything 
% is double precision. Thus the 'isinteger' function operating on t yields 0. 
% This is a 'boolean' function (either 1 for true or 0 for false). We FORCE t 
% to be an integer with the int8 function, which is why 'isinteger' returns 
% 'true' (value of 1) for t2.

home
t=1
isinteger(t)
t2=int8(t)
isinteger(t2)

%% Matrix Basics

clear all
home

% Matrices (and vectors...which are essentiall 1-d matrices) are the bread 
% and butter of matlab or any other programming language. Below I use the 
% 'rand' function to create a matrix of random numbers. If we think of this 
% as an observational data matrix (from an experiment), we could think about 
% the columns representing various variables that we observe and the rows 
% as being different observation times (or samples). We can get the number 
% of samples and variables from the 'size' command. Note that, in Matlab, 
% the first dimension is 'rows' and the second dimension is 'columns'.

A = rand(5,3)
size(A)
numberSamples = size(A,1) %1 - rows
numberVariables = size(A,2) %2 - columns
[numberSamples numberVariables] = size(A)

%% Indexing / Addressing
% So, matrices / vectors contain numeric data. Great. It is essential that 
% we know how to access the information in a particular location. For example, 
% we might wish to access the value in the bottom right corner. Since we 
% just determined the size of the matrix, we can use thoseA variables to get 
% the bottom right...Or, we can use the 'end' command, which is clever and helpful.

bottomright = A(numberSamples, numberVariables)   %This is a way of getting the bottom right corner
bottomright = A(end,end)  %this is another way of getting the bottom right corner

%% The Power of Punctuation
% In matlab, commas, periods, semi-colons, and colons do so many different 
% things. First of all, if you have not yet noticed, a semi-colon at the end 
% of a line will 'suppress' output. That is often a very good thing. Do NOT 
% write codes that just stream a bunch of un-needed stuff to the screen. It's 
% annoying and poor practice. Ok...well in the context of matrices the colon 
% is very important. In this context it means 'all.' So, we can use the colon 
% to grab 'all' elements in a given row or column. For example, let us grab 
% the last column and then the last row using this. In addition, allow me to 
% show you one of the most common errors in matlab (see the third example below).

A(:,end) 
A(end,:) 
A(6,:)

% In this last example, the error is an 'out of bounds error.' We are trying 
% to access the 6th row of the matrix, but the matrix only has 5, so we are out of luck...

%% Switching Between Indices and Subscripts
% So, the general way of accessing a value in a matrix is through subscripts. 
% For example A(1,2) will give us the value in the first row, second column. 
% But, Matlab can also access information in a matrix using a single number, 
% called the index. In the example below, I get the same result. How? 
% Well...matlab likes to count things by columns first. So, in this example, 
% to get to the 6th element of the 2-d matrix, matlab counts down the first 
% column and, if necessary, will move onto the next column, and the next....
% So the 6th element is found at the top of the second column!

A
A(1,2)
A(6)

% The sub2ind and ind2sub functions are useful ways of switching back and forth 
% between these two different ways of addressing matrix elements. Let's look at 
% the 12th element of A. And, say we want to know the row / column subscript 
% values of the 12th element

A
A(12)
[r c] = ind2sub(size(A),12) %r c are the row / column corresponding to element 12.

%%
% BREAK - In-class exercise. (10 min)
% You can make 3-d (or higher) matrices in Matlab. Think of a 'cube' of
% data made up of a series of checker-boards or grids stacked up on top of
% each other. From an environmental data point of view, you could have
% gridded temperature data on a daily basis. Here the latitude and longitude values are the
% 'row' and the 'column' values. And then the 'time' would be the third
% dimension of your data cube.

% Please create the three dimensional matrix A that has this as the first
% 'time slice.' Do this by creating a new file in the editor.
% A(:, :, 1) = | 4   2 |
%              | 3   1 |

% This as the second 'time slice'
% A(:, :, 2) = | 6   7 |
%              | 5   8 |

% And this as the third 'time slice'
% A(:, :, 3) = | 12   9 |
%              | 11  10 |

% Experiment with using the 'sum' command on this matrix. Can you sum over
% all three dimensions? Check your math to convince yourself.

% Experiment with the difference between addressing with indices vs
% subscripts. For example, how do you 'access' the information stored in
% the location where the '9' is. Can you do this with subscripts? How many
% subscripts do you need? Can you do this with an index? Look at the help
% menu for ind2sub and see if your script can print out the subscripts and
% also the value of the number located at the 11th location (index) of this
% 3-d matrix.
              

