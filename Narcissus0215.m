m = 100:999;
m1 = rem(m,10);
m2 = rem(fix(m/10),10);
m3 = fix(m/100);
k = find(m==m1.^3+m2.^3+m3.^3)
s = m(k)