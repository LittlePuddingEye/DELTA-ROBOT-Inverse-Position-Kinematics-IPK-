function pose=pathCal(n,r)

p=4*pi/n;
t = 0 : p : 4 * pi;
x = r .* cos(t);
y = r .* sin(t);
z = 10*t;
pose=[x',y',z'-400];
end