A = fix(10+(99-10+1)*rand(5));
B = sqrt(0.1)*randn(5)+0.6;
I = eye(size(A));
if((A+B)*I==I*A+B*I)
    'yes'
end