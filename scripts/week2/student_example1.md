# In-Class Example 1

You can make 3-d (or higher) matrices in Matlab. Think of a 'cube' of data made up of a series of checker-boards or grids stacked up on top of each other. From an environmental data point of view, you could have gridded temperature data on a daily basis. Here the latitude and longitude values are the 'row' and the 'column' values. And then the 'time' would be the third dimension of your data cube.

* Please create the three dimensional matrix B that has the following values as the first *time slice*. In the cell below, I show you how to do this. Note that the semi-colon here is essentially a 'new row' command. And note that the square brackets on the right side are required.
```math
\begin{bmatrix}
4 & 2 \\
3 & 1 
\end{bmatrix}
```
`B(:,:,1)=[4 2; 3 1]`
* For the second time slice, use the following values:
```math  
\begin{bmatrix}
6 & 7 \\
5 & 8 
\end{bmatrix}
```

* And, for the third time slice, use the following:
```math  
\begin{bmatrix}
12 & 9 \\
11 & 10 
\end{bmatrix}
```
## Additional Tasks
-Experiment with the 'sum' command on this matrix. Can you sum over all three dimensions? Experiment and check the math manually to convince yourself that you understand how the sum command actually works.
-Experiment with the difference between addressing with indices vs subscripts. For example, how do you 'access' the information stored in the location where the '9' is. Can you do this with subscripts? How many subscripts do you need? Can you do this with an index? Look at the help menu for ind2sub and see if you can print out the subscripts and also the value of the number located at the 11th location (index) of this 3-d matrix.
