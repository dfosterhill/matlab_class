# Introduction to Matlab

Ok, here we are going to talk about the basic operation of Matlab. If you've seen / used Matlab before, this will be very much a review. 

## Basic Orientation

When you open Matlab you will see something like this:

![workspace](https://github.com/dfosterhill/matlab_class/blob/main/images/workspace.png) 

There are four basic panels:
1. *Left* - this is like Explorer or Finder. You see a list of folders / files that are located in your current folder. And, by the way, where does matlab 'start'? Great question, complicated answer. Depends on your operating system and how you set your preferences. There is some advantage to identifying some ‘userpath’ (e.g., ‘/Users/dfh/Documents/MATLAB’). And, simply store all of your files there! The advantage is that this userpath will ALWAYS be added to Matlab’s ‘path’ (more on that later). 
2. *Center* – this is your ‘command window,’ where you will spend most of your time. You can issue commands, run files, etc., from here.
3. *Upper right* – this is your ‘workspace’ listing. Here, you see a list of all variables that are presently defined. When you start Matlab (and have not yet done anything) this will be empty.
4. *Lower right* – this is your ‘command history.’ This is a super useful feature that keeps an archive / history of recently executed commands.

Across the top, you see a ‘ribbon’ style toolbar with many, many buttons. The appearance of this window, and this toolbar, will vary depending upon your particular platform (Mac, etc.). The exact appearance of the window is highly customizable. For example, use the ‘Layout’ dropdown to select a different configuration. Below, you will see that I have temporarily turned off the other panels, and left only the main one.

![main only](https://github.com/dfosterhill/matlab_class/blob/main/images/main_only.png) 

Above the command window, you will see a file path. This is your ‘home’ or ‘default’ directory. In Matlab lingo, it is called your Startup Folder. In your case, there might not yet be anything there. Every time you start Matlab, you will be taken there.

You can take advantage of this by creating a startup file (simple text file; not a .doc or .docx file) and placing it in your startup folder. Your startup file **must** be called *startup.m* and, in it, you can place instructions. For example, you might wish to add a certain directory to Matlab’s path (more on that later) every time your launch Matlab. Or, you can display something in the command window. For example, if my startup.m file contained the command:

*disp(‘Hello World’)*

Then you would see the image below every time you launched Matlab.

![hello world](https://github.com/dfosterhill/matlab_class/blob/main/images/hello_world.png) 

## Getting Help

So, what can you do, at any time, if you are stuck or confused? Well, you can simply type:

\> help


![help](https://github.com/dfosterhill/matlab_class/blob/main/images/help.png) 

If you click on the Help browser link, it will bring up a very extensive set of help pages for all of the various toolboxes in Matlab.

![help browser](https://github.com/dfosterhill/matlab_class/blob/main/images/help_browser.png) 

This is encyclopedic, but at times this can make it hard to find help on a specific command you are trying to use. If you know the name of the command you want to use, say the ‘plot’ command, you simply issue something like

\> help plot

![help plot](https://github.com/dfosterhill/matlab_class/blob/main/images/help_plot.png) 

You can similarly get help on a specific command by using the search box in the help browser:

![help plot browser](https://github.com/dfosterhill/matlab_class/blob/main/images/help_plot_browser.png) 

So, the help command is useful, but it is very narrowly focused, in that you seek help on a single function at a time. In other words, it won’t be a very good way to go about learning how to use Matlab in general. Fortunately, you can find tremendous online resources for Matlab, in the form on tutorials, user forums, user-contributed file archives, demos, and so on. Try:

\> help demo

and you will see that you can access demos by simply typing:

\> demo

![demo](https://github.com/dfosterhill/matlab_class/blob/main/images/demo.png) 

Here, a great number of (official) examples are categorized. Click on the ‘Basic Matrix Operations’ one to see one. A final place for you to explore is [Matlab Central](https://www.mathworks.com/matlabcentral/).

## Command Line Commands

Since we will be spending so much time ‘at the command line,’ it is worth saying a few things about it.  For anyone with a background in DOS or UNIX, this will be very comfortable terrain. A command line is a way that you can ‘do things’ with typed commands (in contrast to mousing and clicking). For example, you see the path, given right above the command window? Well, say I want to navigate ‘up’ one directory level? You can do this (several ways) with mouse clicks. Or, you can use a command line command, namely cd (‘change directory’)

\> cd ..

To get back to where you were (your home), use

\>cd MATLAB 

(or lower case matlab; here Matlab does not distinguish)

You can list your present directory with (‘print working directory’)

\>pwd
ans =

/Volumes/Mac_HD_2/dfh/Documents/MATLAB

Here, I have shown the output of the pwd command. Note the presence of ‘ans’ which stands for answer. Often, if you execute a command without assigning the output to a variable, Matlab will assign the output (in this case, the name of the present directory) to the variable ans.

You can show a directory listing with ls (short for ‘list’)

\>ls

TMD2.03		modulation.txt	scatter2.dat		untitled folder
data2.out		scalebar		startup.m
m_map		scatter.dat		tmp_tpxo6.2.mat

Here, the folders and the files are listed together, so it may not be immediately obvious to you which is which. You can use options with this command, and many others. Adding –a after the ls lists ‘all’, including typically hidden files. Adding –l after the ls will give you a more verbose listing (including file size, date last modified, etc.).

Another thing that is pretty neat, and that is common with UNIX is the retention of your command history. If you are using the default window layout, you will see your command history in the lower right. You can right click on any command and select ‘evaluate selection.’ This is a great way of repeating a command that you might have typed previously at the command line. Less typing!! Depending upon your keyboard configuration, you can also cycle through your previous command with the up and down arrows.

![history](https://github.com/dfosterhill/matlab_class/blob/main/images/history.png) 

You will have to spend some time learning all of the various command line commands. Many are common with UNIX, some are not. For example, you use

\>rm

in UNIX to remove a file. In matlab, you use the 

\>delete

command. CAUTION: depending upon your preferences settings, there may not be an ‘undo’ to this (there is NOT in UNIX). So, this is very different from moving things to the ‘trash.’

## Command Line vs. Scripts

Ok, so the command line is powerful. You can do a lot from it. For example, say we want to assign some numeric values to some variables (much more on variable types later (week 2)).

\>a=2

\>b=3

Great, we now have assigned values to the variables a and b. NOTE: you should see them appear in your ‘workspace’ window. Well, now we can do some math

\>a*b

ans =

     6

or, we can instead divide:

\>a/b

ans =

    0.6667

You can see that the output of the mathematical operation is being assigned to the (default) variable called ans. This is a real variable. To see this, multiply it by b

\>ans*b

ans =

     2

and we recover the value assigned to a. Well, this is all nice, but in the real world, we are going to be doing a lot of complex analysis and computation, so we do NOT want to have to re-type things into the command line all the time.  So, we can put commands into a ‘script,’ which is a simple text file, with a .m subscript.  For example, consider the following code, which I have already saved as a file (or 'script' or 'm-file') called [simple.m](https://github.com/dfosterhill/matlab_class/blob/main/scripts/week1/simple.m). 

%%%%%%  
%This is a really simple script  
% 2013 – D. Hill  
%%%%%%

a=2  
b=3  
a*b  
%%%%%%

If I type this text into the Matlab text editor, or any text editor and then save it as a file called ‘simple.m’ (w/o the quotes), I have just created a script. Note, in Matlab the % symbol is the comment symbol. Anything to the right of it (on that line) is not executed. So, to run this script, I simply navigate, in the Matlab window, to the folder where I saved it and then I type

\>simple  (leave out the .m)

When you do this, you should see the output:

a =

     2
  
b =

     3
  
ans =

     6

So, you see that our two variables got defined and we did some simple math. Now, since this was a simple script the output was relatively uncluttered. However, in a real situation, we do NOT want all of the internal steps written out as screen output. So, you need to learn to love the semicolon. NOTE: the semicolon has many, many very important uses in Matlab. If you go back to [simple.m](https://github.com/dfosterhill/matlab_class/blob/main/scripts/week1/simple.m) and place semi-colons at the ends of the first two lines, i.e. do this: 

%%%%%%  
%This is a really simple script  
% 2013 – D. Hill  
%%%%%%

a=2;  
b=3;  
a*b  
%%%%%%

you will get the following output:

ans =

     6
     
That's it for this week...welcome to the class...     
     
