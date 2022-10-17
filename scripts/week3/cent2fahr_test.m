function out = multgauss(A,x)

% check on columns

%loop over rows

for j = 1:numrows
    output(j,:)=A(j,1)*gaussmf(x,[A(j,2:3)])
end

out = sum(output,1)
    