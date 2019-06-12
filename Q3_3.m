%%INPUT
X=[1 1
   0 1];
d=[1 0];
W=[0.3 0.6];
speed=0.1;
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
    if (i>=times)
        break;
    end
end
%%OUTPUT
figure
subplot(2,1,1);
plot([0,1],'o');
grid on;
hold on;
plot(0,0,'*');
axis([-0.5,1.5,-0.5,1.5]);
s = sprintf('%.2f+%.2f*x= 0',W(1),W(2));
title(s);
x =-W(1)/W(2);
plot([x x],[-0.6 1.1]);

subplot(2,1,2);
x = 0:i;
plot(x,w1,'o-');
grid on;
hold on;
plot(x,w2,'*-');
axis([0,20,-1,1.5]);
legend('b','w1');
title('Trajectory');
hold off;