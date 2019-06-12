%%INPUT
X=[1 1 1 1
   0 0 1 1
   0 1 0 1];
d=[0 0 0 1];
W=[0.2 0.6 1];
speed=5;
times=20;
%%MAIN CODE
i=0;
while 1
    y=hardlim(W*X);
    error=d-y;
    W = W+speed*error*X';
    i=i+1;
    w1(i+1) = W(1);
    w2(i+1) = W(2);
    w3(i+1) = W(3);
    if (i>=times)
        break;
    end
end
%%OUTPUT
figure
subplot(2,1,1);
plot([0,0,1],[0,1,0],'o');
grid on;
hold on;
plot(1,1,'*');
axis([-0.5,1.5,-0.5,1.5]);
s = sprintf('%.2f+%.2f*x1+%.2f*x2 = 0',W(1),W(2),W(3));
title(s);
x = -0.5:.01:1.5;
y = x*(-W(2)/W(3))-W(1)/W(3);
plot(x,y);

subplot(2,1,2);
x = 0:i;
plot(x,w1,'o-');
grid on;
hold on;
plot(x,w2,'*-');
hold on;
plot(x,w3,'+-');
axis([0,20,-20,10]);
legend('b','w1','w2');
title('Trajectory');
hold off;



