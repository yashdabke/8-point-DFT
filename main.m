clc;
clear all;
close all;
%input sequence
xn=input('Enter the input sequence=');
N=input('Enter the number of points=');
x=bitrevorder(xn);
%First stage butterflies
[a1,b1]=butterfly(x(1),x(2),0);
[a2,b2]=butterfly(x(3),x(4),0);
[a3,b3]=butterfly(x(5),x(6),0);
[a4,b4]=butterfly(x(7),x(8),0);
%Second stage butterflies
[e1,f1]=butterfly(a1,a2,0);
[e2,f2]=butterfly(b1,b2,2);
[e3,f3]=butterfly(a3,a4,0);
[e4,f4]=butterfly(b3,b4,2);
%Third stage butterflies
[X0,X4]=butterfly(e1,e3,0);
[X1,X5]=butterfly(e2,e4,1);
[X2,X6]=butterfly(f1,f3,2);
[X3,X7]=butterfly(f2,f4,3);
y=[X0,X1,X2,X3,X4,X5,X6,X7];
disp(y)
function[z,y]=butterfly(u,v,n)
z=u+(exp(-1i*2*pi*n/8)*v);
y=u-(exp(-1i*2*pi*n/8)*v);
end
