%% Subsetting Matrices
% Let's now try a much bigger matrix (note that I use a semi-colon to suppress 
% output of it). Remember we can think of columns as being individual variables 
% that have been measured / observed and rows as being individual sample times.

A = rand(300,100);
size(A)

%% 
% Now, say we want to extract only a few variables (columns); say 1, 15, 25, 
% and 40. Define a vector of column numbers to 'keep.'

keep = [1 15 25 40]
A_keep = A(:,keep);  %again, the colon means all rows in the requested columns                    
size(A_keep)
%% 
% In looking at the size of the reduced matrix, we see that we indeed managed 
% to extract 4 complete columns. What if we wanted to keep every 5th column? Like 
% column 1, 6, 11, 16, etc.? It would be annoying to type that all out. So, create 
% a vector with two colons

keep = 1:5:100 %or you could use 1:5:end
A_keep = A(:,keep);
size(A_keep)

%You can do the exact same things in terms of extracting selected rows

%% Logical Indexing
% Remember that Matlab has 'boolean' functions that return a 0 or 1, depending 
% on if something is true or false. We can make use of this concept to extract 
% matrix elements depending on whether or not they satisfy some criterion. Let's 
% make up a matrix of numbers, again with columns representing variables and rows 
% representing sample or observation numbers.

clear
A = rand(10,5)

%% 
% Now, let's say that we want to look at only the samples (rows) in which variable 
% (column) number 3 is greater than 0.5. We can locate those rows with the find 
% command

I=find(A(:,3)>0.5)  % notice this is a column vector

%% 
% So, now, the I variable contains those row numbers. Let's subset our matrix 
% to keep only those rows (and we'll keep all columns in those rows)

A_keep = A(I,:)

%% 
% You can do this in a single step!

A_keep=A(find(A(:,3)>0.5),:)

%% 
% And, you can do this even without the find command!

A_keep=A((A(:,3)>0.5),:)

%% 
% We can get fancier by combining multiple criteria. For example, let's keep 
% the rows where variable (column) 3 is greater than 0.3 and less than 0.7

A
keepVector = find(A(:,3) > 0.3 & A(:,3) <= .7)  
A_keep = A(keepVector,:)

%% Concatenation
% Concatenation is all about taking matrices as building blocks and putting 
% them together to make larger matrices. Let's start by creating three matrices 
% of different sizes

clear all
data1 = rand(5,4)
data2 = rand(5,2)
data3 = rand(5,3)

%% 
% Now, let's try to concatenate them horizontally

%this next line will try to concatenate horizontally.
allData = [data1 data2 data3]

%% 
% Nice, that worked. What happens if we had semicolons in there?

allData = [data1; data2; data3]

%% 
% Yeah, that last try did not work. Understand why? The semi colon says 'new 
% line' so this attempt would create a matrix where the various rows would have 
% different numbers of columns, and that is not allowed. To further show that, 
% let's try horizontally concatenating matrices that have different numbers of 
% rows.

data1 = rand(2,3)
data2 = rand(2,3)
data3 = rand(3,3)

allData = [data1 data2 data3] %why does this not work?
