function zprime=secondorder(x,z);

zprime=[z(2); -8*z(2)-2*z(1)+cos(x)];
