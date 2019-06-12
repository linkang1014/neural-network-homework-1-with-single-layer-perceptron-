figure
plot([0,0.8,1.6,3,4,5],[0.5,1,4,5,6,8],'o');
grid on;
hold on;
axis([-1,6,-1,9]);
x = -1:.01:6;
y = x*1.47+0.555;
plot(x,y);