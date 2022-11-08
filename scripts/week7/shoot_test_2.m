function out=shoot_test_2(x,in)

y1=in(1);
y2=in(2);

out(1,1)=y2;
out(2,1)=(10*x+5).*y2-10*y1;
