# Week 10

Ok, nice work. You made it. For this week, I have a rather disconnected set of topics to cover before sending you off into your programming future.

## Fetching Online Data

A huge amount of programming for graduate school (and other) boils down to (1) obtaining data, (2) doing stuff with that data, and (3) telling a compelling story about that data, through figures and other means of communication. Let's start with [this live script](week10_ftp.mlx) that deals with grabbing data from HTTPS sites via webread / websave commands.

A second way of obtaining data is to pull or scrape it directly from a website. What I mean by this is pulling simple text data. Many agencies have ways through which you can query data and create a simple webpage that contains that data as ascii text. Then, you can directly save that data. Well, with Matlab, if we can figure out HOW to create an automatic query and then directly save the data, we can use a simple program to skip the web browser entirely and grab the data. This is a huge accomplishment that will save you tons of time. So, visit [this live script](week10_urlwrite.mlx) to see an example based on USGS streamflow data.

## netCDF Data Files

We have already talked about different types of data files (ascii text vs. binary; ESRI Ascii grids vs. csv files vs. spreadsheet files, etc., etc.). In the world of binary files, there are a lot of choices out there. NetCDF is one popular choice. So, let's explore why, and what they look like with [this live script](week10_netcdf.mlx).

## Interactive Apps

And finally. During the term, we have often use .m files, which are simple clear text files. We have also used .mlx files, which are binary files that allow us to include graphics, figures, equations, and blocks of code. Recall that we were able to build in some limited interactivity with the live scripts.

Matlab also allows you to create standalone 'apps.' These apps give you almost unlimited interactivity with any kind of widget (button, slider, dropdown, etc.) you can think of. In this folder, I include [tempdata.mlapp](tempdata.mlapp) and [tempdata_exported.m](tempdata_exported.m), both of which allow you to explore a netCDF data file and alter how it is plotted. So, we will end the class today by experimenting with those a bit.

Best wishes for your programming future!
