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
