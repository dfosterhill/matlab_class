% goodCodingPractice.
%
%  The following illustrates some of the ideas for good coding,  in
%  terms of compute speed, good memory usage and clean code (elegant!).
%  These are just some of the ideas

%%

% 1.  pre-allocate large arrays
% Bad approach since the matrix foo is continuing to increase. Matlab does
% not like this. It is far better if you can, up front, establish an empty
% matrix of the maximum size you expect and then fill it in. Let's check
% out the times that it takes for the two options below to run.

clear all
clc
tic
for i = 1: 1000
    for j = 1: 1000
        foo(i,j) = i*j;         % some phony operation
    end
end
t1=toc

% use checkcode to realize you should pre-allocate the array foo
% checkcode(filename) is the syntax you use at the command line. It returns
% a lot of the same information that you can find in the warnings at the
% right hand side of the matlab editor...

clear all
tic
foo = zeros(1000,1000);
for i = 1: 1000
    for j = 1: 1000
        foo(i,j) = i*j;         % some phony operation
    end
end
t2 = toc

%%
% 2.  exploit matrix computations.  We have beaten this to death and the
% need is not as bad as in previous versions because matlab now compiles
% loops on the first pass.  However it remains a good coding practice to
% use vectorized code.

%super simple example
clear all
clc

%here is a 'non-vectorized' version.
tic;
for i=1:50000
    a(i)=sin(i);
end
disp('here is the elapsed time for the non-vectorized way')
toc

%here is the same thing, vectorized. On my Mac, this second one is a full
%order of magnitude faster.
tic;
a=sin([1:50000]);
disp('here is the elapsed time for the vectorized way')
toc

disp('hit key to continue')
pause

%Let's look at a 2d example.
% example: matrix multiplication
clc
A = rand(100,70);
B = rand(70, 40);

% not good. Here we are doing a double loop.
tic
C = zeros(100,40);
for i = 1: size(A,1)
    for j = 1: size(B,2)
        for k = 1: size(A,2)
            C(i,j) =  C(i,j)+A(i,k)*B(k,j);
        end
    end
end
disp('here is the elapsed time for the non-vectorized way')
toc

% much better
tic
C2 = A*B;
disp('here is the elapsed time for the vectorized way')
toc

% check for same results
I=find(C-C2~=0);
length(I);  %if the length of I is zero, then the two results are perfectly equal

%%
% 3.  use logical addressing and find.  Example - zero out rows for which
% column 1 is < 0.5. Basically, this example shows you that it is preferred
% to avoid if statements where you can.

clear all
clc

foo = rand(8000,4000);

% not good
tic
for i = 1: size(foo, 1);
    if foo(i,1)< 0.5
        foo(i,:) = 0;
    end
end
toc

% better
foo = rand(8000,4000);
tic
foo(foo(:,1)<0.5,:) = 0;
toc

%%

% 4. Matrix solution. Au = b is often something we wish to solve for u. We
% know that u = A^(-1)b, if A is a regular matrix.
clear all
clc

%slow way
tic
n = 2e3;
A = rand (n,n);
b = rand (n ,1);
u = inv(A)*b;
toc;

%fast way
tic
n = 2e3;
A = rand (n,n);
b = rand (n ,1);
u = A\b;
toc

%%

% 5. Sparse matrices. In many applications, we end up with a huge matrix,
% with most elements equal to zero. For example, in finite-difference
% approximations to differential equations. In these cases, the diagonal
% and a few elements to each side will be nonzero. Sparse matrices in
% matlab save a TON of memory.
clear all 
clc

C=speye(5000); %sparse identity matrix
C2=eye(5000); %identity matrix (much larger!)
whos C C2

figure
spy(C,'o') %plots 'sparsity pattern' (non zero elements)
axis([1 10 1 10]) %zoom in so we can see.

% Note: it is also faster to do stuff with sparse matrices!

%slow
tic
n = 1e4;
h = 1/(n +1);
A = zeros (n,n);
A(1 ,1) = 2;
A(1 ,2) = -1;
for i=2:n -1
A(i,i -1) = -1;
A(i,i ) = 2;
A(i,i+1) = -1;
end
A(n,n -1) = -1;
A(n,n) = 2;
A = A / h^2;
b = ones (n ,1);
u = A\b;
toc

%fast
tic
n = 1e4;
h = 1/(n +1);
e = ones (n ,1);
A2 = spdiags ([-e 2*e -e] ,...
[-1 0 1] ,...
n, n );
A2 = A2 / h^2;
b = ones (n ,1);
u2 = A2\b;
toc

%type A(1:5,1:5) at command prompt. Compare this to A2(1:5,1:5)





