clc
clear all
close all

size = 1000;%количество событий
N = 10000;% количество потоков

T0 = 0;
T = 4;

lambda = 2;

x = zeros(N, size);

for i=1:N
    t = T0;
    j = 1;
    while 1
        z = rand;
        t = t - log(z)/lambda;
        if t>T
            break;
        end
        x(i,j) = t;
        j = j + 1;
    end
    i = i + 1;
end

% Интенсивность
m = 10;%Кол-во подынтервалов
step = (T-T0) / m;
c = T0 + step/2:step:T - step/2; 
hist_x = zeros(1, m);
for i=1:N
        hist_x = hist_x+hist(x(i, x(i,:)>0) ,c);
end

lambda_exp = zeros(1,m);
for i=1:m
    lambda_exp(i) = hist_x(i)/(N*step);
end

lambda_teor = zeros(1, m);
for i = 1:m
    lambda_teor(i) = lambda;
end

figure()
hold on;
title("Интенсивность");
bar(c, lambda_exp);
plot(c,lambda_teor, "r");
hold off

%распределение числа событий случайного потока
%на интервале наблюдения
n = zeros(1, N);%вектор, содержащий число событий,
%полученных в каждой отдельной реализации потока
for i=1:N
    n(i) = length(x(i,x(i,:)>0));
end

k = 0:1:max(n);%вектор, содержащий возможное число событий в потоке
Nk = hist(n,k);%количество смоделированных реализаций случайного потока

Pk = Nk/N;

figure()
hold on;
title("Распределение числа событий случайного потока")
xlabel("Число событий");
ylabel("Вероятность");
bar(k, Pk);%практическое распределение
plot(k, poisspdf(k,lambda*T));%теоретическое распределение. Параметр пуассона - интеграл от интенсивности
hold off;