# In-Class Example 2
I would like you to write a function that solves the quadratic formula. As a reminder, the quadratic formula is:
```math
ax^{2} + bx + c = 0.
```
The solutions to the quadratic formula are:
```math
x1 = \frac{[-b + \sqrt{b^2 - 4ac}]}{2a}
```
and
```math
x2 = \frac{[-b - \sqrt{b^2 - 4ac}]}{2a}
```
So, your function should accept three arguments (a, b, and c). And, it should return two values (x1 and x2). Note, all of the above examples returned only one argument, since they were written like:

> function output = functionname(input1, input2, ....., input_n)

You can generalize this in the following way:

> function [output1, output2] = function(input1, input2, ...)

Good Luck! When you are done, test out some values to ensure that it is working properly. NOTE: Please do not use the 'roots' function to do this. I am looking for you to practice basic coding, not leverage higher functions.
