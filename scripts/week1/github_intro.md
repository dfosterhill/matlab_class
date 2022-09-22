# Git
Ok, so GitHub, Git, GitHub desktop...what gives? Git itself is a *version control* system. It allows you keep track of various versions of text files that you create. In the context of programming, this is a good thing. It prevents you from having files named like: 'mycode.m', 'mycodeV2.m', 'mycodeV3.m' and so on. With Git, all changes that you (and possibly other people) make are kept track of, so you can always go back in time and recover previous work. I **highly** encourage you to use Git as you develop codes for your research and other work.

# GitHub
So, what is github.com? Well, you don't have to use it, first of all. But, it is cool if you do. You can use github.com to store your *repositories* (think folders or directories) of code online. And, you can then share these with other people (if you want). This enables collaboration, which is great. Git and github.com interact with each other. As you make changes to codes on your computer, you can *push* those changes to github.com. In this way, all of your latest code developments are immediately (once you push them) propagated to your online repos. And, if you work on your codes on two different computers, you can *pull* down your latest changes to each machine at any time.

# GitHub Desktop
Git, by itself, is something you interact with through a terminal window (command window). Some people like this, some people hate this. If you hate it, you can use GitHub Desktop, which is pretty intuitive. GitHub Desktop will take care of the interactions with github.com and, in this way, you can keep all of your repositories up to date!

# Examples

## Create a Repository with GitHub Desktop
1. In GitHub Desktop (GD), choose File -> New Repository. Give it a name and a description. Choose the location (on your machine) where you want it. **I suggest** you choose the readme option. Click create. If you go look at your local machine, you should now see a new folder. It will be empty.
2. In GD, you will now see a blue button called *Publish Repository* If you choose this, it will push this new repo to your github.com account.
3. When this is done, in GD, you should see a *View on Github* button. If you click that, it will take you to github.com where you can view your new repository. Congratulations.
4. On github.com, you will now see a green button that says *Add a Readme*. Click on that, and add some useful text about what this repository of yours is all about.

Ok, cool. We have created a repository on our local machine. We have pushed this repository to github.com. But, right now, it is empty. So, let's make some files.

## Create a new File with github.com
1. In your repository, click *Add File* and then *Create New File*.
2. Give it a name, and add some content.
3. Scroll down, add any comments that you want, and then click *Commit New File*.
4. At your repo listing, you will now see the new file.
5. Go back to GitHub Desktop and click *Fetch Origin*. You will see some information about new things. Click on the blue *Pull Origin* button, and all of the changes you made at github.com will now come down to your local machine. To test this, go visit that folder and use a text editor to open up the new file that appears there.

## Modify an old File Locally
1. Open up the file you just created using a simple text editor. Add a few new lines to it. Save it.
2. Go back to GitHub Desktop. You will see some interesting things. The *green* items are additions to the file.
3. Click the *Commit to Main* button.
4. Click the *Push to Origin* button.
5. Click the *View on GitHub* button, and you will see that your account now shows the modified files.

## Create a new File Locally
1. Open up a a simple text editor. Add a few new lines to it. Save it.
2. Go back to GitHub Desktop. You will see some interesting things. The *green* items are additions to the file.
3. Click the *Commit to Main* button.
4. Click the *Push to Origin* button.
5. Click the *View on GitHub* button, and you will see that your account now shows the modified files.

# How to Use GitHub for this Class
1. Go to the [class website](https://github.com/dfosterhill/matlab_class).
2. Copy the URL, got to GitHub Desktop and choose *File* -> *Clone Repository*.
3. Choose the URL option, and paste in the URL you copied. 
4. Choose the local path where you wish to put this cloned repo. Click *Clone* and you are done!

NOTE: So, each week, I will put new notes / scripts / assignments into this repo. All you need to do each Monday or Tuesday is to go *fetch* and *pull* the new information to your cloned repo. That is it!
