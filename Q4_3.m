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
speed = 0.01;

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
plot([0 0.8 1.6 3 4 5],[0.5 1 4 5 6 8],'o');
grid on;
hold on;
axis([-1,6,-1,10]);
s = sprintf('Comparation');
title(s);
x = -1:.01:6;
y1 = x*W(2)+W(1);
y2 = x*1.47+0.555;
plot(x,y1);
hold on;
plot(x,y2,:);
legend('point','y1(LMS)','y2(LLS)');
