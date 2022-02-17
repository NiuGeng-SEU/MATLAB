xm = 'Southeast Unviersity';
xm(1:3);

ch = ['abcdef';'123456']
ch(2,3);

ch = 'ABc123d4e56Fg9';
subch = ch(1:5)
revch = ch(end:-1:1)
k = find(ch>='a'&ch<='z')
ch(k) = ch(k)-('a'-'A')
length(k)