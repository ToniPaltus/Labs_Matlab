clc
clear all
close all

eps = 1e-6;
kk = 0;
pp = probability(kk);
while pp > eps
    kk = kk + 1;
    pp = probability(kk);
end

k = 0:kk+1;
p = probability(k);

size = 10000;
z = rand(1,size);
x = [];
for i = z
    S = i;
    j = 0;
    while S > 0
        j = j + 1;
        S = S-p(j);
    end
    x(end+1) = j - 1;
end

%Матожидание
mu_teor = 0;
mu_teor = sum(k.*p);
mu_pract = mean(x);
disp("Теоретическое математическое ожидание - " + num2str(mu_teor));
disp("Практическое математическое ожидание - " + num2str(mu_pract));

%Дисперсия
disp_teor = 0;
disp_teor = sum(k.*k.*p)-mu_teor^2;
disp_pract = var(x);
disp("Теоретическая дисперсия - " + num2str(disp_teor));
disp("Практическая дисперсия - " + num2str(disp_pract));

%График
c = 0:max(k);%Вектор центров карманов для бесконечного распределения
hist_x = hist(x,c);%. Оценка распределения вероятностей дискретной случайной величины
figure()
title("Распределение вероятностей");
hold on;
bar(c, hist_x./size);
plot(c, probability(c), "r");
grid on;
hold off;

%Критерий кси^2
ksi = 0;
ksi_teor = chi2inv(0.95, 14);

ex = [];
th = [];
for i = 1:14
    ex = [ex hist_x(i)];
    th = [th size*p(i)];
    ksi = ksi + (hist_x(i)/size - p(i))^2/p(i);
end
sum_p = sum(p(1:14));
pp = 1 - sum_p;
hh = sum(hist_x(15:end));
ex = [ex hh];
th = [th size*pp];
ksi = ksi + (hh/size - pp)^2/pp;
ksi = ksi*size;
disp("Критерий согласия X^2: " + num2str(ksi) + " < " + num2str(ksi_teor));
