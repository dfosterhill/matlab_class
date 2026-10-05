% Week 2 - Example 1 - Solution

%construct the 3-d matrix.

B(:,:,1)=[4 2; 3 1];
B(:,:,2)=[6 7; 5 8];
B(:,:,3)=[12 9; 11 10];

%sum down the columns
sum_col=sum(B,1)

%sum across the rows
sum_row=sum(B,2)

%sum in the third dimension
sum_3=sum(B,3)

%access the 9 via subscripts...note that it is in row 1, colum 2, and
%'slice' 3
value=B(1,2,3)  %this works; I got the 9.

%let's turn these subscript values into an index
ind=sub2ind(size(B),1,2,3)
value2=B(ind)  %this works, I again got 9
