% Week 2 - Example 2 - Solution

%construct the matrix
A=rand(10,8)

%locate values that are > 0.4 and < 0.6. The syntax below will return row
%and column subscripts into I and J
[I,J]=find(A > 0.4 & A < 0.6)

%convert to indices
K=sub2ind(size(A),I,J)

%extrace the values
values=A(K)