% Week 4 - Example 2 - Solution

clear all
home

%I am doing this with tables
LastName={'Hill';'Hill';'Stephenson';'Hill'};
FirstName={'Chuck';'Constance';'Linda';'Charles'}
yr=[1939;1940;1965;1970];
mo={'February';'April';'November';'March'};
da=[25;8;28;29];

%construct the table
T=table(LastName,FirstName,yr,mo,da);

%write the table
writetable(T,'test.txt')

