%hw3 solution
%ce640/oc512
%dfhill
%oregon state university...

%Define domain and the parameters for the four gaussians...

x=linspace(0,20,100);
amps=[0.1 0.5 1 2]';
Cs=[2 4 6 8]';
sigmas=[0.5 1 2 3]';
beta=[amps Cs sigmas];
y=multgauss(x,beta);

figure(1)
plot(x,y)
xlabel('x');ylabel('y');title('sum of 4 gaussians')