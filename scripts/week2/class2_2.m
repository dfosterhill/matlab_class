%% Week 2 Part 2 - Matlab Class
%% Dave Hill
% This will look at strings, string functions, and other useful data types. 
% What we saw in the previous section was pretty much all about numbers (integers 
% and floating point)

clear all
%% String Basics
% Ok, to this point, most of what we have talked about has dealt with vectors 
% and matrices of numeric values (either integer or floating point). We definitely 
% have need to work with other data types, however. A string is simply a sequence 
% of alphanumeric characters. Let's try!

t = 'This is a character string'
%% 
% Um, ok, that was easy. But, what 'size' is this variable?

size(t)
%% 
% Can we access a certain element of this string variable? Say, the 3rd one?

t(3)
%% 
% Nice. Can we grab a series of elements, say the first seven?

u = t(1:7)
%% Converting Between Data Types
% Can we convert between a string and an integer? What happens (ummmm...) if 
% we try to convert the variable t to an integer?

int8(t)
%% 
% Yeah, no. In matlab, a string is really a vector that contains numeric codes 
% for the characters. Codes 0 to 127 are ASCII. So each 'letter' or 'character' 
% is mapped to an integer. Not super helpful. Ok, let's stick to numbers. Can 
% numbers be strings and vice versa?

t='4'       %string? number? Try issuing a >>sqrt(t) command and find out
%% 
% So, is t a string? Is it a number? Can we do math on it?

sqrt(t)
%% 
% Nope, that didn't work. t is the 'string' 4 and not the number 4. But, we 
% can switch back and forth!

sqrt(str2num(t))    %that should work
%% Combining Strings
% Next, we can concatenate strings, just like we can concatenate vectors and 
% matrices.

var1='Have ';
var2='a ';
var3='good ';
var4='day!';
var5=[var1 var2 var3 var4]
%% 
% Nice. We simply combined the individual strings within square brackets. There 
% are built in functions in Matlab for doing this, like 'strcat' (string concatenation)

var6=strcat(var1,var2,var3,var4) %strcat removes trailing spaces, beware!
%% String Functions
% A strange caveat; here Matlab removed the trailing spaces in var1, var2, and 
% var3. Finally, there are TONS of 'string functions' in Matlab. Type 'help strfun' 
% at the command prompt. Find, compare, replace, the list goes on...Here is a 
% simple example of 'strcmp' which is a boolean function that compares two strings. 
% See if you can figure out why this one comes back false.

var1='string'
var2='String'
strcmp(var1,var2)   %not equal...
%% Character Arrays
% So, 'arrays' or 'matrices' in matlab are a powerful concept. We are basically 
% storing information (often numbers) in various 'boxes' that make up a rectangular 
% grid (so many columns by so many rows). The usual matrix in Matlab is not really 
% well equipped for storing strings, however. So, we can use character arrays 
% to accomplish this. Let us start looking at ways to put strings together into 
% arrays, like we did with numbers...

variablenames = char('Al','Si','Fe','Mn','Cu','Ni','Zn','Ba','K')
%% 
% The char function is the key here. It creates the character array. Each 'location' 
% in the array stores exactly one character.

size(variablenames) 
%% 
% Note from the output of the size function that it pads with blanks. So, the 
% last entry has a 'K' followed by a space. Now, we can easily access parts of 
% this array.

['element ',variablenames(9,:)]
['element ',variablenames(8,:)]
%% 
% Let's consider the following example. Assume that we have 12 data files, containing 
% some scalar variable of interest for each month of the year. It might be possible 
% to have the files named like jan.dat, feb.dat, mar.dat, and so on. We could 
% load (more on loading in a few weeks) each data file by 'hard coding' (writing 
% out each one) it in to our code. In other words, we would write out commands 
% to load jan.dat feb.dat, and so on. That is a bit inelegant. It might be nice 
% to instead store the file names (or parts of the file names) in a matrix of 
% sorts, where each entry refers to a give month. We can do this with a character 
% array.

