# Outline
Today we will cover many basics.

## Live Scripts
Ok, so your basic *script* is an .m file, which is just a simple text file. We can run this file, as we saw in week 1. There are also *live scripts* which are more of an *interactive* experience. You can insert equations, user *controls*, figures, and other things directly into the live script. It is very much like a python notebook in this regard. The one down side of live scripts is that they are binary files, not simple text. Let's do a quick test.

1. Open up *example_live_script1.m*. Run this file. Nice. By the way, make note of the %% symbols. These create individual *sections* of code. Click on one of these sections and note how it turns yellow. Look up in the ribbon of the editor and you will see a *run section* option. This will execute ONLY the commands in the current section, which can be very helpful. Try running the code all the way through, and then section-by-section.
2. Next, choose *save as* and save the file as a live script. This will create a binary file with a .mlx extension. Open this file. It will look a bit different.
3. Run the live script and you should see the variables and the figures appear directly in the code. You can alter where (in-line vs. at the side) where you want your figures to appear (look at the little icons at the far right edge).
4. NOTE: if you now try to run the original .m file, you will probably get an error. Weird, I know. Matlab does not like having two files of the same name (one a .m and the other a .mlx) in the same location. Shrug.
5. Open up *example_live_script2.mlx*. Run it. Check out the interactive controls. This is pretty slick. Also note the inserted equations.
6. Save this as a .m file. Open it up. Run it. This is pretty disappointing. So, live scripts, with fancy features will not convert to equivalent .m files.

## Numbers, Vectors, and Matrices
Open up *class2_1.m*. We will run through this section by section. It is all about how numeric data is stored in variables. Knowing where data are and how to access individual elements is critical.

## Other Data Types
Open up *class2_2.m*. We will look at strings, cell arrays, character arrays, and structures. As you will see, there are MANY options for how data are stored. There is no *right* way, there are just pros and cons. 
