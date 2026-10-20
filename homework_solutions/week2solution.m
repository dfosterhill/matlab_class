%CE 640 / OC512
%HW 2 Solutions

clear all
clc

%% 1
disp('Problem 1')
x=linspace(6,39,100)

%% 2
disp('Problem 2')
y=[-3:.25:12]'

%% 3
disp('Problem 3')
x=0:1:5;
y=[x; 2*x; 3*x+10]

%% 4
disp('Problem 4')
A=[3 5 8; 6 37 1; 2 8 6];
c=A(3,:)
d=A(:,2)
e=A(1:2,:)
f=A([1 3],[1 3])

%% 5
disp('Problem 5')
B=sort(A) %this will sort each column separately
C=sort(A,2) %this will sort each row separately

%% 6
disp('Problem 6')
C=[6 7; 2 9]; D=[-9 3; 7 5];
E=C+D
F=C-D
G=C.*D  %the . is required!!
H=C./D  %the . is required!!
I=[C; D]
J=[C D]

%% 7
disp('Problem 7')
A={'matlab','simulink';[3 9; 8 2], [2;8;5]}
A{1,1}(4)
A{1,2} %as char
A(1,2) %as cell
A{2,1}(2,1)
A{2,2}(2)

%bonus below...'deal' is a cool function
[a,b,c,d]=deal(A{:}) %this is pretty slick...

%% 8
oc512student(1).firstname='Greg';
oc512student(2).firstname='Mary';
oc512student(1).lastname='Jones';
oc512student(2).lastname='Smith';
oc512student(1).examscore=[96 95];
oc512student(2).examscore=[87 75];

ce640student(1).firstname='Fiona';
ce640student(2).firstname='Tessa';
ce640student(3).firstname='Josie';
ce640student(1).lastname='Hill';
ce640student(2).lastname='Hill';
ce640student(3).lastname='Hill';
ce640student(1).examscore=[100 100];
ce640student(2).examscore=[100 100];
ce640student(3).examscore=[100 100];

combinedstudents=[oc512student ce640student]




