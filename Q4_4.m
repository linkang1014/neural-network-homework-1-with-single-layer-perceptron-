%% INPUT
epoch = 100;
X = [1 0.0
     1 0.8
     1 1.6
     1 3.0
     1 4.0
     1 5.0];
d = [0.5 1 4 5 6 8]';
W = [0.5;0.5];
speed = 0.2;

%% MAIN CODE
for n = 0 : epoch
    for i = 1:length(d)
        e = d(i) - X(i,:) * W;
        W = W + e * speed * X(i,:)';
        w1(n+1) = W(1);
        w2(n+1) = W(2);
    end
end
%% OUTPUT
figure;
subplot(2,1,1);
x = 0:epoch;
plot(x,w1,'-');
grid on;
hold on;
plot(x,w2,'.');
hold on;
axis([0,100,0,2]);
legend('b','w1');
title('speed=0.2 Trajectory of Weights');
hold off;

subplot(2,1,2);
plot([0 0.8 1.6 3 4 5],[0.5 1 4 5 6 8],'o');
grid on;
hold on;
axis([-1,6,-1,10]);
s = sprintf('speed=0.2 %.2f+(%.2f)*x1 = 0',W(1),W(2));
title(s);
x = -1:.01:6;
y = x*W(2)+W(1);
plot(x,y);