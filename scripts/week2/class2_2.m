%% Subsetting Matrices
% Let's now try a much bigger matrix (note that I use a semi-colon to suppress 
% output of it). Remember we can think of columns as being individual variables 
% that have been measured / observed and rows as being individual sample times. 
% Now, say we want to extract only a few variables (columns); say 1, 15, 25, 
% and 40. Define a vector of column numbers to 'keep.' In looking at the size 
% of the reduced matrix, we see that we indeed managed to extract 4 complete 
% columns. You can do the exact same things in terms of extracting selected rows

A = rand(300,100);
size(A)
keep = [1 15 25 40]
A_keep = A(:,keep);  %again, the colon means all rows in the requested columns                    
size(A_keep)

%% Logical Indexing
% Remember that Matlab has 'boolean' functions that return a 0 or 1, depending 
% on if something is true or false. We can make use of this concept to extract 
% matrix elements depending on whether or not they satisfy some criterion. Let's 
% make up a matrix of numbers, again with columns representing variables and 
% rows representing sample or observation numbers. Now, let's say that we want 
% to look at only the samples (rows) in which variable (column) number 3 is 
% greater than 0.5. We can locate those rows with the find command. The I 
% variable contains those row numbers.

%Let's finally subset our matrix to keep only those rows (and we'll keep all c
% olumns in those rows), and we'll put that in a matrix called A_keep.

%A_keep2 and A_keep3 are the same result, found in somewhat more compact ways. 
% Note that in coming up with A_keep3, we don't even use the find command! Note 
% my printout of the tmp variable, which is simply a boolean vector.

clear
A = rand(10,5)
I=find(A(:,3)>0.5)  % notice this is a column vector
A_keep = A(I,:)
A_keep2=A(find(A(:,3)>0.5),:)

tmp=(A(:,3)>0.5)
A_keep3=A((A(:,3)>0.5),:)

%% Combining Booleans
% We can get fancier by combining multiple criteria. For example, let's keep 
% the rows where variable (column) 3 is greater than 0.3 and less than 0.7

A
keepVector = find(A(:,3) > 0.3 ...
   & A(:,3) <= .7)  
A_keep = A(keepVector,:)

%% Concatenation
% Concatenation is all about taking matrices as building blocks and putting 
% them together to make larger matrices. Let's start by creating three matrices 
% of different sizes.

%Let's try to concatenate them 'horizontally' --> this will work.

%Let's then try to concatenate them 'vertically' --> this will not work. 
% Understand why? The semi colon says 'new line' so this attempt would create 
% a matrix where the various rows would have different numbers of columns, 
% and that is not allowed.

clear all
data1 = rand(5,4)
data2 = rand(5,2)
data3 = rand(5,3)
allData_horiz = [data1 data2 data3]
allData_vert = [data1; data2; data3]
