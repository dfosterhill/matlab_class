function out=shoot_test(in,y1_init,y1_final);

[X,Y]=ode45('shoot_test_2',[0 1],[y1_init in]);
sz=size(Y);
out=abs(y1_final-Y(sz(1),1));