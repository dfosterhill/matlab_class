# Week 5
This week we are going to talk about graphics. This is a vast topic and we will only scratch the surface. Bottom line is that it is imperative that you design well-thought-out and effective graphics in order to communicate a result / conclusion to your audience. In Matlab, there are zillions of different graphics scripts available to you, based, in part, on whether or not you are plotting 1-d, 2-d, 3-d data, and so on. 

I view the creation of every single figure I make for a journal article as its own *programming task*. I will create one script per figure whose only job is to load in data, make a plot, and then export the figure at a desired resolution and in a desired file format. You want all of these tasks to be fully automated so that, if you ever need to make changes in a figure, it is an easy thing to do!

## Different Types of Plots
Let's start with [this live script](class5_1.mlx) in order to explore some of the basics having to do with line, surface, and volume plots and also how we make *changes* to the default settings in Matlab graphics. 

Part of the way through that live script, you'll be directed to an [exercise](student_example1.md) to see if you can figure out how to make a simple plot and change some settings of the plot.

## Animations and File Export
Animations can be very effective. Really...they are just a bunch of still images stitched together. In Matlab, creating animations can be a bit tricky...you have to consider optimal file format (avi? mpg? mp4? omg....) and things like frame rate, and so on. But let's take a quick look via [this script](class5_2.m). In that script, at the end, we will also cover the best ways for exporting your graphics so that they are attractive and appropriately sized.