months = char('jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec')
file1 = [months(8,:),'.dat']
%% 
% Ok, that worked nicely. But, remember our problem with padded blanks? What 
% if we had:

months = char('january','february','march','april','may','june','july','aug','september','october',...
    'november','december')
file2 = [months(8,:),'.dat']
%% 
% Ugh. That's no good. You could use deblank (only works on trailing blanks, 
% not leading blanks...)

file3=[deblank(months(8,:)),'.dat']
%% 
% Here is one more way of doing this, which is pretty cool. Here, we are going 
% to use logical indexing to keep only the portions of the string (file2) that 
% are not blank. Regarding logical functions note that the ~ symbol means 'not' 
% in Matlab

I=find(file2~=' ')
file4 = file2(I)
%% Cell Arrays
% Cell arrays are another cool trick. Regular matrices are limited to numeric 
% values. Strings and character arrays are limited to string values. Cell arrays 
% allow you to mix data types in a single 'container.' This is incredibly flexible. 
% Note that things get really tricky here, in terms of what type of 'bracket' 
% you have to use to access certain information. Let us begin by creating a Cell 
% array.

C={'one','two','three'; [1 2], 2, 3} %can store a MIX of data types
%% 
% Now, use curly braces to access a particular entry. Remember, Matlab counts 
% down a column first, then moves over to the next one.

C{2}
C{3}

%% 
% And, we use smooth braces to access sets of cells. This is pretty much like 
% how we would access a subset of a numeric matrix.

C(1:2,1:2)
%% 
% Here is where it gets super confusing. We can use a combination of these to 
% access a portion of an entry in a particular location.

C{1}(2)
C{2}(2)
%% 
% So, we could use cell arrays to solve our cell array problem of having strings 
% (months) of varying lenghts. Let's build the array and print it to the screen.


%so, could solve problem of varying month string lenght. Build of a cell
%array containing the 12 months. When it prints to the screen note that
%there are no 'blanks'. Each entry has its own lenght. This is a huge
%improvement.

months = {'january','february','march','april','may','june','july','aug','september','october',...
    'november','december'}
%% 
% Note when it prints to screen there are no longer any trailing blanks. Each 
% entry (row) has its 'own' length, and that is not something that you can do 
% with cell arrays. So, how do we access a particular entry and build the file 
% name? Easy:

file=[months{8},'.dat']
%% Structures
% Structures are yet ANOTHER cool trick; a way of grouping together data, of 
% potentially varying types, that belong together. I use structures ALL. THE. 
% TIME. We can create structure 'fields' with the period. What follows the period 
% is the field name. Then, we can assign a value to that field. Below, we build 
% a structure that has three fields, and two entries (values) per field.

student(1).firstname='Greg';
student(2).firstname='Mary';
student(1).lastname='Jones';
student(2).lastname='Smith';
student(1).examscore=[96 95];
student(2).examscore=[87 75];
%% 
% Take a look at what is inside:

student
%% 
% If we type the name of a particular field it will display the entries for 
% that field.

student.firstname
%% 
% If we use (  ) notation after the structure name but before the period, you 
% can access a specific entry of a field

student(1).lastname
%% 
% If you use (  ) notation both before and after the period you can access a 
% subset of an entry.

student(1).lastname(1:3)
student(1).examscore(1)
%% 
% Note that you can 'nest' structure fields. We COULD have done student.name.last 
% and student.name.first.
%% 
% One last time, look at an option for storing and accessing numerous data file 
% names

clear months
months(1).name = 'january';
months(2).name = 'february';
months(3).name = 'march';
months(4).name = 'april';
months(5).name = 'may';
months(6).name = 'june';
months(7).name = 'july';
months(8).name = 'aug';
months(9).name = 'september';
months(10).name = 'october';
months(11).name = 'november';
months(12).name = 'december';

months
months.name
file1=[months(8).name,'.dat']